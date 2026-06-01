# 3D Printer Stand — Specifications

Hard requirements and dimensions for the stand. Anything in this file is fixed
unless explicitly renegotiated. Soft design choices live in `DESIGN.md`.

## Top-level dimensions

| Dimension | Value | Notes |
|---|---|---|
| Wood top length (X) | **48"** | Fixed — set by intended use |
| Wood top depth (Y) | **25.75"** | Fixed |
| Total height (floor → top of wood) | **37"** | Must match adjacent kitchen counter exactly |
| Wood top thickness | **1-3/16" (1.1875")** target | Matches adjacent counter; planed to final after measuring the steel; ±1/8" planing tolerance |
| Wood overhang — sides (L/R, X) | **2"** (default) | Independent of front/back; lets feet clear molding |
| Wood overhang — front/back (Y) | **2"** (default) | Independent of sides |

## Steel frame footprint (derived)

| Dimension | Value |
|---|---|
| Steel frame length (X) | 48 − 2·OH_sides = **44"** |
| Steel frame depth (Y)  | 25.75 − 2·OH_frontback = **21.75"** |
| Steel frame top height | 37 − 1.1875 = **35.8125"** (nominal — tuned at install) |

## Constraints

- **Knockdown required.** Stand must disassemble to pass through a 28"-wide,
  74"-tall doorway with a wall 37" away (forces a tight turn). No single
  assembled element may exceed those limits.
