# Zalo iOS UI Clone — SwiftUI (built in 2 days)

Goal: Show fast learning in the Apple ecosystem by cloning Zalo’s UI with SwiftUI, starting from zero Swift.

## Demo

[<video src="demo.mov" controls width="400"></video>](https://github.com/user-attachments/assets/57f2cef4-1bd6-49e6-9477-6f71455f930b)

## Why I built this

- Interview prep for an iOS role at Zalo.

## Background

- 2+ years building mobile apps with React Native + TypeScript.
- I hadn’t used Swift before this; RN experience helped me pick up SwiftUI to clone the UI quickly.

## Context & time constraints

- Built alongside my thesis defense; the defense and Zalo interview were back-to-back.
- Not a continuous “2-day sprint.” With more time, I’d add a small fake backend to simulate async flows (fetching, send states, pagination).

## How I approached it

- Learn core Swift and SwiftUI concepts via Apple docs and WWDC sessions, then build.
- Apply RN experience to set up folders, MVVM architecture, navigation, and a small design system; then clone the UIs.

References:

- ["A Swift Tour" — Swift Book](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/guidedtour)
- [WWDC 2024 — SwiftUI navigation and architecture](https://developer.apple.com/videos/play/wwdc2024/10150/)
- [Zalo Mini App Framework UI guideline (Figma)](https://www.figma.com/design/ME5AP7pt79huTBTMdnT7yX/-PUBLIC--Zalo-Mini-App-Framework-2.0?node-id=1-12959)

## What this shows

- Shipped a polished UI clone fast.
- Practical SwiftUI + MVVM with clean, reusable components.

---

## What’s included (UI only)

- Auth: Onboarding, Login, Register.
- Tabs: Messages, Contacts, Discovery, Timeline, Me.
- Conversation UI: header, message previews, basic chat structure.
- Design primitives: colors, spacing, typography, button/header styles.
- Limitations: mock/static data only; no networking, persistence, or real-time.

## Run it

1. Open `zalo-toy.xcodeproj` in Xcode.
2. Select an iOS Simulator (e.g., iPhone 16) and Run.

## Credits

- Educational UI clone inspired by the Zalo iOS app. Not affiliated. Trademarks belong to their owners.
