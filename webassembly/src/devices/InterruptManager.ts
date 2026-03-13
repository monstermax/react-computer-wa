
import { MEMORY_MAP } from "../memory_map";


export class CpuCoreInfo {
    cpu: number = 0;
    core: number = 0;

    constructor(cpu: number=0, core: number=0) {
        this.cpu = cpu;
        this.core = core;
    }
}


export class InterruptManager {
    static type: string = 'system';
    public enabled: u8 = 0;      // IRQs activées
    public pending: u8 = 0;      // IRQs en attente
    public mask: u8 = 0;         // IRQs masquées
    public handlerAddr: u16 = MEMORY_MAP.OS_START; // Default handler
    public defaultIrqCpuHandler: CpuCoreInfo;
    public irqsCpuHandler: Map<u8, CpuCoreInfo>;


    constructor() {
        this.defaultIrqCpuHandler = new CpuCoreInfo(0, 0)
        this.irqsCpuHandler = new Map;
    }


    // Demander une interruption (appelé par les périphériques)
    requestInterrupt(irq: u8): void {
        //console.log(`🔔 IRQ ${irq} requested (current pending: 0b${this.pending.toString(2).padStart(8, '0')})`);

        if (irq < 0 || irq > 7) {
            console.warn(`Invalid IRQ number: ${irq}`);
            return;
        }

        this.irqsCpuHandler.set(irq, this.defaultIrqCpuHandler);

        this.pending = (this.pending | (1 << irq)) as u8;
        //console.log(`🔔 [IRQ ${irq}] New pending: 0b${this.pending.toString(2).padStart(8, '0')}`);

        //this.emit('state', { pending: this.pending })
    }


    // Vérifier si une interruption est prête
    hasPendingInterrupt(): boolean {
        const active = this.pending & this.enabled & ~this.mask;
        return active !== 0;
    }


    // Obtenir l'IRQ la plus prioritaire en attente
    getPendingIRQ(callerCpuIdx?: number, callerCoreIdx?: number): u8 {
        const active = this.pending & this.enabled & ~this.mask;

        if (active === 0) return 0xFF; // No pending IRQ

        // Priorité simple: bit le plus bas (IRQ 0 = plus haute priorité)
        for (let irq = 0; irq < 8; irq++) {

            // envoyer l'IRQ à 1 seul CPU et 1 seul core
            const irqCpuHandler = this.irqsCpuHandler.get(irq as u8)
            if (typeof callerCpuIdx  !== 'undefined' && irqCpuHandler && callerCpuIdx  !== irqCpuHandler.cpu) continue;
            if (typeof callerCoreIdx !== 'undefined' && irqCpuHandler && callerCoreIdx !== irqCpuHandler.core) continue;

            if (active & (1 << (<u8>irq))) {
                return irq as u8;
            }
        }

        return 0xFF; // No pending IRQ found
    }


    // Fonction pour le CPU pour acquitter
    acknowledgeInterrupt(irq: u8): void {
        this.pending = (this.pending & ~(1 << irq)) as u8;
        //console.log(`✅ IRQ ${irq} acknowledged - Pending: 0b${this.pending.toString(2).padStart(8, '0')}`);

        //this.emit('state', { pending: this.pending })
    }


    read(port: u8): u8 {
        switch (port) {
            case 0x00: // INTERRUPT_ENABLE (0xFF40)
                return this.enabled;

            case 0x01: // INTERRUPT_PENDING (0xFF41)
                // Retourne seulement les IRQs qui sont:
                // 1. En attente (pending)
                // 2. Activées (enabled) 
                // 3. Non masquées (mask)
                return (this.pending & this.enabled & ~this.mask) as u8;

            case 0x02: // INTERRUPT_ACK est write-only, retourne 0
                return (0) as u8;

            case 0x03: // INTERRUPT_MASK
                return this.mask;

            case 0x04: // INTERRUPT_HANDLER_LOW
                return (this.handlerAddr & 0xFF) as u8;

            case 0x05: // INTERRUPT_HANDLER_HIGH
                return ((this.handlerAddr >> 8) & 0xFF) as u8;

            case 0x06: // INTERRUPT_CPU_HANDLER
                return 0 as u8 // Write-only (a revoir)

            case 0x07: // INTERRUPT_CORE_HANDLER
                return 0 as u8 // Write-only (a revoir)

            default:
                return 0 as u8;
        }
    }


    write(port: u8, value: u8): void {
        switch (port) {
            case 0x00: // INTERRUPT_ENABLE
                this.enabled = value;
                //this.emit('state', { enabled: this.enabled })
                break;

            case 0x01: // INTERRUPT_PENDING (0xFF41) - READ-ONLY
                break;

            case 0x02: // INTERRUPT_ACK - acquitter une IRQ
                const irqToAck = value & 0x07;
                this.pending = (this.pending & ~(1 << irqToAck)) as u8;
                //this.emit('state', { pending: this.pending })
                break;

            case 0x03: // INTERRUPT_MASK
                this.mask = (value & 0xFF) as u8;
                //this.emit('state', { mask: this.mask })
                break;

            case 0x04: // INTERRUPT_HANDLER_LOW
                this.handlerAddr = ((this.handlerAddr & 0xFF00) | (value & 0xFF)) as u16;
                //this.emit('state', { handlerAddr: this.handlerAddr })
                break;

            case 0x05: // INTERRUPT_HANDLER_HIGH
                this.handlerAddr = ((this.handlerAddr & 0x00FF) | ((value & 0xFF) << 8)) as u16;
                //this.emit('state', { handlerAddr: this.handlerAddr })
                break;

            case 0x06: { // INTERRUPT_CPU_HANDLER
                const irq = value >> 4; // high nibble
                const irqCpuHandler = this.irqsCpuHandler.get(irq)

                if (irqCpuHandler) {
                    irqCpuHandler.cpu = value & 0x0F; // low nibble

                } else {
                    console.warn(`IRQ CPU Handler not found`);
                }
                break;
            }

            case 0x07: { // INTERRUPT_CORE_HANDLER
                const irq = value >> 4; // high nibble
                const irqCpuHandler = this.irqsCpuHandler.get(irq)

                if (irqCpuHandler) {
                    irqCpuHandler.core = value & 0x0F; // low nibble

                } else {
                    console.warn(`IRQ CPU Handler not found`);
                }
                break;
            }

        }
    }


    reset(): void {
        this.enabled = 0 as u8;
        this.pending = 0 as u8;
        this.mask = 0 as u8;
        this.handlerAddr = MEMORY_MAP.OS_START as u16;

        //this.emit('state', { handlerAddr: this.handlerAddr, enabled: this.enabled, pending: this.pending, mask: this.mask })
    }

}


