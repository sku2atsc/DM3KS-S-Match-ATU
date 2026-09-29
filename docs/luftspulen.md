# Luftspulen

Berechnet nach Wheeler (mittlerer Durchmesser), bei kurzen Spulen ±10 %.
Abgleich immer am NanoVNA.

| L | Innen-Ø | Draht | Steigung | Windungen | Länge | Drahtlänge |
|---|---|---|---|---|---|---|
| 0,1 µH | 25 mm | 3 mm | 6 mm | 1,75 | 11 mm | 0,25 m |
| 0,2 µH | 25 mm | 3 mm | 6 mm | 2,75 | 17 mm | 0,35 m |
| 0,4 µH | 32 mm | 3 mm | 6 mm | 3,5 | 21 mm | 0,45 m |
| 0,8 µH | 40 mm | 3 mm | 6 mm | 4,5 | 27 mm | 0,7 m |
| 1,6 µH | 50 mm | 2,5 mm | 5 mm | 5,5 | 28 mm | 1,0 m |
| 3,2 µH | 50 mm | 2,5 mm | 5 mm | 9 | 45 mm | 1,6 m |
| 6,4 µH | 60 mm | 2,5 mm | 5 mm | 12,25 | 61 mm | 2,5 m |
| 12,8 µH (160 m) | 70 mm | 2 mm | 4 mm | 15,5 | 62 mm | 3,6 m |

Neu rechnen: `python3 tools/spulenrechner.py spule --l 6.4 --d 60 --draht 2.5 --pitch 5`

## Wickeln
1. Auf ein Rohr wickeln, das 2–3 mm dünner ist als der Soll-Innendurchmesser
   (Draht federt auf).
2. Windungen eng wickeln, danach auf Steigung ziehen und in die Kammleisten legen.
3. Blankes Kupfer, versilbert ideal. Dünner Zaponlack gegen Oxidation ist unkritisch.

## Montage
- Benachbarte Spulen um 90° versetzt.
- Mindestens 1 Spulendurchmesser Abstand zu anderen Spulen und Blech.
- Relais direkt an die Spulenenden, kurze breite Verbindungen (Cu-Band).

## Abgleich
Spule einzeln am NanoVNA messen (Serienmessung S11, Induktivität bei 1,8 und
14 MHz ablesen). Auseinanderziehen = weniger L, zusammenschieben = mehr L.

## 3D-Druck (Ender 3 Pro)
PETG, nicht PLA (PLA wird ab ~55–60 °C weich). 0,2 mm Schicht, 4 Perimeter,
40 % Infill, Leisten flach liegend. Parameter oben in der `.scad`-Datei pro
Spule anpassen. Die Datei ist noch nicht in OpenSCAD gerendert – Vorschau prüfen.
