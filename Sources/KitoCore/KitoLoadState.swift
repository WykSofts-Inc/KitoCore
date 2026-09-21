//
//  KitoLoadState.swift
//  KitoCore
//
//  Created by Wycliff on 11/6/25.
//  Copyright © 2025 wyksoftsinc.com. All rights reserved.
//

/// The load-state vocabulary every kit's ViewModels share for async work —
/// a network call, a generated chart dataset, a submitted form. Views switch
/// over it exhaustively instead of juggling separate `isLoading` / `error`
/// / `data` properties that can disagree with each other.
public enum KitoLoadState<Value> {
    case idle
    case loading
    case loaded(Value)
    case failed(Error)

    public var value: Value? {
        if case .loaded(let value) = self { return value }
        return nil
    }

    public var isLoading: Bool {
        if case .loading = self { return true }
        return false
    }

    public var error: Error? {
        if case .failed(let error) = self { return error }
        return nil
    }
}
