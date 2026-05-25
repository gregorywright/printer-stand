// =======================================================================
// 3D Printer Stand — knockdown steel frame with wood top
// Units: inches
//
// Two welded end-frames + 6 bolted long stretchers + cable X across the
// back. Plywood shelves drop onto angle-iron ledgers. Wood top floats on
// slotted screws.
//
// Flange-plate joint geometry: tall narrow column, 1.5"W × 5"H, matching
// leg width. Plate A (3/8" thick, tapped) on leg; plate B (3/16" thick,
// clearance) on stretcher end. 2 bolts per joint.
//   Top stretchers:    plate top flush with leg top, both bolts below tube
//   Middle/bottom:     plate centered on stretcher, 1 bolt above + 1 below
//
// HOW TO VIEW:
//   - Open this file in OpenSCAD (free at openscad.org)
//   - Press F5 for fast preview, F6 for full render
//   - Drag with mouse to rotate, scroll to zoom
// =======================================================================

$fn = 24;

// === USER-EDITABLE: TOGGLES ===
SHOW_WOOD_TOP    = true;
SHOW_SHELVES     = true;
SHOW_FLOOR_REF   = true;

// === USER-EDITABLE: DIMENSIONS ===
WOOD_LENGTH = 48;          // long dimension of wood top (X)
WOOD_DEPTH  = 25.75;       // front-to-back of wood top (Y)
WOOD_THK    = 1.75;        // wood top nominal thickness
TOTAL_HT    = 37;          // floor to top-of-wood (Z) — match counter
OVERHANG    = 2;           // wood overhang on all 4 sides

TUBE        = 1.5;         // square tube outer dimension (1.5"x1.5"x0.120")

// Flange plates: tall narrow columns, 1.5" wide (matches tube width).
// Plate A on the leg is thicker (3/8") and tapped — bolt threads grab here.
// Plate B on the stretcher end is thinner (3/16") with clearance holes.
PLATE_W       = 1.5;
PLATE_H       = 5.0;       // all plates (top, middle, bottom)
PLATE_A_THK   = 3/8;
PLATE_B_THK   = 3/16;

BOLT_DIA       = 3/8;
N_BOLTS        = 2;        // 2 bolts per joint (down from 4) — overbuilt with 4
BOLT_HEAD_DIA  = 0.625;
BOLT_HEAD_THK  = 0.21;
BOLT_OFFSET    = 1.75;     // bolt center distance from stretcher centerline

// Angle iron ledgers (plywood shelves drop onto these)
ANGLE_LEG     = 0.75;      // each leg of the angle is 3/4"
ANGLE_THK     = 1/8;

H_BOTTOM    = 5;           // top of bottom-shelf cross-tube, off floor
H_MIDDLE    = 23.75;       // top of middle-shelf cross-tube — gives 10" upper-bay clear

LEVELER_HT   = 0.5;
LEVELER_BASE = 2;

CABLE_DIA    = 1/8;

SHELF_THK    = 0.75;

// === DERIVED ===
FRAME_LENGTH = WOOD_LENGTH - 2*OVERHANG;     // 44
FRAME_DEPTH  = WOOD_DEPTH  - 2*OVERHANG;     // 21.75
FRAME_TOP_Z  = TOTAL_HT - WOOD_THK;          // 35.25
LEG_BOTTOM_Z = LEVELER_HT;                   // 0.5 (top of leveler base)
LEG_TOP_Z    = FRAME_TOP_Z;
LEG_HT       = LEG_TOP_Z - LEG_BOTTOM_Z;     // 34.75

FRONT_Y = -FRAME_DEPTH/2 + TUBE/2;
BACK_Y  =  FRAME_DEPTH/2 - TUBE/2;
LEFT_X  = -FRAME_LENGTH/2 + TUBE/2;
RIGHT_X =  FRAME_LENGTH/2 - TUBE/2;

LEG_INNER_X_LEFT  = LEFT_X  + TUBE/2;
LEG_INNER_X_RIGHT = RIGHT_X - TUBE/2;

STRETCHER_END_LEFT  = LEG_INNER_X_LEFT  + PLATE_A_THK + PLATE_B_THK;
STRETCHER_END_RIGHT = LEG_INNER_X_RIGHT - PLATE_A_THK - PLATE_B_THK;

// Stretcher centerlines
Z_TOP_STR = FRAME_TOP_Z - TUBE/2;            // 34.5
Z_MID_STR = H_MIDDLE - TUBE/2;               // 23.0
Z_BOT_STR = H_BOTTOM - TUBE/2;               // 4.25

