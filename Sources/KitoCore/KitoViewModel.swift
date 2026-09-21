//
//  KitoViewModel.swift
//  KitoCore
//
//  Created by Wycliff on 11/12/25.
//  Copyright © 2025 wyksoftsinc.com. All rights reserved.
//

import Observation

/// The marker every Kito ViewModel conforms to. Constrains generic view code
/// (`some KitoViewModel`) without each kit re-declaring its own protocol, and
/// documents the convention: state lives in an `@Observable` class, views read
/// it and send it intents — views never own `@State` for anything beyond pure
/// UI ephemera (a `TextField` focus flag, a sheet's `isPresented`).
public protocol KitoViewModel: Observable, AnyObject {}
