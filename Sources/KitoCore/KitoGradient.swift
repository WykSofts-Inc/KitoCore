//
//  KitoGradient.swift
//  KitoCore
//
//  Created by Wycliff on 9/21/26.
//  Copyright © 2026 wyksoftsinc.com. All rights reserved.
//

import SwiftUI

/// A plain-data gradient spec — linear, radial, or angular — shared by every
/// kit's background customization instead of each kit wrapping SwiftUI's
/// gradient types itself.
public struct KitoGradient: Sendable {
    public enum Shape: Sendable {
        case linear(startPoint: UnitPoint, endPoint: UnitPoint)
        case radial(center: UnitPoint, startRadius: CGFloat, endRadius: CGFloat)
        case angular(center: UnitPoint, startAngle: Angle, endAngle: Angle)
    }

    public var colors: [Color]
    public var shape: Shape

    public init(colors: [Color], shape: Shape = .linear(startPoint: .topLeading, endPoint: .bottomTrailing)) {
        self.colors = colors
        self.shape = shape
    }

    @ViewBuilder
    public func asView() -> some View {
        switch shape {
        case .linear(let start, let end):
            LinearGradient(colors: colors, startPoint: start, endPoint: end)
        case .radial(let center, let startRadius, let endRadius):
            RadialGradient(colors: colors, center: center, startRadius: startRadius, endRadius: endRadius)
        case .angular(let center, let startAngle, let endAngle):
            AngularGradient(colors: colors, center: center, startAngle: startAngle, endAngle: endAngle)
        }
    }

    public static func linear(_ colors: Color..., startPoint: UnitPoint = .topLeading, endPoint: UnitPoint = .bottomTrailing) -> KitoGradient {
        KitoGradient(colors: colors, shape: .linear(startPoint: startPoint, endPoint: endPoint))
    }
}
