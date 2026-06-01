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
SHOW_FLOOR_REF   = true;
SHOW_CABLES      = true;   // cables are DEFERRED in the real build; the weld-on
                           // anchors always show. Set false for the open-back
                           // initial build.
SHOW_WOOD_MOUNTS = true;   // wood-top hold-down clips + screws/washers

// === USER-EDITABLE: DIMENSIONS ===
// Wood top IS drawn (for proportion); plywood shelves are NOT (cut to fit).
// The wood size also drives the steel frame footprint via the overhangs.
WOOD_LENGTH = 48;          // long dimension of wood top (X, left-right)
WOOD_DEPTH  = 25.75;       // front-to-back of wood top (Y)
WOOD_THK    = 1.1875;      // wood top thickness 1-3/16" (sets steel-top height)
TOTAL_HT    = 37;          // floor to top-of-wood (Z) — match counter

// Overhangs split: sides (left/right, X) vs front/back (Y). Default both
// to 2"; set independently as desired.
OVERHANG_LR = 2;           // overhang at the left/right ends  (reduces X)
OVERHANG_FB = 2;           // overhang at the front/back edges (reduces Y)

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
PLY_THK           = 23/32; // nominal 3/4" plywood, actual ~23/32" (sets ledger inset)
SHELF_SCREW_PITCH = 6;     // wood-screw hold-down spacing along the ledger (X)
SHELF_SCREW_DIA   = 3/16;  // clearance hole for shelf hold-down screws

H_BOTTOM    = 5;           // top of bottom-shelf cross-tube, off floor
H_MIDDLE    = 23.75;       // top of middle-shelf cross-tube — ~10.56" upper-bay clear

// Leveler = M12x1.75 swivel foot: 2" (50mm) rubber base, 20mm tall, 50mm
// stud, with a jam nut. The base (0.8") + jam nut set the floor, so the
// NOMINAL lift is ~1.75" (keeps the exposed stud short = rigid).
LEVELER_HT       = 1.75;   // nominal floor->leg-tube-bottom (base+nut+stud+cap)
LEVELER_BASE     = 2.0;    // swivel base diameter (50mm)
LEVELER_BASE_HT  = 0.8;    // swivel base height (20mm)
LEVELER_STUD_DIA = 0.47;   // M12 stud (~12mm) — for drawing only
LEVELER_RANGE    = 0.5;    // usable +/- foot travel (doc)

CABLE_DIA    = 1/8;

// === DERIVED ===
FRAME_LENGTH = WOOD_LENGTH - 2*OVERHANG_LR;  // 44    (sides)
FRAME_DEPTH  = WOOD_DEPTH  - 2*OVERHANG_FB;  // 21.75 (front/back)
FRAME_TOP_Z  = TOTAL_HT - WOOD_THK;          // 35.8125 (1-3/16" wood top)
LEG_BOTTOM_Z = LEVELER_HT;                   // nominal leg-bottom off floor
LEG_TOP_Z    = FRAME_TOP_Z;
// Legs are the easiest dimension to correct: cut LONG and trim the BOTTOM to
// final length after dry-assembly. All flange plates sit at/above H_BOTTOM
// (5"), well above the trim. Feet (+/-LEVELER_RANGE) + wood-underside shims
// then absorb residual height error and floor flatness.
LEG_HT       = LEG_TOP_Z - LEG_BOTTOM_Z;     // nominal 34.0625 at 1.75" lift

FRONT_Y = -FRAME_DEPTH/2 + TUBE/2;
BACK_Y  =  FRAME_DEPTH/2 - TUBE/2;
LEFT_X  = -FRAME_LENGTH/2 + TUBE/2;
RIGHT_X =  FRAME_LENGTH/2 - TUBE/2;

LEG_INNER_X_LEFT  = LEFT_X  + TUBE/2;
LEG_INNER_X_RIGHT = RIGHT_X - TUBE/2;

