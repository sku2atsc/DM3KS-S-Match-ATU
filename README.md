# DM3KS S-Match ATU – automatischer symmetrischer Antennenkoppler, ~1250 W

Automatischer Koppler auf Basis des S-Match-Prinzips (Koax-Linkwindung durch
Ferrithülsen, schwebender Sekundärkreis). Rollspule und Drehko werden durch
relaisgeschaltete L- und C-Bänke ersetzt, gesteuert von einer N7DDC-kompatiblen
Steuerung (PIC16F1938, ATU-100-Firmware).

**Status:** Konzeptphase – nichts davon ist aufgebaut oder gemessen.

## Ziele
- 160 m bis 10 m, symmetrische Speisung (Hühnerleiter)
- 1250 W Dauerstrich-tauglich ausgelegt
- hohe Güte: freitragende Luftspulen, Vakuumrelais, Doorknob-Kondensatoren
- High-Z / Low-Z automatisch umschaltbar (SW-Ausgang der Firmware)

## Aufbau
```
TRX ─[Steuerung + SWR-Brücke]─[W1JR-Balun]─► Innenleiter Ecoflex-10
       (geerdet)                                  │
                                  12x Fair-Rite 2631102002 (Schirm = Sekundär)
                               linke Abgriffe            rechte Abgriffe
                                      │                        │
                                  [C-Bank]            [L-Bank + 160-m-L]
                                      └──[Z-Relais 2-polig]────┘
                                                 │
                                           Hühnerleiter
```

## Verzeichnisse
| Pfad | Inhalt |
|---|---|
| `docs/dimensionierung.md` | Spannungen/Ströme bei 1250 W, Designentscheidungen |
| `docs/stueckliste.md` | Stückliste HF-Teil |
| `docs/luftspulen.md` | Spulentabelle, Wickel- und Abgleichanleitung |
| `hardware/3d/luftspule_kammleiste.scad` | Parametrischer Spulenhalter (PETG) |
| `tools/spulenrechner.py` | Luftspulen- und Spannungsrechner |

## Offene Punkte (TODO)
- [ ] L/C-Werte des bestehenden S-Match pro Band messen → Bankwerte bestätigen
- [ ] Vakuumrelais-Typ festlegen (Spulenspannung, Datenblattwerte)
- [ ] Steuerplatine in KiCad (PIC16F1938, Tandem-Match 1,5 kW, MOSFET-Treiber)
- [ ] Firmware: Relais-Verzögerung, ggf. feinere Grobsuche für scharfe Resonanz
- [ ] Lizenz festlegen

## Sicherheit
Auf dem schwebenden Kreis treten mehrere kV HF auf. Nur in geschlossenem,
isoliertem Gehäuse betreiben, nie unter Last abstimmen (Abstimmen mit 5–10 W).

73 de DM3KS
# DM3KS-S-Match-ATU
