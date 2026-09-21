//
//  KitoSpacing.swift
//  KitoCore
//
//  Created by Wycliff on 11/9/25.
//  Copyright © 2025 wyksoftsinc.com. All rights reserved.
//

import CoreGraphics

/// A 4-point spacing scale. Kits pick a token by role, never a raw literal,
/// so a consumer can retune density across every screen by re-declaring one struct.
public struct KitoSpacing: Equatable, Sendable {
    public var xxs: CGFloat
    public var xs: CGFloat
    public var sm: CGFloat
    public var md: CGFloat
    public var lg: CGFloat
    public var xl: CGFloat
    public var xxl: CGFloat

    public init(
        xxs: CGFloat = 2,
        xs: CGFloat = 4,
        sm: CGFloat = 8,
        md: CGFloat = 12,
        lg: CGFloat = 16,
        xl: CGFloat = 24,
        xxl: CGFloat = 32
    ) {
        self.xxs = xxs
        self.xs = xs
        self.sm = sm
        self.md = md
        self.lg = lg
        self.xl = xl
        self.xxl = xxl
    }

    public static let `default` = KitoSpacing()
}
