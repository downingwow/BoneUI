# BoneUI v1.1.0 — Early Ellesmere compatibility build

Standalone modular UI work for Conquest Reborn's 3.3.5a client. This release contains the supplied early compatibility package based on EllesmereUI 9.6.9 visuals, not a complete direct source port.

Implemented: isolated startup/settings, movable player/target/focus information frames, a player cast/channel timer, optional action-button accents, independent BoneUIBackportDB storage and no CVar writes.

Not implemented: the original settings engine, profile import/export, original unit-frame/action-bar architecture, raid frames, bags, nameplates, cooldown manager, resource bars and unlock mode. ElvUI/DragonUI coexistence is optional; the project is intended to work independently.

Install the BoneUI folder in Interface/AddOns. Keep the original EllesmereUI disabled. `/bui` opens settings; `/bui reset` clears this backport's own settings and reloads. Existing EllesmereUIDB is not modified. Back up BoneUI settings before upgrading from older builds because this package uses separate BoneUIBackportDB storage.

This is an alpha implementation published on the requested stable release channel; live-client validation remains pending. Original EllesmereUI media attribution and the supplied restrictive license remain intact. Publication does not alter or grant additional rights under that license. See BoneUI/LICENSE-ELLESMERE.txt and BoneUI/README.md for the original personal-use restrictions.

Maintainer: Uncle Bone — https://github.com/downingwow
