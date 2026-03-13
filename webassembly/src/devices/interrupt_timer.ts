
import { IRQ_MAP } from "../memory_map";
import { Computer } from "./Computer";


export class InterruptTimerDevice {
    public computer: Computer;
    public counter: u8 = 0;
    public period: u8 = 10; // Interrupt toutes les 10 "tick"
    public enabled: boolean = false;


    constructor(computer: Computer) {
        this.computer = computer;
    }


    // Tick appelé à chaque cycle CPU ou à intervalle fixe => appelé à chaque tick de clock (soit N cycles CPU)
    tick(): void {
        //console.log(`⏰ Timer tick: enabled=${this.enabled}, counter=${this.counter}, period=${this.period}`);
        if (!this.enabled) return;

        const newVal = (this.counter + 1) as u8;
        //console.log(`⏰ Counter: ${prev} -> ${newVal}`);

        if (newVal >= this.period) {
            // Déclencher interruption
            //console.log('⏰ TIMER INTERRUPT! Requesting IRQ 0');

            const interrupt = this.computer.interruptManager;

            if (interrupt) {
                interrupt.requestInterrupt(IRQ_MAP.IRQ_TIMER);

            } else {
                console.warn(`Missing Interrupt for Timer. Cannot requestInterrupt`);
            }

            this.counter = 0 as u8
            return
        }

        this.counter = newVal;
    }


    read(port: u8): u8 {
        switch (port) {
            case 0x00: // TIMER_COUNTER (0xFF20)
                return this.counter;

            case 0x01: // TIMER_CONTROL (0xFF21)
                return (this.enabled ? 1 : 0) as u8;

            case 0x02: // TIMER_PRESCALER (0xFF22)
                return this.period;

            case 0x03: // TIMER_TICK (0xFF23)
                return 0 as u8; // write-only method

            default:
                return 0 as u8;
        }
    }

    write(port: u8, value: u8): void {
        switch (port) {
            case 0x01: // TIMER_CONTROL (0xFF21)
                this.enabled = (value & 0x01) !== 0;
                //this.emit('state', { enabled: this.enabled })

                if ((value & 0x02) !== 0) { // Reset bit
                    this.counter = 0 as u8;
                    //this.emit('state', { counter: this.counter })
                }
                break;

            case 0x02: // TIMER_PRESCALER/PERIOD (0xFF22)
                this.period = (value & 0xFF) as u8;
                //this.emit('state', { period: this.period })
                break;

            case 0x03: // TIMER_TICK (0xFF23)
                this.tick()
                break;
        }
    }


    reset(): void {
        this.counter = 0 as u8
        this.period = 10 as u8
        this.enabled = false
        //this.emit('state', { counter: this.counter, period: this.period, enabled: this.enabled })
    }

}


