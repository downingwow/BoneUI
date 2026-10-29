# BoneUI

Standalone modular UI project for **Ascension: Conquest of Azeroth / Conquest Reborn** (WoW 3.3.5a-based).

**Maintainer:** Uncle Bone  
**Contact:** https://github.com/downingwow  
**Version:** 1.0.0 (development foundation)

## Status

The initial core provides startup, persistent settings, slash commands, a module registry, and a profile table API. Full EllesmereUI feature modules and serialized import/export conversion are not implemented or in-game tested yet.

Install the `BoneUI` folder into `Interface/AddOns/`. Commands: `/boneui version`, `/boneui modules`, `/boneui cvars` (also `/bui`).

## Goals

Minimal CVar changes, CoA custom classes/resources support, compatibility with default Blizzard UI and DragonUI, and future EllesmereUI profile import/export compatibility where technically feasible. ElvUI-CoA remains a separate project.

Preserve required upstream copyright notices and third-party attribution if upstream code is reused. Versions follow MAJOR.MINOR.PATCH; see CHANGELOG.md.
