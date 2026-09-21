//
//  KitoTypography.swift
//  KitoCore
//
//  Created by Wycliff on 11/11/25.
//  Copyright © 2025 wyksoftsinc.com. All rights reserved.
//

import SwiftUI

/// Role-labeled text styles. Each role names a use, not a size — swapping a
/// brand font never asks a caller to re-choose a weight.
public struct KitoTypography: Equatable, Sendable {
    public var displayLarge: Font
    public var displayMedium: Font
    public var titleLarge: Font
    public var titleMedium: Font
    public var body: Font
    public var bodyEmphasized: Font
    public var label: Font
    public var caption: Font
    public var button: Font

    public init(
        displayLarge: Font = .system(size: 34, weight: .bold, design: .default),
        displayMedium: Font = .system(size: 28, weight: .semibold, design: .default),
        titleLarge: Font = .system(size: 22, weight: .semibold, design: .default),
        titleMedium: Font = .system(size: 18, weight: .semibold, design: .default),
        body: Font = .system(size: 16, weight: .regular, design: .default),
        bodyEmphasized: Font = .system(size: 16, weight: .medium, design: .default),
        label: Font = .system(size: 14, weight: .medium, design: .default),
        caption: Font = .system(size: 12, weight: .regular, design: .default),
        button: Font = .system(size: 16, weight: .semibold, design: .default)
    ) {
        self.displayLarge = displayLarge
        self.displayMedium = displayMedium
        self.titleLarge = titleLarge
        self.titleMedium = titleMedium
        self.body = body
        self.bodyEmphasized = bodyEmphasized
        self.label = label
        self.caption = caption
        self.button = button
    }

    public static let `default` = KitoTypography()
}