- **Counter-flush height.** The top must end up *exactly* level with the
  adjacent kitchen counter so equipment can straddle the seam. Primary
  height control is cutting the legs to final length at assembly (trim the
  bottoms after dry-fit). The swivel feet (set mid-range) absorb residual
  build error and floor flatness; shims at the wood-to-steel interface make
  the final fine match (±1/4").
- **Wood movement.** A solid hardwood top of this depth moves ~1/4" across
  grain seasonally. The mounting system must allow this movement without
  cracking the top. (Slotted holes + fender washers; anchor at one point.)
- **Rigidity.** Stand must not visibly wobble while a Bambu A1 (bedslinger,
  front-back motion) prints at fast speeds.
- **AMS 2 Pro side-mount only.** Ceiling has pipes; AMS cannot stack on top
  of any printer. Stand height cannot be reduced (counter-match constraint),
  so the AMS lives on a side mount attached to the printer.
- **Tile floor.** 12"×12" tiles. Levelers position over tile centers, not
  grout lines. Felt/rubber under leveler bases to protect tile and add friction.
- **Front of stand must be open.** No bracing on the front face — printer
  loads/operates from the front.

## Materials

| Component | Spec |
|---|---|
| Frame tubing | 1.5" × 1.5" × 0.120" wall, A500 mild steel |
| Flange plate A (leg side) | 1.5" × **5"** × **3/8"** mild steel, tapped 3/8"-16 (2 holes) |
| Flange plate B (stretcher end) | 1.5" × **5"** × **3/16"** mild steel, drilled ~7/16" clearance (2 holes) |
| Angle iron ledgers (plywood support) | 3/4" × 3/4" × 1/8" mild angle, runs along inboard top edge of front and back stretchers at the two shelf levels |
| Bolts | 3/8"-16 grade 5+, ~1.0" long, hex head with flat washer (no nuts — threads engage tapped plate A) |
| Leveler studs | M12×1.75 |
| Leveler foot | 2" (50mm) swivel base, 20mm tall, 50mm stud, rubber/nylon base (Luomorgo or similar) |
| Leveler foot-cap | 1.5"×1.5"×3/8" steel plate, welded on the leg end (cap), tapped M12×1.75 (~5 threads of engagement) |
| Cable (back X) — *deferred* | 1/8" stainless 7×19 aircraft cable. Not installed at first; added only if post-build testing shows wobble (see `DESIGN.md`) |
| Cable terminations — *deferred* | 4 mechanical/swageless eye terminals (e.g. Hayn Hi-MOD — no swage tool) or swaged eyes; 2 turnbuckles (jaw-and-jaw stainless); 2 stainless shackles (~1/4" pin) |
| Cable anchors — *welded at fab* | 4 anchors on rear face of corner legs, welded during initial fabrication (before finish). Small mild-steel tab **edge-welded so the hole stands clear of the tube**, OR a weld-on pad eye / D-ring. Hole sized for a 1/4" shackle pin. Load is trivial (~10–30 lb functional, ~140 lb worst-case shove); size for looks/weldability, not strength — any decent welded tab carries thousands of lb. No swivel needed (the shackle articulates) |
| Shelves | 3/4" plywood (or hardwood — woodworker's choice) |
| Wood top | Hand-built by owner, **1-3/16" thick** (matches counter); red oak / white oak / hard maple |

## Heights / shelf layout

| Element | Z (top of, off floor) |
|---|---|
| Bottom shelf | 5" |
| Middle shelf | 23.75" |
| Steel top frame | 35.8125" |
| Wood top surface | 37" |

**Vertical clearances:**
- Floor → bottom shelf: 5" (toe space)
- Bottom shelf → middle shelf: 17.25" clear (fits 8" filament spools standing up with margin)
- Middle shelf → underside of top frame: ~10.56" clear

**End-frame lower-bay diagonal:** 18.75" wide × 17.25" tall bay. True 45°: starts at the back-top corner (single 45° miter seating on the back leg), runs down toward the front, and lands on the bottom stretcher ~1.5" short of the front leg (the bay is wider than it is tall, so a 45° run can't reach the front corner). Diagonal length ~24.4". Single 45° miter at each end.

## Joints

- **Welded:** all corners and members within each end frame, including the
  internal diagonal. Plate A welded flush to leg's inner X face. On long
  stretchers: plate B welded to open tube end. Angle iron ledgers welded
  along the inboard top edge of bottom and middle stretchers. Foot-cap
  plates welded onto the leg ends (tapped M12×1.75 for the leveler studs).
- **Bolted:** all 6 long stretchers attach to end frames via flange plate
  pairs (**2 bolts per joint × 12 joints = 24 bolts total**). Bolts thread
  directly into tapped plate A — no separate nuts.
- **Tensioned (deferred):** cable X on rear face only — *not installed in the
  initial build.* The 4 anchor pads are welded on at fabrication; the
  cables/turnbuckles/shackles are added later only if testing shows wobble. If
  installed, re-tension after first month of use.
- **Resting:** plywood shelves drop onto angle iron ledgers. Gravity holds
  them down; no fasteners required for installation.

### Flange-plate joint geometry

- Plates are **1.5" wide × 5" tall**, oriented vertically (no Y-direction
  protrusion — plate width matches leg width).
- **All 12 joints use identical plate dimensions.**
- **Top stretchers:** plate top flush with leg top (35.8125"), so plate
  extends from 35.8125" down to 30.8125". Stretcher tube enters at top of
  plate (top 1.5"). Both bolts sit *below* the tube — 0.75" below tube
  bottom and 1.5" further below.
- **Middle and bottom stretchers:** plate centered on stretcher centerline.
  Tube enters middle of plate. 1 bolt above tube and 1 below, each at
  ±1.75" from stretcher centerline, 0.75" margin to plate edge.
- 2 bolts per joint × 12 joints = 24 bolts total.
- Bolt enters from stand interior, passes through plate B clearance hole,
  threads into plate A tapped hole. **Bolt tip stops inside plate A — never
  enters the leg.**

### Why bolt-tip clearance, not threads, in the leg wall

After plate A is welded to the leg, the leg back wall is behind it. Drill
**1/2" relief holes** through the leg back wall behind each tapped plate-A
hole (24 holes total). DO NOT tap into the leg wall:
- Leg wall is 0.120" — only ~30% of one bolt diameter; useless thread engagement
- Tap drift between plate (3/8" thick) and tube wall (0.120") risks cross-threading
- Plate A's 6 threads of engagement already exceed bolt strength; adding
  unreliable wall threads contributes nothing

The relief hole gives bolt tips somewhere to go without bottoming out, and
keeps the joint geometry forgiving to bolt-length variation.

### Angle iron ledger geometry

- 3/4" × 3/4" × 1/8" angle, run continuous along each long stretcher's
  inboard top edge (between flange plates).
- Vertical leg welded to the inboard side wall of the stretcher tube,
  upper portion. Horizontal leg extends inward (toward stand center).
- Top of horizontal leg is **flush with the top of the stretcher tube** —
  3/4" plywood drops onto it and the plywood top sits flush with the steel
  tube top.
- Only on bottom and middle stretchers (not top — wood top mounts
  differently). Only on long stretchers (not end-frame cross-tubes — 3/4"
  plywood spans the 21" depth without sag).

## Frame member count

| Member | Qty | Length (approx.) | Notes |
|---|---|---|---|
| Legs | 4 | ~34.06" nominal | 1.5"×1.5"×0.120" tube; cut long, trim bottom to fit |
| End-frame horizontals (3 per end frame × 2 end frames) | 6 | 18.75" | 1.5"×1.5"×0.120" tube |
| End-frame diagonals (one per end frame, lower bay) | 2 | ~24.4" | 1.5"×1.5"×0.120" tube, true 45°, single miter each end |
| Long stretchers (tube length, end-to-end) | 6 | 39.875" | 1.5"×1.5"×0.120" tube |
| Angle iron ledgers | 4 | 39.875" | 3/4"×3/4"×1/8" angle |
| Plate A (tapped, leg side) | 12 | 1.5"×5"×3/8" | 2 tapped 3/8"-16 holes |
| Plate B (clearance, stretcher end) | 12 | 1.5"×5"×3/16" | 2 clearance ~7/16" holes |
| Foot-cap plates (leg ends) | 4 | 1.5"×1.5"×3/8" | welded on, tapped M12×1.75 for leveler |
| Bolts | 24 | 3/8"-16 × 1" | hex head + flat washer |

## Weight (estimated)

| Group | Weight |
|---|---|
| Steel tube + plates + angle iron | ~125 lb |
| Hardware (bolts, levelers, cable) | ~12 lb |
| Wood top + plywood shelves | ~50 lb |
| **Assembled total** | **~185 lb** |

## Site

- Built in: garage
- Used in: room adjacent to kitchen, low-ceiling (with overhead pipes)
- Floor: tile, 12"×12" tiles
- Adjacent surface: kitchen counter — top must match its height exactly