// Plate centerlines (Z). Top plate is asymmetric — top flush with leg top
// (35.25") so it doesn't poke above. Plate H = 5", so plate center = 32.75.
// Other plates are centered on the stretcher centerline.
Z_TOP_PLATE = FRAME_TOP_Z - PLATE_H/2;       // 32.75 (top edge at 35.25)
Z_MID_PLATE = Z_MID_STR;                     // 23.0
Z_BOT_PLATE = Z_BOT_STR;                     //  4.25

// Colors
STEEL    = [0.55, 0.57, 0.60];
WOOD     = [0.62, 0.42, 0.22];
SHELF    = [0.78, 0.62, 0.40];
PLATE_C  = [0.40, 0.42, 0.45];
BOLT_C   = [0.15, 0.15, 0.18];
CABLE_C  = [0.85, 0.85, 0.88];
LEVEL_C  = [0.18, 0.18, 0.20];

// === HELPERS =================================================================

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

// === FLANGE PLATES + BOLTS ===================================================
// Coordinate convention:
//   side = +1: this is a LEFT joint (left leg side of stand).
//              Plate A extends in +X from leg's inner face.
//              Plate B extends in -X (toward leg) from stretcher's left end.
//              Bolt enters from +X side (stand interior), threads in -X direction.
//   side = -1: RIGHT joint, mirrored.

module plate_a(leg_inner_x, y_center, z_center, side) {
    x0 = (side > 0) ? leg_inner_x : leg_inner_x - PLATE_A_THK;
    color(PLATE_C)
        translate([x0, y_center - PLATE_W/2, z_center - PLATE_H/2])
            cube([PLATE_A_THK, PLATE_W, PLATE_H]);
}

module plate_b(stretcher_end_x, y_center, z_center, side) {
    x0 = (side > 0) ? stretcher_end_x - PLATE_B_THK : stretcher_end_x;
    color(PLATE_C)
        translate([x0, y_center - PLATE_W/2, z_center - PLATE_H/2])
            cube([PLATE_B_THK, PLATE_W, PLATE_H]);
}

// 2 bolts per joint.
//   Top stretcher: both bolts BELOW the tube (plate top flush with leg top
//                  leaves no room above the tube). Bolt 1 0.75" below tube
//                  bottom; bolt 2 a further 1.5" below.
//   Middle/bottom: bolts straddle stretcher centerline at ±BOLT_OFFSET.
module bolts_at_joint(stretcher_end_x, y_center, stretcher_z, side, is_top) {
    offsets = is_top ? [-1.5, -3.0] : [+BOLT_OFFSET, -BOLT_OFFSET];
    bolt_head_x = stretcher_end_x;
    for (dz = offsets) {
        color(BOLT_C)
            translate([bolt_head_x, y_center, stretcher_z + dz])
                rotate([0, side*90, 0])
                    cylinder(d=BOLT_HEAD_DIA, h=BOLT_HEAD_THK);
    }
}

// === LEVELER =================================================================
module leveler(x, y) {
    color(LEVEL_C)
        translate([x, y, 0])
            cylinder(d=LEVELER_BASE, h=LEVELER_HT);
}

// === END FRAME ===============================================================
// One welded end frame in the YZ plane at X = x0.
// Two legs, three horizontal cross-tubes (bottom/middle shelves + top),
// one internal diagonal in the lower bay (~42.6° at this geometry),
// and three plate A's on each leg's inner X face.

module end_frame(x0) {
    // Two vertical legs
    z_tube(LEG_BOTTOM_Z, LEG_HT, x0, FRONT_Y);
    z_tube(LEG_BOTTOM_Z, LEG_HT, x0, BACK_Y);

    // Levelers
    leveler(x0, FRONT_Y);
    leveler(x0, BACK_Y);

    // Three horizontal cross-pieces (top-of-tube at the named height)
    inner_front = FRONT_Y + TUBE/2;
    inner_back  = BACK_Y  - TUBE/2;
    L = inner_back - inner_front;
    y_tube(inner_front, L, x0, Z_BOT_STR);
    y_tube(inner_front, L, x0, Z_MID_STR);
    y_tube(inner_front, L, x0, Z_TOP_STR);

    // Internal diagonal in the lower bay: front-bottom-corner of bay to
    // back-top-corner of bay. Welded into end frame.
    p1 = [x0, FRONT_Y + TUBE/2, H_BOTTOM];
    p2 = [x0, BACK_Y  - TUBE/2, H_MIDDLE - TUBE];
    tube_between(p1, p2);

    // Plate A's on the leg's inner X face at each shelf level.
    side          = (x0 < 0) ? +1 : -1;
    leg_inner_x   = (x0 < 0) ? LEG_INNER_X_LEFT : LEG_INNER_X_RIGHT;
    for (y = [FRONT_Y, BACK_Y]) {
        plate_a(leg_inner_x, y, Z_BOT_PLATE, side);
        plate_a(leg_inner_x, y, Z_MID_PLATE, side);
        plate_a(leg_inner_x, y, Z_TOP_PLATE, side);
    }
}

