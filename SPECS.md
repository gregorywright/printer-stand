# 3D Printer Stand — Specifications

Hard requirements and dimensions for the stand. Anything in this file is fixed
unless explicitly renegotiated. Soft design choices live in `DESIGN.md`.

## Top-level dimensions

| Dimension | Value | Notes |
|---|---|---|
| Wood top length (X) | **48"** | Fixed — set by intended use |
| Wood top depth (Y) | **25.75"** | Fixed |
| Total height (floor → top of wood) | **37"** | Must match adjacent kitchen counter exactly |
| Wood top thickness | **~1.75"** (target) | Hand-built; tolerance ±1/4". Final height tuned via shims. |
| Wood overhang | **2" on all 4 sides** | Lets feet clear baseboard/molding; lets top butt against counter |

## Steel frame footprint (derived)

| Dimension | Value |
|---|---|
| Steel frame length (X) | 48 − 2·2 = **44"** |
| Steel frame depth (Y)  | 25.75 − 2·2 = **21.75"** |
| Steel frame top height | 37 − 1.75 = **35.25"** (nominal — tuned at install) |

## Constraints

- **Knockdown required.** Stand must disassemble to pass through a 28"-wide,
  74"-tall doorway with a wall 37" away (forces a tight turn). No single
  assembled element may exceed those limits.
- **Counter-flush height.** The top must end up *exactly* level with the
  adjacent kitchen counter so equipment can straddle the seam. Height is
  tuned at the wood-to-steel interface (shims), not the levelers.
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
| Flange plate A (leg side) | 1.5" × 6" × **3/8"** mild steel, tapped 3/8"-16 (4 holes) |
| Flange plate B (stretcher end) | 1.5" × 6" × **3/16"** mild steel, drilled ~7/16" clearance (4 holes) |
| Bolts | 3/8"-16 grade 5+, ~1.0" long, hex head with flat washer (no nuts — threads engage tapped plate A) |
| Leveler studs | 1/2"-13 |
| Leveler base | 2" diameter, swivel-base type |
| Leveler insert | Weld-in threaded insert, 1/2"-13, ~3/4" engagement length |
| Cable (back X) | 1/8" stainless 7×19 aircraft cable |
| Cable terminations | Swaged eye ends, 2 turnbuckles (jaw-and-jaw stainless) |
| Cable anchors | Welded eye plates on rear face of corner legs |
| Shelves | 3/4" plywood (or hardwood — woodworker's choice) |
| Wood top | Hand-built by owner, ~1.75" thick |

## Heights / shelf layout

| Element | Z (top of, off floor) |
|---|---|
| Bottom shelf | 5" |
| Middle shelf | 23.75" |
| Steel top frame | 35.25" |
| Wood top surface | 37" |

**Vertical clearances:**
- Floor → bottom shelf: 5" (toe space)
- Bottom shelf → middle shelf: 17.25" clear (fits 8" filament spools standing up with margin)
- Middle shelf → underside of top frame: 10" clear

**End-frame lower-bay diagonal:** 18.75" wide × 17.25" tall bay, diagonal length ~25.5", angle ~42.6° from horizontal.

## Joints

- **Welded:** all corners and members within each end frame, including the
  internal diagonal. Plate A welded flush to leg's inner X face. On long
  stretchers: plate B welded to open tube end, knee brace welded to plate B
  and stretcher tube.
- **Bolted:** all 6 long stretchers attach to end frames via flange plate
  pairs (4 bolts per joint × 12 joints = **48 bolts total**). Bolts thread
  directly into tapped plate A — no separate nuts.
- **Tensioned:** cable X on rear face only. Re-tension after first month of use.

### Flange-plate joint geometry

- Plates are **1.5" wide × 6" tall**, oriented vertically along the leg.
- Plate width matches leg width — **plates do not protrude in the Y direction**
  beyond the leg's footprint.
- 4 bolts per joint, in a **vertical column** at 1.5" spacing.
- For top stretchers: plate top edge is flush with leg top (35.25"), plate
  extends 4.5" downward from stretcher centerline. The lower extension is the
  weld surface for the knee brace.
- For middle and bottom stretchers: plate is centered on stretcher centerline.
- Bolt enters from stand interior, passes through plate B clearance hole,
  threads into plate A tapped hole. Bolt tip stops inside plate A — never
  enters the leg.

## Frame member count

| Member | Qty | Length (approx.) | Notes |
|---|---|---|---|
| Legs | 4 | 34.75" | 1.5"×1.5"×0.120" tube |
| End-frame horizontals (3 per end frame × 2 end frames) | 6 | 18.75" | 1.5"×1.5"×0.120" tube |
| End-frame diagonals (one per end frame, lower bay) | 2 | ~25.5" | 1.5"×1.5"×0.120" tube, ~42.6° |
| Long stretchers (tube length, end-to-end) | 6 | 39.875" | 1.5"×1.5"×0.120" tube |
| Top knee braces | 4 | ~6.25" | 1.5"×1.5"×0.120" tube |
| Plate A (tapped, leg side) | 12 | 1.5"×6"×3/8" | 4 tapped 3/8"-16 holes, vertical column |
| Plate B (clearance, stretcher end) | 12 | 1.5"×6"×3/16" | 4 clearance ~7/16" holes, vertical column |

## Weight (estimated)

| Group | Weight |
|---|---|
| Steel tube + plates | ~120 lb |
| Hardware (bolts, levelers, cable) | ~15 lb |
| Wood top + shelves | ~50 lb |
| **Assembled total** | **~185 lb** |

## Site

- Built in: garage
- Used in: room adjacent to kitchen, low-ceiling (with overhead pipes)
- Floor: tile, 12"×12" tiles
- Adjacent surface: kitchen counter — top must match its height exactly
