// swift-tools-version: 5.9
//
//  Package.swift
//  KitoCore
//
//  Created by Wycliff on 11/3/25.
//  Copyright © 2025 wyksoftsinc.com. All rights reserved.
//


import PackageDescription

let package = Package(
    name: "KitoCore",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "KitoCore", targets: ["KitoCore"]),
    ],
    targets: [
        .target(name: "KitoCore"),
        .testTarget(name: "KitoCoreTests", dependencies: ["KitoCore"]),
    ]
)