STRETCHER_END_LEFT  = LEG_INNER_X_LEFT  + PLATE_A_THK + PLATE_B_THK;
STRETCHER_END_RIGHT = LEG_INNER_X_RIGHT - PLATE_A_THK - PLATE_B_THK;

// Stretcher centerlines
Z_TOP_STR = FRAME_TOP_Z - TUBE/2;            // 35.0625
Z_MID_STR = H_MIDDLE - TUBE/2;               // 23.0
Z_BOT_STR = H_BOTTOM - TUBE/2;               // 4.25

// Plate centerlines (Z). Top plate is asymmetric — top flush with leg top
// (35.8125") so it doesn't poke above. Plate H = 5", center = 33.3125.
// Other plates are centered on the stretcher centerline.
Z_TOP_PLATE = FRAME_TOP_Z - PLATE_H/2;       // 33.3125 (top edge at 35.8125)
Z_MID_PLATE = Z_MID_STR;                     // 23.0
Z_BOT_PLATE = Z_BOT_STR;                     //  4.25

// Colors — square TUBE is steel-grey; every NON-tube part gets its own
// contrasting color so the joints/parts read clearly.
STEEL     = [0.55, 0.57, 0.60];  // all square tube (legs, stretchers, diagonals)
WOOD      = [0.62, 0.42, 0.22];  // wood top
PLATE_A_C = [0.20, 0.45, 0.85];  // plate A — tapped, welded to leg (blue)
PLATE_B_C = [0.95, 0.75, 0.15];  // plate B — clearance, on stretcher end (amber)
ANGLE_C   = [0.20, 0.65, 0.30];  // angle-iron shelf ledgers (green)
CLIP_C    = [0.60, 0.25, 0.75];  // wood-top hold-down clips (purple)
ANCHOR_C  = [0.85, 0.15, 0.15];  // weld-on cable anchors (red)
BOLT_C    = [0.15, 0.15, 0.18];  // bolts / screws / washers
CABLE_C   = [0.85, 0.85, 0.88];  // tensioned cable
LEVEL_C   = [0.18, 0.18, 0.20];  // leveler feet

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
    color(PLATE_A_C)
        translate([x0, y_center - PLATE_W/2, z_center - PLATE_H/2])
            cube([PLATE_A_THK, PLATE_W, PLATE_H]);
}

module plate_b(stretcher_end_x, y_center, z_center, side) {
    x0 = (side > 0) ? stretcher_end_x - PLATE_B_THK : stretcher_end_x;
    color(PLATE_B_C)
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
    color(LEVEL_C) {
        // rubber swivel base
        translate([x, y, 0]) cylinder(d=LEVELER_BASE, h=LEVELER_BASE_HT);
        // M12 stud up to the leg-tube bottom
        translate([x, y, LEVELER_BASE_HT])
            cylinder(d=LEVELER_STUD_DIA, h=LEG_BOTTOM_Z - LEVELER_BASE_HT);
    }
}

