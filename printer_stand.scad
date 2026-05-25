// =======================================================================
// 3D Printer Stand — knockdown steel frame with wood top
// Units: inches
//
// Two welded end-frames + 6 bolted long stretchers + 4 top knee braces
// + cable X across the back. Wood top floats on slotted screws.
//
// HOW TO VIEW:
//   - Open this file in OpenSCAD (free at openscad.org)
//   - Press F5 for fast preview, F6 for full render
//   - Drag with mouse to rotate, scroll to zoom
//   - Toggle visibility flags in the USER-EDITABLE section to isolate parts
// =======================================================================

$fn = 24;  // smoothness of cylinders

// === USER-EDITABLE: TOGGLES ===

SHOW_WOOD_TOP    = true;
SHOW_SHELVES     = true;
SHOW_FLOOR_REF   = true;   // faint floor outline for context
EXPLODE_JOINTS   = false;  // pull stretchers out by 4" to expose flange plates
EXPLODE_DIST     = 4;      // exploded-view offset

// === USER-EDITABLE: DIMENSIONS ===

WOOD_LENGTH = 48;        // long dimension of wood top (X)
WOOD_DEPTH  = 25.75;     // front-to-back of wood top (Y)
WOOD_THK    = 1.75;      // wood top thickness (your woodworking)
TOTAL_HT    = 37;        // floor to top-of-wood (Z) — match counter

OVERHANG    = 2;         // wood overhang on all 4 sides

TUBE        = 1.5;       // square tube outer dimension (1.5"×1.5"×0.120" wall)

PLATE       = 3;         // flange plate side length
PLATE_THK   = 3/16;      // flange plate thickness
BOLT_DIA    = 3/8;       // bolt diameter
BOLT_INSET  = 0.625;     // bolt-hole inset from plate edge

H_BOTTOM    = 5;         // top of bottom-shelf cross-tube, off floor
H_MIDDLE    = 17;        // top of middle-shelf cross-tube, off floor

LEVELER_HT   = 0.5;
LEVELER_BASE = 2;

CABLE_DIA   = 1/8;
KNEE_LEN    = 6;          // knee brace footprint along the long stretcher
KNEE_DROP   = 6;          // knee brace footprint down the leg

SHELF_THK   = 0.75;

// === DERIVED ===
FRAME_LENGTH = WOOD_LENGTH - 2*OVERHANG;   // 44"  (steel frame in X)
FRAME_DEPTH  = WOOD_DEPTH  - 2*OVERHANG;   // 21.75" (steel frame in Y)
FRAME_TOP_Z  = TOTAL_HT - WOOD_THK;        // 35.25" — top of steel
LEG_BOTTOM_Z = LEVELER_HT;                 // 0.5"
LEG_TOP_Z    = FRAME_TOP_Z;
LEG_HT       = LEG_TOP_Z - LEG_BOTTOM_Z;   // 34.75"

// Leg centerlines (where the leg's vertical axis sits)
FRONT_Y = -FRAME_DEPTH/2 + TUBE/2;
BACK_Y  =  FRAME_DEPTH/2 - TUBE/2;
LEFT_X  = -FRAME_LENGTH/2 + TUBE/2;
RIGHT_X =  FRAME_LENGTH/2 - TUBE/2;

// Leg inner faces (face toward stand center)
LEG_INNER_X_LEFT  = LEFT_X  + TUBE/2;     // -20.5
LEG_INNER_X_RIGHT = RIGHT_X - TUBE/2;     // +20.5

// Stretcher tube ends (after subtracting two plate thicknesses)
STRETCHER_END_LEFT  = LEG_INNER_X_LEFT  + 2*PLATE_THK;   // -20.125
STRETCHER_END_RIGHT = LEG_INNER_X_RIGHT - 2*PLATE_THK;   // +20.125

// === COLORS ===
STEEL    = [0.55, 0.57, 0.60];
WOOD     = [0.62, 0.42, 0.22];
SHELF    = [0.78, 0.62, 0.40];
PLATE_C  = [0.40, 0.42, 0.45];
BOLT_C   = [0.15, 0.15, 0.18];
CABLE_C  = [0.85, 0.85, 0.88];
LEVEL_C  = [0.18, 0.18, 0.20];

// === HELPERS =================================================================

// Bar of arbitrary square cross-section between two 3D points.
// Used for diagonals where the bar isn't axis-aligned.
module bar_between(p1, p2, w, h, c) {
    v  = p2 - p1;
    L  = norm(v);
    az = atan2(v[1], v[0]);
    el = atan2(sqrt(v[0]*v[0] + v[1]*v[1]), v[2]);
    color(c)
        translate(p1)
            rotate([0, 0, az])
                rotate([0, el, 0])
                    translate([-w/2, -h/2, 0])
                        cube([w, h, L]);
}

module tube_between(p1, p2) { bar_between(p1, p2, TUBE, TUBE, STEEL); }

