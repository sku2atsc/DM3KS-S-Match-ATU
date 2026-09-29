# Dimensionierung bei 1250 W

| Stelle | Richtwert |
|---|---|
| 50-Ω-Eingang | 5 A, 250 V eff. |
| Hühnerleiter High Z (2 kΩ) | ~1,6 kV eff. / 2,2 kV Spitze |
| Hühnerleiter High Z (5 kΩ, 160 m, kurze Antenne) | ~2,5 kV eff. / 3,5 kV Spitze |
| Low Z (10 Ω) | ~11 A, mit Blindanteil 15–20 A |
| Offener Relaiskontakt über 12,8 µH, 1,8 MHz, 15 A | ~2,2 kV |

Werte ohne Resonanzüberhöhung – reale Spitzen können höher liegen.
Nachrechnen: `python3 tools/spulenrechner.py spannung --p 1250 --z 2000`

## Designentscheidungen
- **HF-Teil ohne Leiterplatte**: frei verdrahtet auf isolierter Grundplatte.
  FR4 ist bei mehreren kV (Kriechstrecken, dielektrische Verluste) ungeeignet.
- **Vakuumrelais** für alle HF-Kontakte (≥ 5 kV offen, ≥ 15 A HF).
- **Einzelspulen statt Abgriffspule**: kurzgeschlossene Windungen einer
  Abgriffspule bleiben gekoppelt → Kreisstrom, Güteverlust, Erwärmung.
- **Bankwerte wie ATU-100** (C) bzw. binär (L), damit der Suchalgorithmus
  der N7DDC-Firmware unverändert funktioniert.
- **Z-Umschaltung** über den SW-Ausgang der Firmware: sie probiert beide
  Stellungen und behält die bessere.
- **Steuerung geerdet** vor dem W1JR-Balun; Relaisspulenleitungen über
  Ferrit-Gleichtaktsperren zur schwebenden Relaisebene.
