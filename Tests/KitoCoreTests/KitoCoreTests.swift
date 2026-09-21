//
//  KitoCoreTests.swift
//  KitoCore
//
//  Created by Wycliff on 11/13/25.
//  Copyright © 2025 wyksoftsinc.com. All rights reserved.
//

import XCTest
import SwiftUI
@testable import KitoCore

final class KitoCoreTests: XCTestCase {
    func testVersionIsSemver() {
        let parts = Kito.version.split(separator: ".")
        XCTAssertEqual(parts.count, 3, "Kito.version must be MAJOR.MINOR.PATCH")
        for part in parts {
            XCTAssertNotNil(Int(part), "\(part) is not numeric")
        }
    }

    func testLightAndDarkPresetsDiffer() {
        XCTAssertNotEqual(KitoTheme.light.colors, KitoTheme.dark.colors)
    }

    func testDefaultsAreStable() {
        XCTAssertEqual(KitoSpacing.default, KitoSpacing())
        XCTAssertEqual(KitoRadii.default, KitoRadii())
        XCTAssertEqual(KitoTypography.default, KitoTypography())
    }

    func testLoadStateAccessors() {
        let loaded: KitoLoadState<Int> = .loaded(42)
        XCTAssertEqual(loaded.value, 42)
        XCTAssertFalse(loaded.isLoading)

        let loading: KitoLoadState<Int> = .loading
        XCTAssertTrue(loading.isLoading)
        XCTAssertNil(loading.value)
    }

    func testGradientDefaultsToLinearTopLeadingBottomTrailing() {
        let gradient = KitoGradient(colors: [.red, .blue])
        guard case .linear(let start, let end) = gradient.shape else {
            return XCTFail("expected .linear default shape")
        }
        XCTAssertEqual(start, .topLeading)
        XCTAssertEqual(end, .bottomTrailing)
    }

    func testLinearConvenienceBuildsVariadicColorList() {
        let gradient = KitoGradient.linear(.red, .orange, .yellow)
        XCTAssertEqual(gradient.colors, [.red, .orange, .yellow])
    }
}