// === LONG STRETCHER ==========================================================
// Tube + plate B at each end. Bolts on as a unit.

module long_stretcher(y_center, z_str, is_top) {
    L = STRETCHER_END_RIGHT - STRETCHER_END_LEFT;
    // The stretcher tube
    color(STEEL)
        translate([STRETCHER_END_LEFT, y_center - TUBE/2, z_str - TUBE/2])
            cube([L, TUBE, TUBE]);

    z_plate = is_top    ? Z_TOP_PLATE
            : (z_str == Z_MID_STR ? Z_MID_PLATE : Z_BOT_PLATE);

    // Plate B at LEFT end (side = +1, plate body on -X side of stretcher end)
    plate_b(STRETCHER_END_LEFT,  y_center, z_plate, +1);
    bolts_at_joint(STRETCHER_END_LEFT,  y_center, z_str, +1, is_top);

    // Plate B at RIGHT end (side = -1, plate body on +X side of stretcher end)
    plate_b(STRETCHER_END_RIGHT, y_center, z_plate, -1);
    bolts_at_joint(STRETCHER_END_RIGHT, y_center, z_str, -1, is_top);
}

// === ANGLE IRON LEDGER =======================================================
// 3/4"x3/4"x1/8" angle, runs along the inboard top edge of a long stretcher.
// Welded permanently to the stretcher tube — travels with it when bolted on.
//
// Cross section (looking down the long stretcher axis, front stretcher example):
//
//   stretcher tube                  plywood top, flush with tube top:
//   .─────────.                  ──────────────────────────────────────
//   │         │═══╗ ← horizontal angle leg, ANGLE_LEG (3/4") inward
//   │         │   ║   thickness ANGLE_THK (1/8")
//   │         │   ║
//   │  TUBE   │   ║ ← vertical angle leg, also 3/4"x1/8", welded to tube
//   │         │   ║
//   │         │   ║
//   │         │═══╝
//   '─────────'
//
// The angle is rendered as an L-shape extruded along X.
//
// y_dir = +1 for FRONT stretcher (angle horizontal leg points BACKWARD, +Y),
//         -1 for BACK  stretcher (angle horizontal leg points FORWARD,  -Y).

module angle_ledger(y_center, z_str, y_dir) {
    L = STRETCHER_END_RIGHT - STRETCHER_END_LEFT;

    // Vertical leg: TUBE/2 inward of stretcher's inner Y face.
    // Sits against the upper portion of the tube's inner side wall.
    // Stretcher inner face (Y nearest stand center) is at y_center + y_dir*(-TUBE/2)
    // since y_dir=+1 means front stretcher whose inner face is at y_center + TUBE/2... wait.
    // FRONT_Y is negative; front stretcher's inner-toward-center face is at
    // FRONT_Y + TUBE/2 (positive direction). For BACK stretcher, inner face
    // is at BACK_Y - TUBE/2. We want angle_inner_y on the *interior* side.

    inner_face_y = y_center + (-y_dir) * TUBE/2;  // Y of the tube's interior face

    // Vertical leg: thin slab against inner face, top of leg flush with tube top
    color(STEEL)
        translate([STRETCHER_END_LEFT,
                   inner_face_y + (y_dir > 0 ? 0 : -ANGLE_THK),
                   z_str + TUBE/2 - ANGLE_LEG])
            cube([L, ANGLE_THK, ANGLE_LEG]);

    // Horizontal leg: lies on top of vertical leg, extends ANGLE_LEG inward
    // top of horizontal leg flush with tube top.
    color(STEEL)
        translate([STRETCHER_END_LEFT,
                   inner_face_y + (y_dir > 0 ? 0 : -ANGLE_LEG),
                   z_str + TUBE/2 - ANGLE_THK])
            cube([L, ANGLE_LEG, ANGLE_THK]);
}

// === CABLE X (back) ==========================================================
// At the BACK FACE of the back legs (Y = BACK_Y + TUBE/2), so the cables sit
// behind the steel frame plane.

module cable_x_back() {
    cable_y = BACK_Y + TUBE/2;
    bl = [LEFT_X,  cable_y, LEG_BOTTOM_Z];
    tl = [LEFT_X,  cable_y, FRAME_TOP_Z - TUBE];
    br = [RIGHT_X, cable_y, LEG_BOTTOM_Z];
    tr = [RIGHT_X, cable_y, FRAME_TOP_Z - TUBE];
    rod_between(bl, tr, CABLE_DIA, CABLE_C);
    rod_between(br, tl, CABLE_DIA, CABLE_C);
}

