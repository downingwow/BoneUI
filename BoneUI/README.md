# BoneUI v1.1.0 — EllesmereUI 9.6.9 personal-use backport (early compatibility build)

This is a **new, isolated 3.3.5a compatibility layer** using original EllesmereUI artwork and attribution. It is NOT a complete direct source port of EllesmereUI 9.6.9. The modern source remains the reference for subsequent module conversions.

## Install
1. Remove/rename your old `Interface/AddOns/BoneUI` folder (do not delete saved variables).
2. Extract this ZIP into `Interface/AddOns`, producing one `BoneUI` folder.
3. Run `/bui` to open settings. `/bui reset` clears this port's own settings and reloads the UI.
4. Keep original EllesmereUI disabled on the 3.3.5a client. This port uses separate `BoneUIBackportDB` storage and does not modify `EllesmereUIDB`.

## Implemented
- Original EllesmereUI logo and visual assets, original license preserved.
- 3.3.5a-safe core, error-isolated module initialization and standalone settings.
- Movable player, target and focus information frames, refreshed from unit events.
- Player cast/channel timer.
- Optional main/multi action button accents, without secure frame movement.
- Independent saved settings; no CVar writes.

## Not implemented yet
- Original EllesmereUI settings engine, profile import/export, exact original unit frame/action bar architecture, raid frames, bags, nameplates, cooldown manager, resource bars, unlock mode.
- Custom Ascension resource detection beyond standard 3.3.5a APIs.

## Testing
This build has not been validated inside Conquest Reborn. Report Lua errors and whether `/bui` opens. Original source license applies to bundled original assets; do not redistribute without appropriate permission.
