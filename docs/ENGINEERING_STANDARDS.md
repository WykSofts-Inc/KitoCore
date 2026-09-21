# Engineering standards

_KitoCore · Wycliff · wyksoftsinc.com · 9/21/26_

Kito ships to devices its authors will never see, in markets its authors
can't test in person. These rules exist because "works on my simulator"
is not the bar for a library used worldwide. Every kit's `docs/` folder
links here rather than restating it — this is the canonical copy.

## 1. No crashes from inside a Kito call

- **No `fatalError()`, `try!`, or force-unwrap (`!`) in any public code path.**
  If a value can be nil or an operation can throw, the API either returns an
  optional/`Result`/`throws`, or the failure is handled and degraded
  gracefully. A consumer's app must never go down because a Kito view
  rendered.
- Every failable system API gets a real branch, not an assumption. Example:
  `HTTPURLResponse.init(url:statusCode:httpVersion:headerFields:)` is
  failable — KitoNetKit's interceptor (`KitoNetURLProtocol.swift`) guards it
  and reports `KitoNetKitError.invalidForcedResponse` instead of force-unwrapping,
  because a QA engineer typing a bad status code into a scenario should see an
  error, not crash the host app.
- Prefer "fail open" over "fail locked" when a security check can't run at
  all — `KitoBiometricLockView` unlocks content (with a visible error) if
  biometrics are unavailable/unenrolled, rather than permanently locking out
  a user who has no biometric hardware. A hard lock with no fallback path is
  its own kind of outage.

## 2. Platform and OS availability

- **Minimum target: iOS 17.** Chosen specifically for the `Observation`
  framework's `@Observable` macro (see `KitoCharts/docs/ARCHITECTURE.md` for
  why). This is a real tradeoff, not a default: iOS 17 excludes devices that
  cannot update past iOS 16, which in some markets (older/budget iPhones,
  slower upgrade cycles) is a non-trivial share of users. **If Kito's
  consuming apps target a market where that share matters — e.g. a Kenyan
  fintech app riding on `KitoScreens`' M-Pesa checkout — re-evaluate this
  before committing to iOS 17 as the floor; it is reversible now, expensive
  to reverse once kits have shipped.**
- Platform-only APIs (SceneKit, LocalAuthentication, PhotosUI, Contacts,
  CoreLocation) are wrapped so their *absence* degrades instead of failing
  to compile or crashing at runtime. `Chart3DView` is the template:
  `#if canImport(SceneKit)` guards the real implementation, and an `#else`
  branch ships a plain-text fallback view so the package still builds and
  runs everywhere KitoCharts is imported.
- Any API that behaves differently across iOS versions within the supported
  range gets an explicit `#available` check and a documented fallback —
  never an assumption that "recent enough" is universal.

## 3. Worldwide readiness

- **Layout is RTL-safe by construction.** Every kit uses `.leading`/
  `.trailing` (never `.left`/`.right`) for alignment and padding — SwiftUI
  mirrors these automatically for right-to-left locales (Arabic, Hebrew,
  Urdu, …). Do not introduce a literal `.left`/`.right` without a specific,
  documented reason.
- **Content strings are consumer-supplied, chrome strings are not yet
  localized — this is a known gap, not a claim of full localization.**
  Every message/title parameter a screen or component takes (toast text,
  empty-state copy, onboarding pages) is passed in by the app using Kito, so
  the app controls its own localization. But Kito's own default copy —
  accessibility labels ("Loading"), default button titles ("Cancel",
  "Confirm", "Try again", "Skip", "Next", "Get started") — is hardcoded
  English today. Before a 1.0 release intended for non-English-first
  markets, move these into a String Catalog (`Localizable.xcstrings`) per
  kit rather than leaving them as literals.
- **Dynamic Type is a known gap.** `KitoTypography`'s defaults use fixed
  point sizes (`.system(size: 16, weight: .regular)`) rather than scalable
  text styles (`.system(.body)` + `UIFontMetrics`), so text does not grow
  when a user raises their system text size in Accessibility settings. This
  is deliberate for now (fixed sizes keep chart/dashboard layouts
  predictable) but should be revisited per-component before claiming
  accessibility compliance — body copy (toasts, empty states, onboarding)
  is the highest-priority place to add Dynamic Type support first, since
  layout-critical numeric displays (charts, KPI tiles) are the place fixed
  sizing is most defensible.
- **Every interactive/informational control carries an accessibility
  label.** Loaders (`KitoSpinner`, etc.), toasts, and empty states already
  do this — keep doing it for every new component; a screen reader user is
  not an edge case.

## 4. How to apply this when adding a kit

1. Read this file and `KitoCharts/docs/ARCHITECTURE.md` before writing code.
2. Grep your new files for `!` before committing — every force-unwrap needs
   a one-line justification comment or needs to not exist.
3. If you wrap a platform-only framework, write the `#else` fallback in the
   same PR, not as a follow-up.
4. If you introduce new default copy, ask whether it belongs in a String
   Catalog now or is deferred — don't let "known gap" silently grow forever.