// === WOOD ====================================================================
module wood_top() {
    color(WOOD)
        translate([-WOOD_LENGTH/2, -WOOD_DEPTH/2, FRAME_TOP_Z])
            cube([WOOD_LENGTH, WOOD_DEPTH, WOOD_THK]);
}

// Plywood shelf — drops onto the angle-iron ledgers on the front and back
// stretchers. Top surface flush with stretcher tube tops.
//   X: 1/16" clearance per side from end-frame inner X faces
//   Y: extends from inboard edge of front angle to inboard edge of back angle
//   Z: top flush with tube top at H_BOTTOM or H_MIDDLE

module shelf(z_top) {
    SHELF_CLEAR = 1/16;
    sx_start = LEG_INNER_X_LEFT  + SHELF_CLEAR;
    sx_end   = LEG_INNER_X_RIGHT - SHELF_CLEAR;
    // Y: angle's horizontal-leg inner edge.
    // Front stretcher's tube inner face is at FRONT_Y + TUBE/2 = -9.375;
    // angle's horizontal leg extends ANGLE_LEG inward from that, so inner
    // edge is at FRONT_Y + TUBE/2 + ANGLE_LEG = -8.625. Back: +8.625.
    sy_start = FRONT_Y + TUBE/2 + ANGLE_LEG;
    sy_end   = BACK_Y  - TUBE/2 - ANGLE_LEG;
    color(SHELF)
        translate([sx_start, sy_start, z_top - SHELF_THK])
            cube([sx_end - sx_start, sy_end - sy_start, SHELF_THK]);
}

module floor_ref() {
    %color([0.95, 0.95, 0.95])
        translate([-WOOD_LENGTH/2 - 4, -WOOD_DEPTH/2 - 4, -0.05])
            cube([WOOD_LENGTH + 8, WOOD_DEPTH + 8, 0.05]);
}

// === ASSEMBLY ================================================================

end_frame(LEFT_X);
end_frame(RIGHT_X);

// 6 long stretchers (2 per shelf level)
for (y = [FRONT_Y, BACK_Y]) {
    long_stretcher(y, Z_TOP_STR, true);
    long_stretcher(y, Z_MID_STR, false);
    long_stretcher(y, Z_BOT_STR, false);
}

// Angle-iron ledgers on the bottom and middle stretchers (where the plywood
// shelves drop in). Front stretcher: y_dir = +1; back: -1.
for (z = [Z_MID_STR, Z_BOT_STR]) {
    angle_ledger(FRONT_Y, z, +1);
    angle_ledger(BACK_Y,  z, -1);
}

cable_x_back();

if (SHOW_SHELVES) {
    shelf(H_BOTTOM);
    shelf(H_MIDDLE);
}
if (SHOW_WOOD_TOP)  wood_top();
if (SHOW_FLOOR_REF) floor_ref();

// =======================================================================
// CUT LIST (approximate — verify in your physical layout):
//   Legs:                  4 × 34.75"   of 1.5"×1.5"×0.120" tube
//   End-frame horizontals: 6 × 18.75"   of 1.5"×1.5"×0.120" tube
//                            (FRAME_DEPTH - 2*TUBE = 21.75 - 3.0)
//   End-frame diagonals:   2 × ~25.5"   (cut to fit, ~42.6° from horizontal)
//   Long stretchers:       6 × 39.875"  of 1.5"×1.5"×0.120" tube
//   Plate A (tapped):     12 × 1.5"×5"×3/8"   (tapped 3/8"-16, 2 holes per plate)
//   Plate B (clearance):  12 × 1.5"×5"×3/16"  (drilled ~7/16", 2 holes per plate)
//   Angle iron ledgers:    4 × 39.875" of 3/4"×3/4"×1/8" angle
//   Bolts:                24 × 3/8"-16, ~1.0" long, hex head + flat washer
//   Levelers:              4 × 1/2"-13 swivel-base, 2" base, ~1.5" stud
//   Weld-in inserts:       4 × 1/2"-13 (one per leg bottom)
//   Leg back-wall relief:  drill 1/2" hole through leg back wall behind each
//                          tapped plate-A hole (24 holes total) for bolt-tip
//                          clearance — DO NOT TAP through the tube wall.
//   Cable:               ~12 ft of 1/8" stainless 7×19 aircraft cable
//   Cable hardware:        4 swage eye terminations + 2 turnbuckles + 4 eye plates
//   Wood top:             48"×25.75"×~1.75"  (your build)
//   Plywood shelves:       2 × 40.875"×17.25" of 3/4" plywood
//                            (drops onto angle ledgers; gravity holds it down)
// =======================================================================
