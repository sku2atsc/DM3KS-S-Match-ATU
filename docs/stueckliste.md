# Stückliste HF-Teil (vorläufig)

| Pos. | Anz. | Bauteil | Anforderung |
|---|---|---|---|
| L-Bank | 7 (+1 für 160 m) | Vakuumrelais SPST, z. B. В1В (V1V), Jennings RJ1A, Kilovac H-17 | ≥ 5 kV offen, ≥ 15 A HF @ 30 MHz |
| C-Bank | 7 (+1 für 160 m) | Vakuumrelais wie oben | wie oben |
| Z-Umschaltung | 2 | Vakuumrelais SPDT (RJ1A, В1Д/V1D) | wie oben |
| C1…C7 | je 1 | Doorknob 10 / 22 / 47 / 100 / 220 / 470 / 1000 pF, z. B. K15U-1, Vishay HT57/715C | ≥ 5 kV, Blindleistung/HF-Strom laut Datenblatt prüfen |
| C8 (160 m) | 1 | Doorknob 1000–1500 pF | wie oben |
| L1…L8 | – | Cu- oder CuAg-Draht 2–3 mm | ~11 m gesamt, siehe `luftspulen.md` |
| Spulenhalter | 4 Leisten + 2 Ringe je Spule | PETG-Druck | `hardware/3d/` |
| Relaisversorgung | 1 | Netzteil 24/27 V (Relaisspulen prüfen) | ~3 A |
| Gleichtaktsperren | – | Ferritringe für Steuerleitungen und Versorgung | vorhanden |

Datenblattwerte der Relaistypen variieren stark – vor dem Kauf prüfen.
Gebraucht ca. 15–40 € pro Vakuumrelais.
