# ``KitoCore``

Shared design tokens and building blocks for every Kito package.

## Overview

KitoCore is the foundation of the Kito ecosystem. It declares the theme tokens —
semantic colors, spacing, typography, and corner radii — exactly once, so every
other Kito package reads the same values from the SwiftUI environment instead of
hardcoding its own.

Apply a theme near the root of your app and every Kito view below it picks it up:

```swift
import SwiftUI
import KitoCore

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().autoKitoTheme()
        }
    }
}
```

Kits read the active theme with `@Environment(\.kitoTheme)`. ``KitoTheme`` is
`Equatable` and `Sendable`, so it is safe to memoize on.

## Topics

### Essentials

- <doc:Theming>
- ``KitoTheme``

### Tokens

- ``KitoColors``
- ``KitoSpacing``
- ``KitoTypography``
- ``KitoRadii``

### Surfaces and Backgrounds

- ``KitoBackgroundStyle``
- ``KitoBackgroundImage``
- ``KitoGradient``

### Loading

- ``KitoLoadState``
- ``KitoLoaderStyle``
- ``KitoLoaderKind``

### Architecture

- ``KitoViewModel``
- ``Kito``
