//
//  KitoBackgroundStyle.swift
//  KitoCore
//
//  Created by Wycliff on 9/21/26.
//  Copyright © 2026 wyksoftsinc.com. All rights reserved.
//

import SwiftUI

/// What an image-backed background shows — a bundled asset, a system
/// symbol treated as artwork, or a remote URL (loaded via `AsyncImage`,
/// so it degrades to a clear placeholder instead of blocking or crashing
/// while it loads or if it fails).
public enum KitoBackgroundImage: Sendable {
    case asset(String)
    case systemImage(String)
    case url(URL)
}

/// The one background customization type every Kito kit's style/appearance
/// struct should compose (`KitoToastAppearance`, `KitoOrderTrackingStyle`,
/// and future ones) instead of each kit re-inventing color-vs-gradient-vs-
/// image handling. See `KitoCore/docs/ENGINEERING_STANDARDS.md` — this is a
/// shared primitive precisely so it's built and hardened once.
public enum KitoBackgroundStyle: Sendable {
    case color(Color)
    case gradient(KitoGradient)
    case material
    case image(KitoBackgroundImage, overlayTint: Color? = nil)
}

public extension View {
    /// Applies a `KitoBackgroundStyle` clipped to `cornerRadius`. An image
    /// background is scaled to fill and clipped; a `nil` `overlayTint`
    /// leaves it untouched, a non-nil one darkens/tints it (typically so
    /// light-colored text/icons stay legible over a photo).
    @ViewBuilder
    func kitoBackground(_ style: KitoBackgroundStyle, cornerRadius: CGFloat) -> some View {
        switch style {
        case .color(let color):
            self.background(color, in: RoundedRectangle(cornerRadius: cornerRadius))
        case .gradient(let gradient):
            self.background(gradient.asView()).clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        case .material:
            self.background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: cornerRadius))
        case .image(let image, let overlayTint):
            self.background(
                KitoBackgroundImageView(image: image, overlayTint: overlayTint)
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            )
        }
    }
}

private struct KitoBackgroundImageView: View {
    let image: KitoBackgroundImage
    let overlayTint: Color?

    var body: some View {
        ZStack {
            content
            if let overlayTint {
                overlayTint
            }
        }
    }

    @ViewBuilder
    private var content: some View {
        switch image {
        case .asset(let name):
            Image(name).resizable().scaledToFill()
        case .systemImage(let name):
            Image(systemName: name).resizable().scaledToFill()
        case .url(let url):
            AsyncImage(url: url) { phase in
                switch phase {
                case .success(let image):
                    image.resizable().scaledToFill()
                case .failure, .empty:
                    Color.clear
                @unknown default:
                    Color.clear
                }
            }
        }
    }
}
