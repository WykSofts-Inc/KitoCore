//
//  KitoTheme.swift
//  KitoCore
//
//  Created by Wycliff on 11/10/25.
//  Copyright © 2025 wyksoftsinc.com. All rights reserved.
//

import SwiftUI

/// The single struct every kit reads from the environment. A consumer either takes
/// `.light` / `.dark` and lets `.autoTheme()` follow the system, or hands a custom
/// theme in with `.kitoTheme(_:)` — Buttons, Fields and Screens all update in one pass.
public struct KitoTheme: Equatable, Sendable {
    public var colors: KitoColors
    public var spacing: KitoSpacing
    public var typography: KitoTypography
    public var radii: KitoRadii

    public init(
        colors: KitoColors,
        spacing: KitoSpacing = .default,
        typography: KitoTypography = .default,
        radii: KitoRadii = .default
    ) {
        self.colors = colors
        self.spacing = spacing
        self.typography = typography
        self.radii = radii
    }

    public static let light = KitoTheme(colors: .light)
    public static let dark = KitoTheme(colors: .dark)
}

private struct KitoThemeKey: EnvironmentKey {
    static let defaultValue: KitoTheme = .light
}

public extension EnvironmentValues {
    var kitoTheme: KitoTheme {
        get { self[KitoThemeKey.self] }
        set { self[KitoThemeKey.self] = newValue }
    }
}

public extension View {
    /// Set an explicit theme for this subtree. Prefer this when a screen must render
    /// in one mode regardless of the system.
    func kitoTheme(_ theme: KitoTheme) -> some View {
        environment(\.kitoTheme, theme)
    }

    /// Follow the system light/dark setting. Reads the current color scheme and
    /// picks the matching preset. Consumers who want custom light/dark palettes
    /// should pass their own themes with `kitoTheme(_:)` inside `preferredColorScheme`.
    func autoKitoTheme() -> some View {
        modifier(AutoKitoTheme())
    }
}

private struct AutoKitoTheme: ViewModifier {
    @Environment(\.colorScheme) private var colorScheme
    func body(content: Content) -> some View {
        content.environment(\.kitoTheme, colorScheme == .dark ? .dark : .light)
    }
}
