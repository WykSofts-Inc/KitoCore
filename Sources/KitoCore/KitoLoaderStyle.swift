//
//  KitoLoaderStyle.swift
//  KitoCore
//
//  Created by Wycliff on 11/7/25.
//  Copyright © 2025 wyksoftsinc.com. All rights reserved.
//

import CoreGraphics

/// Which loader a screen wants, and how big. Lives in Core (shared vocabulary,
/// read by any kit) — the animated implementations live in KitoLoaders so Core
/// stays free of animation code.
public enum KitoLoaderKind: Equatable, Sendable {
    case spinner
    case dots
    case pulse
    case progressRing(fraction: Double)
    case skeleton
    /// Equalizer-style bars bouncing at staggered heights.
    case bars
    /// A row of dots riding a continuous sine wave.
    case wave
    /// Concentric rings expanding and fading outward, staggered in phase.
    case ripple
    /// Small dots orbiting a center point.
    case orbit
    /// A spinning ring stroked with an angular gradient instead of a solid color.
    case gradientRing
}

public struct KitoLoaderStyle: Equatable, Sendable {
    public var kind: KitoLoaderKind
    public var size: CGFloat
    public var lineWidth: CGFloat

    public init(kind: KitoLoaderKind = .spinner, size: CGFloat = 24, lineWidth: CGFloat = 3) {
        self.kind = kind
        self.size = size
        self.lineWidth = lineWidth
    }

    public static let `default` = KitoLoaderStyle()
}
