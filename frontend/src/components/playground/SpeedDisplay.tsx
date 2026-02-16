
import { useEffect, useState } from "react";

import type { EmulatorHook } from "@/hooks/useEmulator";
import { delayer } from "@/lib/lib_delayer";


export const SpeedDisplay: React.FC<{ emulator: EmulatorHook }> = ({ emulator }) => {
    const [speed, setSpeed] = useState(0);

    useEffect(() => {
        // Fonction pour mettre à jour l'affichage
        const updateSpeed = () => {
            delayer('cpu-speed', (cyclesPerSecond: number) => {
                setSpeed(cyclesPerSecond);
            }, 100, 500, [emulator.cyclesPerSecondRef.current])
        };

        // Mettre à jour à chaque tick
        emulator.clock.on('tick', updateSpeed);

        // Nettoyage
        return () => {
            emulator.clock.off('tick', updateSpeed);
        };
    }, [emulator]);

    return (
        <div className="flex items-center gap-4 text-xs text-zinc-500 min-w-48 justify-end">
            <div>Speed: </div>
            {!emulator.clockStatus && <div>Stopped</div>}
            {emulator.clockStatus && speed < 10 && (
                <div>{Math.round(10 * speed) / 10}/sec.</div>
            )}
            {emulator.clockStatus && speed >= 10 && (
                <div>{Math.round(speed)}/sec.</div>
            )}
        </div>
    );
};

