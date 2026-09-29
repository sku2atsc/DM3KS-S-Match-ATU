#!/usr/bin/env python3
"""Luftspulen- und Spannungsrechner für den DM3KS S-Match ATU."""
import argparse
import math


def wheeler_uh(d_mittel_mm, n, pitch_mm):
    """Induktivität einlagiger Luftspule nach Wheeler in µH."""
    d = d_mittel_mm / 25.4
    laenge = n * pitch_mm / 25.4
    return d * d * n * n / (18 * d + 40 * laenge)


def windungen(l_uh, d_innen_mm, draht_mm, pitch_mm):
    d_mittel = d_innen_mm + draht_mm
    n = 0.25
    while wheeler_uh(d_mittel, n, pitch_mm) < l_uh:
        n += 0.25
    return n, d_mittel


def cmd_spule(a):
    n, d_mittel = windungen(a.l, a.d, a.draht, a.pitch)
    laenge = n * a.pitch
    drahtlaenge = n * math.pi * d_mittel / 1000 + 0.1
    print(f"L = {a.l} µH: {n} Wdg, Länge {laenge:.1f} mm, "
          f"Draht ca. {drahtlaenge:.2f} m, berechnet {wheeler_uh(d_mittel, n, a.pitch):.2f} µH")
    if laenge < 0.4 * d_mittel:
        print("Hinweis: sehr kurze Spule, Wheeler hier ungenauer – am VNA abgleichen.")


def cmd_spannung(a):
    u = math.sqrt(a.p * a.z)
    i = math.sqrt(a.p / a.z)
    print(f"{a.p} W an {a.z} Ω: {u:.0f} V eff., {u * math.sqrt(2):.0f} V Spitze, {i:.2f} A")
    if a.l and a.f:
        x = 2 * math.pi * a.f * 1e6 * a.l * 1e-6
        print(f"Spule {a.l} µH bei {a.f} MHz: X = {x:.0f} Ω, "
              f"U über Spule bei {a.i} A = {x * a.i:.0f} V eff.")


def main():
    p = argparse.ArgumentParser(description=__doc__)
    sub = p.add_subparsers(required=True)

    s = sub.add_parser("spule", help="Windungszahl berechnen")
    s.add_argument("--l", type=float, required=True, help="Soll-L in µH")
    s.add_argument("--d", type=float, required=True, help="Innendurchmesser mm")
    s.add_argument("--draht", type=float, default=2.5, help="Drahtdurchmesser mm")
    s.add_argument("--pitch", type=float, default=5, help="Windungsabstand mm")
    s.set_defaults(func=cmd_spule)

    v = sub.add_parser("spannung", help="Spannung/Strom an Last bzw. Spule")
    v.add_argument("--p", type=float, default=1250, help="Leistung W")
    v.add_argument("--z", type=float, default=2000, help="Lastimpedanz Ω")
    v.add_argument("--l", type=float, help="Spule µH (optional)")
    v.add_argument("--f", type=float, help="Frequenz MHz (optional)")
    v.add_argument("--i", type=float, default=15, help="Spulenstrom A")
    v.set_defaults(func=cmd_spannung)

    a = p.parse_args()
    a.func(a)


if __name__ == "__main__":
    main()