module rod_between(p1, p2, dia, c) {
    v  = p2 - p1;
    L  = norm(v);
    az = atan2(v[1], v[0]);
    el = atan2(sqrt(v[0]*v[0] + v[1]*v[1]), v[2]);
    color(c)
        translate(p1)
            rotate([0, 0, az])
                rotate([0, el, 0])
                    cylinder(d=dia, h=L);
}

// Axis-aligned tubes (faster + easier to read for orthogonal members)
module x_tube(x_start, length, y_center, z_center) {
    color(STEEL)
        translate([x_start, y_center - TUBE/2, z_center - TUBE/2])
            cube([length, TUBE, TUBE]);
}
module y_tube(y_start, length, x_center, z_center) {
    color(STEEL)
        translate([x_center - TUBE/2, y_start, z_center - TUBE/2])
            cube([TUBE, length, TUBE]);
}
module z_tube(z_start, length, x_center, y_center) {
    color(STEEL)
        translate([x_center - TUBE/2, y_center - TUBE/2, z_start])
            cube([TUBE, TUBE, length]);
}

// Flange plate centered at (x, y, z), normal along ±X.
// side = +1: plate extends from x to x+PLATE_THK (toward +X).
// side = -1: plate extends from x-PLATE_THK to x.
// Bolt heads are drawn on the OUTER face (away from where the plate is welded).
module flange_x(x, y, z, side) {
    x0 = (side > 0) ? x : x - PLATE_THK;
    color(PLATE_C)
        translate([x0, y - PLATE/2, z - PLATE/2])
            cube([PLATE_THK, PLATE, PLATE]);
    bolt_x = (side > 0) ? x + PLATE_THK : x - PLATE_THK;
    for (dy = [-1, 1])
        for (dz = [-1, 1])
            color(BOLT_C)
                translate([bolt_x, y + dy*(PLATE/2 - BOLT_INSET), z + dz*(PLATE/2 - BOLT_INSET)])
                    rotate([0, side*90, 0])
                        cylinder(d=BOLT_DIA*1.7, h=0.18);
}

module leveler(x, y) {
    color(LEVEL_C)
        translate([x, y, -LEVELER_HT])
            cylinder(d=LEVELER_BASE, h=LEVELER_HT);
}

// === END FRAME ===============================================================
// One welded end frame, in the YZ plane at X = x0.
// Two legs, three horizontal cross-tubes (bottom shelf, middle shelf, top),
// one internal diagonal in the lower bay, and flange plates on each leg's
// inner face at each shelf height (where long stretchers will bolt on).

module end_frame(x0) {
    // Two vertical legs
    z_tube(LEG_BOTTOM_Z, LEG_HT, x0, FRONT_Y);
    z_tube(LEG_BOTTOM_Z, LEG_HT, x0, BACK_Y);

    // Levelers
    leveler(x0, FRONT_Y);
    leveler(x0, BACK_Y);

    // Three horizontal cross-pieces. Top face at the shelf height.
    inner_front = FRONT_Y + TUBE/2;   // tube starts at front leg's inner face
    inner_back  = BACK_Y  - TUBE/2;   // tube ends at back leg's inner face
    L = inner_back - inner_front;

    y_tube(inner_front, L, x0, H_BOTTOM   - TUBE/2);
    y_tube(inner_front, L, x0, H_MIDDLE   - TUBE/2);
    y_tube(inner_front, L, x0, FRAME_TOP_Z - TUBE/2);

    // Internal diagonal in the lower bay (between bottom-shelf and middle-shelf).
    // Front-bottom-corner to back-top-corner of the lower bay.
    p1 = [x0, FRONT_Y + TUBE/2, H_BOTTOM];
    p2 = [x0, BACK_Y  - TUBE/2, H_MIDDLE - TUBE];
    tube_between(p1, p2);

    // Flange plates welded to inside face of each leg at each shelf height.
    // Left frame: plates extend toward +X.  Right frame: plates extend toward -X.
    side    = (x0 < 0) ? +1 : -1;
    plate_x = x0 + side * TUBE/2;     // sits on leg inner face

    for (y = [FRONT_Y, BACK_Y])
        for (z = [H_BOTTOM   - TUBE/2,
                  H_MIDDLE   - TUBE/2,
                  FRAME_TOP_Z - TUBE/2])
            flange_x(plate_x, y, z, side);
}

// === LONG STRETCHER ==========================================================
// One stretcher: a 1.5" tube with flange plates welded on each end.
// The whole assembly bolts onto the welded plates of the end frames.

module long_stretcher(y_center, z_center) {
    L = STRETCHER_END_RIGHT - STRETCHER_END_LEFT;
    // Tube
    color(STEEL)
        translate([STRETCHER_END_LEFT, y_center - TUBE/2, z_center - TUBE/2])
            cube([L, TUBE, TUBE]);
    // Plate at LEFT end (welded to stretcher, normal points -X — toward end frame)
    flange_x(STRETCHER_END_LEFT,  y_center, z_center, -1);
    // Plate at RIGHT end (normal points +X)
    flange_x(STRETCHER_END_RIGHT, y_center, z_center, +1);
}

