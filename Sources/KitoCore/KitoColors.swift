//
//  KitoColors.swift
//  KitoCore
//
//  Created by Wycliff on 11/5/25.
//  Copyright © 2025 wyksoftsinc.com. All rights reserved.
//

import SwiftUI

/// Semantic colors every kit renders against. Values resolve through the environment,
/// so a consumer swapping palette (or dark mode flipping) reaches Buttons, Fields and
/// Screens at once without any kit re-declaring its own tokens.
public struct KitoColors: Equatable, Sendable {
    public var primary: Color
    public var onPrimary: Color
    public var secondary: Color
    public var onSecondary: Color
    public var background: Color
    public var onBackground: Color
    public var surface: Color
    public var onSurface: Color
    public var surfaceMuted: Color
    public var border: Color
    public var danger: Color
    public var success: Color
    public var warning: Color

    public init(
        primary: Color,
        onPrimary: Color,
        secondary: Color,
        onSecondary: Color,
        background: Color,
        onBackground: Color,
        surface: Color,
        onSurface: Color,
        surfaceMuted: Color,
        border: Color,
        danger: Color,
        success: Color,
        warning: Color
    ) {
        self.primary = primary
        self.onPrimary = onPrimary
        self.secondary = secondary
        self.onSecondary = onSecondary
        self.background = background
        self.onBackground = onBackground
        self.surface = surface
        self.onSurface = onSurface
        self.surfaceMuted = surfaceMuted
        self.border = border
        self.danger = danger
        self.success = success
        self.warning = warning
    }

    public static let light = KitoColors(
        primary: Color(red: 0.11, green: 0.42, blue: 0.94),
        onPrimary: .white,
        secondary: Color(red: 0.20, green: 0.20, blue: 0.24),
        onSecondary: .white,
        background: Color(red: 0.98, green: 0.98, blue: 0.99),
        onBackground: Color(red: 0.07, green: 0.08, blue: 0.10),
        surface: .white,
        onSurface: Color(red: 0.07, green: 0.08, blue: 0.10),
        surfaceMuted: Color(red: 0.94, green: 0.95, blue: 0.97),
        border: Color(red: 0.86, green: 0.88, blue: 0.91),
        danger: Color(red: 0.90, green: 0.25, blue: 0.30),
        success: Color(red: 0.13, green: 0.66, blue: 0.42),
        warning: Color(red: 0.96, green: 0.68, blue: 0.15)
    )

    public static let dark = KitoColors(
        primary: Color(red: 0.36, green: 0.62, blue: 1.00),
        onPrimary: Color(red: 0.05, green: 0.06, blue: 0.09),
        secondary: Color(red: 0.85, green: 0.87, blue: 0.90),
        onSecondary: Color(red: 0.05, green: 0.06, blue: 0.09),
        background: Color(red: 0.06, green: 0.07, blue: 0.09),
        onBackground: Color(red: 0.94, green: 0.95, blue: 0.97),
        surface: Color(red: 0.10, green: 0.12, blue: 0.15),
        onSurface: Color(red: 0.94, green: 0.95, blue: 0.97),
        surfaceMuted: Color(red: 0.14, green: 0.16, blue: 0.20),
        border: Color(red: 0.22, green: 0.24, blue: 0.28),
        danger: Color(red: 1.00, green: 0.42, blue: 0.46),
        success: Color(red: 0.32, green: 0.82, blue: 0.55),
        warning: Color(red: 1.00, green: 0.78, blue: 0.33)
    )

    /// Deep-space background with electric-cyan/violet accents — the "dark
    /// glass + neon" preset. Pairs with `kitoGlassCard(_:)`/`kitoGlow(_:)`
    /// (see KitoGlassStyle.swift) for the full look; on its own it's just a
    /// very dark, high-contrast palette any kit can render against.
    public static let neon = KitoColors(
        primary: Color(red: 0.38, green: 0.98, blue: 0.92),
        onPrimary: Color(red: 0.02, green: 0.05, blue: 0.07),
        secondary: Color(red: 0.85, green: 0.42, blue: 1.00),
        onSecondary: Color(red: 0.06, green: 0.02, blue: 0.09),
        background: Color(red: 0.02, green: 0.02, blue: 0.05),
        onBackground: Color(red: 0.93, green: 0.96, blue: 1.00),
        surface: Color(red: 0.06, green: 0.06, blue: 0.11),
        onSurface: Color(red: 0.93, green: 0.96, blue: 1.00),
        surfaceMuted: Color(red: 0.10, green: 0.10, blue: 0.17),
        border: Color(red: 0.40, green: 0.95, blue: 0.90).opacity(0.35),
        danger: Color(red: 1.00, green: 0.32, blue: 0.55),
        success: Color(red: 0.35, green: 1.00, blue: 0.68),
        warning: Color(red: 1.00, green: 0.82, blue: 0.25)
    )
}
