//
//  KitoRadii.swift
//  KitoCore
//
//  Created by Wycliff on 11/8/25.
//  Copyright © 2025 wyksoftsinc.com. All rights reserved.
//

import CoreGraphics

/// Corner radius scale. `pill` is intentionally large enough to always round the
/// short side fully — callers should not read it as a numeric value.
public struct KitoRadii: Equatable, Sendable {
    public var none: CGFloat
    public var sm: CGFloat
    public var md: CGFloat
    public var lg: CGFloat
    public var xl: CGFloat
    public var pill: CGFloat

    public init(
        none: CGFloat = 0,
        sm: CGFloat = 6,
        md: CGFloat = 10,
        lg: CGFloat = 14,
        xl: CGFloat = 20,
        pill: CGFloat = 999
    ) {
        self.none = none
        self.sm = sm
        self.md = md
        self.lg = lg
        self.xl = xl
        self.pill = pill
    }

    public static let `default` = KitoRadii()
}
