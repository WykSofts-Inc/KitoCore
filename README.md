# KitoCore

**[Documentation](https://wyksofts-inc.github.io/KitoCore/documentation/kitocore/)**

Shared foundation for the Kito ecosystem: theme tokens, semantic colors, spacing,
typography, corner radii, and the `Kito.version` constant. Every other Kito package
depends on this one so tokens are declared exactly once.

## Install

```swift
.package(url: "https://github.com/WykSofts-Inc/KitoCore.git", from: "1.2.0"),
```

Add `KitoCore` to your target's `dependencies`.

## Use

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

Or take control:

```swift
ContentView()
    .kitoTheme(.dark)
    .preferredColorScheme(.dark)
```

## What lives here

| Type | Purpose |
| --- | --- |
| `KitoTheme` | The one struct every kit reads from the environment. |
| `KitoColors` | Semantic role colors, with `.light` and `.dark` presets. |
| `KitoSpacing` | A 4-point scale from `xxs` to `xxl`. |
| `KitoThemeTypography` | Role-labeled text styles. |
| `KitoRadii` | Corner radius tokens including a `pill` sentinel. |
| `Kito.version` | Version string kits report in logs and diagnostics. |

## Contract

- Tokens are read via `@Environment(\.kitoTheme)`. Kits **never** hardcode a color,
  spacing value, font, or radius.
- `KitoTheme` is `Equatable` and `Sendable`. Consumers can memoize on it safely.
- Adding a token is a **minor** bump; renaming or removing one is **major**.

## Migrating from 1.1

1.2.0 renames `KitoTypography` (the text styles on `KitoTheme.typography`) to
`KitoThemeTypography`, so KitoCore can be imported in the same file as KitoScreens (whose
`KitoTypography` sets a custom font across the UI kits) without "ambiguous" errors. The properties,
initialiser and `.default` are unchanged; code that only reads `theme.typography.body` needs no
change.

## License

MIT