// === END FRAME ===============================================================
// One welded end frame in the YZ plane at X = x0.
// Two legs, three horizontal cross-tubes (bottom/middle shelves + top),
// one internal diagonal in the lower bay (true 45°, single-miter — see
// below), and three plate A's on each leg's inner X face.

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

    // Internal diagonal in the lower bay, at a TRUE 45°, with a SINGLE 45°
    // miter at each end (no chevron/arrow, no square cut). Modeled as a
    // Y-Z profile (4 corners) extruded TUBE thick in X, so the miter faces
    // are real flat cuts that seat against the members:
    //   * upper end: VERTICAL miter face, seats flat on the back leg's
    //     inner face; its top corner tucks into the back-top bay corner
    //     (leg inner face × middle-stretcher underside).
    //   * lower end: HORIZONTAL miter face, seats flat on the bottom
    //     stretcher's top; the toe lands ~1.5" shy of the front leg.
    by_   = BACK_Y - TUBE/2;        // 9.375  back leg inner face (Y)
    tz_   = H_MIDDLE - TUBE;        // 22.25  middle-stretcher underside (Z)
    bz_   = H_BOTTOM;               // 5      bottom-stretcher top (Z)
    face_ = TUBE * sqrt(2);         // vertical height of the 45° upper miter
    diag_pts = [
        [by_,                       tz_],          // top-back (tucks in corner)
        [by_,                       tz_ - face_],  // bottom-back
        [by_ - (tz_ - face_ - bz_), bz_],          // heel (back of lower miter)
        [by_ - (tz_ - bz_),         bz_]           // toe  (~1.5" off front leg)
    ];
    color(STEEL)
        multmatrix([[0,0,1, x0 - TUBE/2],
                    [1,0,0, 0],
                    [0,1,0, 0],
                    [0,0,0, 1]])
            linear_extrude(height = TUBE)
                polygon(diag_pts);

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

    // y_dir points INBOARD (toward stand center): +1 for the FRONT stretcher
    // (inboard = +Y), -1 for the BACK stretcher (inboard = -Y).
    inboard_face_y = y_center + y_dir * TUBE/2;   // tube's interior side face
    tube_top       = z_str + TUBE/2;
    support_z      = tube_top - PLY_THK;          // plywood underside = top of
                                                  // horizontal leg, INSET DOWN
                                                  // so the ply TOP finishes
                                                  // flush with the tube top.

    // Vertical leg: thin slab welded to the inboard side wall, hanging down
    // from the support level (weld length below the plywood line).
    vy = (y_dir > 0) ? inboard_face_y : inboard_face_y - ANGLE_THK;
    color(ANGLE_C)
        translate([STRETCHER_END_LEFT, vy, support_z - ANGLE_LEG])
            cube([L, ANGLE_THK, ANGLE_LEG]);

    // Horizontal leg: top at support_z (plywood rests here), extends ANGLE_LEG
    // inboard. Plywood is dimensionally stable, so it's held with wood screws
    // up through holes every ~SHELF_SCREW_PITCH (round holes, no slots).
    hy = (y_dir > 0) ? inboard_face_y : inboard_face_y - ANGLE_LEG;
    color(ANGLE_C)
        difference() {
            translate([STRETCHER_END_LEFT, hy, support_z - ANGLE_THK])
                cube([L, ANGLE_LEG, ANGLE_THK]);
            for (x = [STRETCHER_END_LEFT + SHELF_SCREW_PITCH/2 :
                      SHELF_SCREW_PITCH : STRETCHER_END_RIGHT])
                translate([x, inboard_face_y + y_dir*ANGLE_LEG/2,
                           support_z - ANGLE_THK - 0.01])
                    cylinder(d=SHELF_SCREW_DIA, h=ANGLE_THK + 0.02);
        }
}

// === CABLE X (back) + WELD-ON ANCHORS ========================================
// The 4 cable anchors are welded to the rear corner legs at FABRICATION
// (before paint), even though the cables are DEFERRED (see DESIGN.md). Each
// anchor is a small 3/16" tab EDGE-welded so it projects off the back face
// (+Y) with its hole standing clear of the tube; a shackle / turnbuckle jaw
// pins through it (hole axis along X). The cable X, when fitted, terminates
// at these holes.
ANCHOR_THK    = PLATE_B_THK;                          // 3/16" tab
ANCHOR_PROJ   = 1.0;                                  // stand-off from back face (+Y)
ANCHOR_HT     = 0.75;                                 // tab height (Z)
ANCHOR_HOLE   = 0.40;                                 // ~ for a 1/4" shackle pin
ANCHOR_BACK_Y = BACK_Y + TUBE/2;                      // back face of the back legs
ANCHOR_HOLE_Y = ANCHOR_BACK_Y + ANCHOR_PROJ - 0.30;  // hole near the free end
ANCHOR_Z      = [LEG_BOTTOM_Z, FRAME_TOP_Z - TUBE];  // bottom & top cable corners

