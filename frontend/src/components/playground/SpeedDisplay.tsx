
import { useEffect, useState } from "react";

import type { EmulatorHook } from "@/hooks/useEmulator";
import { delayer } from "@/lib/lib_delayer";


export const SpeedDisplay: React.FC<{ emulator: EmulatorHook }> = ({ emulator }) => {
    const [speed, setSpeed] = useState(0);

    useEffect(() => {
        // Fonction pour mettre à jour l'affichage (max freq = 10x/sec | min freq = 1x/sec)
        const updateSpeed = () => {
            delayer('cpu-speed', (cyclesPerSecond: number) => {
                setSpeed(cyclesPerSecond);
            }, 100, 1000, [emulator.cyclesPerSecondRef.current])
        };

        // Mettre à jour à chaque tick
        emulator.clock.on('tick', updateSpeed);

        // Nettoyage
        return () => {
            emulator.clock.off('tick', updateSpeed);
        };
    }, [emulator]);

    return (
        <div className="flex items-center gap-4 text-xs text-zinc-500 min-w-32 justify-end">
            <div>Speed: </div>
            {!emulator.clockStatus && (
                <div>{emulator.cpuHalted ? "Halted" : "Stopped"}</div>
            )}

            {emulator.clockStatus && (
                <div>{formatSpeed(speed)}</div>
            )}
        </div>
    );
};



function formatSpeed(cyclesPerSecond: number): string {
    let [value, unit, precision] = [cyclesPerSecond, 'Hz', 0];

    if (cyclesPerSecond > 10 ** 9) {
        value = cyclesPerSecond / (10 ** 9);
        unit = 'GHz';

    } else if (cyclesPerSecond > 10 ** 6) {
        value = cyclesPerSecond / (10 ** 6);
        unit = 'MHz';

    } else if (cyclesPerSecond > 10 ** 3) {
        value = cyclesPerSecond / (10 ** 3);
        unit = 'kHz';
    }

    if (value < 10) {
        precision = 1;
    }

    value = Math.round(value * (10 ** precision)) / (10 ** precision);

    return `${value} ${unit}`
}
