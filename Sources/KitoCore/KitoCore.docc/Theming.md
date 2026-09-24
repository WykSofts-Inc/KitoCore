# Theming

Apply, customize, and read the Kito theme.

## Overview

Every Kito view reads a single ``KitoTheme`` value from the SwiftUI environment.
A theme bundles four token groups: ``KitoColors``, ``KitoSpacing``,
``KitoThemeTypography``, and ``KitoRadii``.

### Follow the system appearance

Call `autoKitoTheme()` once near the root of your view hierarchy. It picks
``KitoTheme/light`` or ``KitoTheme/dark`` from the current color scheme.

```swift
ContentView()
    .autoKitoTheme()
```

### Choose a theme explicitly

Use `kitoTheme(_:)` when a screen must render in one mode regardless of the
system setting. KitoCore ships ``KitoTheme/light``, ``KitoTheme/dark``, and the
dark glass ``KitoTheme/neon`` preset.

```swift
ContentView()
    .kitoTheme(.dark)
    .preferredColorScheme(.dark)
```

### Build your own theme

Start from a color preset and override only the tokens you need. Spacing,
typography, and radii fall back to their defaults.

```swift
var colors = KitoColors.light
colors.primary = .indigo

let brand = KitoTheme(colors: colors, radii: KitoRadii(lg: 20))

ContentView()
    .kitoTheme(brand)
```

### Read the theme in your own views

```swift
struct Badge: View {
    @Environment(\.kitoTheme) private var theme

    var body: some View {
        Text("New")
            .font(theme.typography.label)
            .padding(theme.spacing.xs)
            .background(theme.colors.primary, in: Capsule())
            .foregroundStyle(theme.colors.onPrimary)
    }
}
```

Kits never hardcode a color, spacing value, font, or radius — they always go
through the theme, so a single override restyles the whole app.
