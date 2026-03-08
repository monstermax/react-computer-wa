
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
        <div className="flex flex-col items-center gap-1 min-w-32">
            <div className="self-center">Current Speed</div>

            <div className="self-center">
                {!emulator.clockStatus && (
                    <div>
                        {emulator.cpuHalted
                            ? <div className="text-red-500">Halted</div>
                            : <div className="text-yellow-500">Stopped</div>
                        }
                    </div>
                )}

                {emulator.clockStatus && (
                    <div className="text-green-500">{formatSpeed(speed)}</div>
                )}
            </div>
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