module cable_anchor(x, z) {
    color(ANCHOR_C)
        translate([x - ANCHOR_THK/2, ANCHOR_BACK_Y, z - ANCHOR_HT/2])
            difference() {
                cube([ANCHOR_THK, ANCHOR_PROJ, ANCHOR_HT]);
                translate([-0.01, ANCHOR_PROJ - 0.30, ANCHOR_HT/2])
                    rotate([0, 90, 0])
                        cylinder(d=ANCHOR_HOLE, h=ANCHOR_THK + 0.02);
            }
}

module cable_anchors() {
    for (x = [LEFT_X, RIGHT_X], z = ANCHOR_Z) cable_anchor(x, z);
}

module cable_x_back() {
    bl = [LEFT_X,  ANCHOR_HOLE_Y, LEG_BOTTOM_Z];
    tl = [LEFT_X,  ANCHOR_HOLE_Y, FRAME_TOP_Z - TUBE];
    br = [RIGHT_X, ANCHOR_HOLE_Y, LEG_BOTTOM_Z];
    tr = [RIGHT_X, ANCHOR_HOLE_Y, FRAME_TOP_Z - TUBE];
    rod_between(bl, tr, CABLE_DIA, CABLE_C);
    rod_between(br, tl, CABLE_DIA, CABLE_C);
}

// === WOOD-TOP HOLD-DOWN CLIPS ================================================
// Small steel tabs welded to the inboard side of the TOP long stretchers,
// top face flush with the tube top. A pan-head screw runs UP through the
// slotted hole + a fender washer into a threaded insert in the wood, clamping
// it down; the Y-slot lets the wood expand/contract seasonally. ONE clip is
// the fixed ANCHOR (round hole, front-center); all others are slotted in Y.
// Modeled: the welded tab (with slot/hole) + the fender washer + screw head.
WOODCLIP_W    = 1.25;    // tab width (X)
WOODCLIP_PROJ = 1.5;     // tab projection inboard (Y) from stretcher inner face
WOODCLIP_THK  = 3/16;    // tab thickness (Z)
WOODCLIP_HOLE = 7/16;    // screw clearance (for a 3/8" screw)
WOODCLIP_SLOT = 0.5;     // extra Y travel for wood movement
WASHER_DIA    = 1.0;     // fender washer

module wood_clip(x_center, y_center, y_dir, anchored) {
    inner_face_y = y_center + y_dir * TUBE/2;          // inboard face of stretcher
    y_min  = (y_dir > 0) ? inner_face_y : inner_face_y - WOODCLIP_PROJ;
    z0     = FRAME_TOP_Z - WOODCLIP_THK;               // top flush with tube top
    hole_y = inner_face_y + y_dir * 0.85;              // hole near inboard end

    // welded tab with a slotted (or round, if anchored) hole
    color(CLIP_C)
        difference() {
            translate([x_center - WOODCLIP_W/2, y_min, z0])
                cube([WOODCLIP_W, WOODCLIP_PROJ, WOODCLIP_THK]);
            if (anchored)
                translate([x_center, hole_y, z0 - 0.01])
                    cylinder(d=WOODCLIP_HOLE, h=WOODCLIP_THK + 0.02);
            else
                hull() for (dy = [-WOODCLIP_SLOT/2, WOODCLIP_SLOT/2])
                    translate([x_center, hole_y + dy, z0 - 0.01])
                        cylinder(d=WOODCLIP_HOLE, h=WOODCLIP_THK + 0.02);
        }
    // fender washer (flush under tab) + pan-head screw, threading UP into wood
    color(BOLT_C) {
        translate([x_center, hole_y, z0 - 0.06]) cylinder(d=WASHER_DIA, h=0.06);
        translate([x_center, hole_y, z0 - 0.20]) cylinder(d=0.60, h=0.14);
    }
}

