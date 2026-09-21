//
//  KitoGlassStyle.swift
//  KitoCore
//
//  Created by Wycliff on 9/21/26.
//  Copyright © 2026 wyksoftsinc.com. All rights reserved.
//

import SwiftUI

public extension View {
    /// Frosted "glass" panel: translucent material, a soft light-catching
    /// border, and an ambient shadow — the base surface for the "dark glass
    /// + neon" look, but tasteful under any `KitoTheme` since the material
    /// itself adapts to light/dark automatically.
    func kitoGlassCard(cornerRadius: CGFloat = 20, tint: Color = .clear) -> some View {
        modifier(KitoGlassCard(cornerRadius: cornerRadius, tint: tint))
    }

    /// A soft colored glow behind the view, the signature "neon" accent
    /// treatment. Pass `theme.colors.primary` (or any semantic color) so the
    /// glow always tracks the active theme/customization instead of a
    /// hardcoded hue. Two stacked shadows (tight + wide) read as a glow
    /// rather than a flat drop shadow.
    func kitoGlow(_ color: Color, radius: CGFloat = 16, intensity: Double = 0.55) -> some View {
        self
            .shadow(color: color.opacity(intensity), radius: radius * 0.4)
            .shadow(color: color.opacity(intensity * 0.6), radius: radius)
    }
}

private struct KitoGlassCard: ViewModifier {
    let cornerRadius: CGFloat
    let tint: Color

    func body(content: Content) -> some View {
        content
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                        .fill(.ultraThinMaterial)
                    if tint != .clear {
                        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                            .fill(tint.opacity(0.14))
                    }
                }
            )
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .strokeBorder(
                        LinearGradient(
                            colors: [.white.opacity(0.35), .white.opacity(0.04)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 1
                    )
            )
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
    }
}
