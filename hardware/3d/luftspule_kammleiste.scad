// Kammleisten-Halter für freitragende Luftspulen (PETG empfohlen)
// 4 Leisten pro Spule, um je 90° versetzt montiert. Jede Leiste hat ihre
// Kerben um pitch/4 * index verschoben, damit die Steigung der Wendel stimmt.
// Druck: PETG, 0.2 mm Schicht, 4 Perimeter, 40 % Infill, Leiste flach liegend.
// Kunststoff nur an der Außenseite der Wendel -> Feld überwiegend in Luft, hohe Güte.

// ---------- Parameter pro Spule anpassen ----------
spule    = "3u2";   // Name, wird eingeprägt
n        = 9;       // Windungen
pitch    = 5;       // Windungsabstand in mm (= 2 x Drahtdurchmesser)
draht    = 2.5;     // Drahtdurchmesser in mm
d_innen  = 50;      // Innendurchmesser der Wendel in mm (nur Info/Montagelehre)
rand     = 12;      // Überstand an jedem Ende in mm
hoehe    = 14;      // Leistenhöhe (radial) in mm
dicke    = 6;       // Leistendicke in mm
spiel    = 0.4;     // Kerbenspiel für den Draht
fuss_l   = 20;      // Fußlänge (Schraubenlasche) in mm
schraube = 3.4;     // Bohrung für M3
// ----------------------------------------------------

laenge = n * pitch + 2 * rand;
r_kerbe = (draht + spiel) / 2;

module leiste(index = 0) {
    versatz = index * pitch / 4;
    difference() {
        union() {
            cube([laenge, dicke, hoehe]);
            // Füße an beiden Enden
            for (x = [-fuss_l, laenge])
                cube([fuss_l, dicke, 4]);
        }
        // Kerben: Draht liegt zur Hälfte in der Leiste
        for (i = [0 : ceil(n)])
            translate([rand + versatz + i * pitch, -1, hoehe])
                rotate([-90, 0, 0])
                    cylinder(r = r_kerbe, h = dicke + 2, $fn = 32);
        // Schraubenlöcher in den Füßen
        for (x = [-fuss_l / 2, laenge + fuss_l / 2])
            translate([x, dicke / 2, -1])
                cylinder(d = schraube, h = 6, $fn = 24);
        // Beschriftung
        translate([rand, dicke - 0.6, 3])
            rotate([90, 0, 180]) mirror([1, 0, 0])
                linear_extrude(1)
                    text(str(spule, " L", index), size = 4);
    }
}

// Montagelehre (Ring) zum Ausrichten der 4 Leisten beim Verkleben/Verschrauben
module lehre() {
    difference() {
        cylinder(d = d_innen + 2 * draht + 2 * hoehe + 10, h = 3, $fn = 96);
        translate([0, 0, -1]) cylinder(d = d_innen - 10, h = 5, $fn = 96);
        for (a = [0 : 90 : 270])
            rotate([0, 0, a])
                translate([d_innen / 2 + draht, -dicke / 2 - 0.2, -1])
                    cube([hoehe + 0.5, dicke + 0.4, 5]);
    }
}

// Alle 4 Leisten + Lehre nebeneinander zum Drucken
for (k = [0 : 3])
    translate([0, k * (dicke + 6), 0]) leiste(k);
// 2 Endringe: halten die Leisten an beiden Spulenenden
for (j = [0 : 1])
    translate([laenge / 4 + j * (d_innen + 2 * hoehe + 20), -(d_innen / 2 + hoehe + 25), 0]) lehre();