// === KNEE BRACE ==============================================================
// Tube diagonal at top corner: from top stretcher (KNEE_LEN inward from
// where it joins the leg) down to the leg face (KNEE_DROP below frame top).

module knee_brace(end_x, y) {
    dir = (end_x < 0) ? +1 : -1;   // direction toward stand interior
    p_str = [end_x + dir * KNEE_LEN, y, FRAME_TOP_Z - TUBE/2];
    p_leg = [end_x,                   y, FRAME_TOP_Z - TUBE - KNEE_DROP];
    tube_between(p_str, p_leg);
}

// === CABLE X (back) ==========================================================
// Two crossed cables on the back face. Always one cable in tension regardless
// of which way the frame tries to rack.

module cable_x_back() {
    bl = [LEFT_X,  BACK_Y, LEG_BOTTOM_Z];
    tl = [LEFT_X,  BACK_Y, FRAME_TOP_Z - TUBE];
    br = [RIGHT_X, BACK_Y, LEG_BOTTOM_Z];
    tr = [RIGHT_X, BACK_Y, FRAME_TOP_Z - TUBE];
    rod_between(bl, tr, CABLE_DIA, CABLE_C);
    rod_between(br, tl, CABLE_DIA, CABLE_C);
}

// === WOOD ====================================================================

module wood_top() {
    color(WOOD)
        translate([-WOOD_LENGTH/2, -WOOD_DEPTH/2, FRAME_TOP_Z])
            cube([WOOD_LENGTH, WOOD_DEPTH, WOOD_THK]);
}

module shelf(z_top) {
    sx = STRETCHER_END_RIGHT - STRETCHER_END_LEFT;
    sy_start = -FRAME_DEPTH/2 + TUBE;
    sy_len   = FRAME_DEPTH - 2*TUBE;
    color(SHELF)
        translate([STRETCHER_END_LEFT, sy_start, z_top - SHELF_THK])
            cube([sx, sy_len, SHELF_THK]);
}

// === FLOOR REFERENCE =========================================================

module floor_ref() {
    %color([0.95, 0.95, 0.95])
        translate([-WOOD_LENGTH/2 - 4, -WOOD_DEPTH/2 - 4, -LEVELER_HT - 0.05])
            cube([WOOD_LENGTH + 8, WOOD_DEPTH + 8, 0.05]);
}

// === ASSEMBLY ================================================================

// End frames (welded, never come apart)
end_frame(LEFT_X);
end_frame(RIGHT_X);

// 6 long stretchers (bolted via flange plates)
expl = EXPLODE_JOINTS ? EXPLODE_DIST : 0;
for (y = [FRONT_Y, BACK_Y])
    for (z = [H_BOTTOM   - TUBE/2,
              H_MIDDLE   - TUBE/2,
              FRAME_TOP_Z - TUBE/2])
        translate([0, 0, 0])  // explode placeholder; stretchers move outward in Y/Z if desired
            long_stretcher(y, z);

// 4 knee braces at top corners (welded to top stretcher; bolt up with stretcher)
for (y = [FRONT_Y, BACK_Y])
    for (x_inner = [LEG_INNER_X_LEFT, LEG_INNER_X_RIGHT])
        knee_brace(x_inner, y);

// Cable X across the back
cable_x_back();

if (SHOW_SHELVES) {
    shelf(H_BOTTOM);
    shelf(H_MIDDLE);
}

if (SHOW_WOOD_TOP)  wood_top();
if (SHOW_FLOOR_REF) floor_ref();

// =======================================================================
// CUT LIST (approximate — verify in your physical layout):
//   Legs:                  4 × 34.75"  of 1.5"×1.5"×0.120" tube
//   End-frame horizontals: 6 × 18.75"  of 1.5"×1.5"×0.120" tube
//                            (FRAME_DEPTH - 2*TUBE = 21.75 - 3.0 = 18.75)
//   End-frame diagonals:   2 × ~21.5"  (cut to fit)
//   Long stretchers:       6 × 40.25"  (STRETCHER_END_RIGHT - LEFT)
//   Knee braces:           4 × ~8.5"   (cut to fit)
//   Flange plates:        24 × 3"×3"×3/16"  (12 on end-frame legs, 12 on stretcher ends)
//   Bolts:                24 × 3/8"-16, ~1.25" long, with washers + nylock nuts
//   Levelers:              4 × 1/2"-13 swivel-base, 2" base
//   Weld-in inserts:       4 × 1/2"-13 (one per leg bottom)
//   Cable:                ~12 ft of 1/8" stainless 7×19 aircraft cable
//   Cable hardware:        4 swage eye terminations + 2 turnbuckles + 4 eye plates
//   Wood top:             48"×25.75"×~1.75"  (your build)
//   Shelves:               2 × ~40.25"×18.75" of 3/4" plywood (or hardwood)
// =======================================================================