// === WOOD TOP ================================================================
// The wood top IS drawn so proportions read in the model. Plywood shelves are
// NOT drawn (cut to fit after the frame is built); the angle-iron ledgers
// (above) are their supports and ARE modeled.
module wood_top() {
    color(WOOD)
        translate([-WOOD_LENGTH/2, -WOOD_DEPTH/2, FRAME_TOP_Z])
            cube([WOOD_LENGTH, WOOD_DEPTH, WOOD_THK]);
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

cable_anchors();                 // welded at fab — always present
if (SHOW_CABLES) cable_x_back(); // cables are deferred in the real build

// Wood-top hold-down clips on the front & back TOP stretchers.
// Front-center clip is the fixed anchor (round hole); the rest are Y-slotted.
if (SHOW_WOOD_MOUNTS)
    for (x = [-FRAME_LENGTH/4, 0, FRAME_LENGTH/4]) {
        wood_clip(x, FRONT_Y, +1, x == 0);
        wood_clip(x, BACK_Y,  -1, false);
    }

if (SHOW_WOOD_TOP)  wood_top();
if (SHOW_FLOOR_REF) floor_ref();

// =======================================================================
// CUT LIST (approximate — verify in your physical layout):
//   Legs:                  4 × ~34.06"  of 1.5"×1.5"×0.120" tube (nominal at
//                            1.75" leveler lift; cut LONG, trim bottom to fit)
//   End-frame horizontals: 6 × 18.75"   of 1.5"×1.5"×0.120" tube
//                            (FRAME_DEPTH - 2*TUBE = 21.75 - 3.0)
//   End-frame diagonals:   2 × ~24.4"   (true 45°; single 45° miter each end:
//                            back-top end seats on the back leg, lower end on
//                            the bottom stretcher ~1.5" shy of the front leg)
//   Long stretchers:       6 × 39.875"  of 1.5"×1.5"×0.120" tube
//   Plate A (tapped):     12 × 1.5"×5"×3/8"   (tapped 3/8"-16, 2 holes per plate)
//   Plate B (clearance):  12 × 1.5"×5"×3/16"  (drilled ~7/16", 2 holes per plate)
//   Foot-cap plates:       4 × 1.5"×1.5"×3/8" steel, welded on leg ends (cap),
//                            tapped M12×1.75 for the leveler studs
//   Angle iron ledgers:    4 × 39.875" of 3/4"×3/4"×1/8" angle (horizontal leg
//                            inset ~23/32" below tube top; drilled for shelf
//                            screws every ~6")
//   Bolts:                24 × 3/8"-16, ~1.0" long, hex head + flat washer
//   Levelers:              4 × M12×1.75 swivel feet, 2" (50mm) rubber base
//                            (20mm tall), 50mm stud (Luomorgo or similar)
//   Leg back-wall relief:  drill 1/2" hole through leg back wall behind each
//                          tapped plate-A hole (24 holes total) for bolt-tip
//                          clearance — DO NOT TAP through the tube wall.
//   Cable anchors:         4 × 3/16" tabs EDGE-welded to the rear corner legs at
//                            fabrication (hole stands off the tube, ~1/4" pin) —
//                            welded even though cables are DEFERRED (see DESIGN.md)
//   Cable (deferred):    ~12 ft of 1/8" stainless 7×19 cable + 4 eye terminals
//                            + 2 jaw-jaw turnbuckles + 2 shackles — add only if
//                            post-build testing shows wobble
//   Wood-top hold-downs:   6 × ~1.25"×1.5"×3/16" steel clips welded to the top
//                            stretchers (front-center = fixed round-hole anchor,
//                            rest Y-slotted) + 6 × 3/8"-16 threaded inserts in
//                            wood + pan-head screws + 1" fender washers
//   Wood top:             48"×25.75"×1-3/16" red oak/white oak/maple (drawn for
//                            reference; cut to fit — drives the steel footprint)
//   Plywood shelves:       cut to fit after the frame is built (NOT modeled;
//                            drop into the ledger recess, ply TOP flush with
//                            tube top; wood-screwed up through the ledger ~6")
// =======================================================================
