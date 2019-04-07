//
//  Typealias.swift
//  llitgi
//
//  Created by Xavi Moll on 25/12/2017.
//  Copyright © 2017 xmollv. All rights reserved.
//

import Foundation

/// Typealias over Dictionary<String, Any>
typealias JSONDictionary = Dictionary<String, Any>

/// Typealias over Array<JSONDictionary>
typealias JSONArray = Array<JSONDictionary>

/// Generic Result type that only allows for a success (with the given generic type)
/// or an Error on the failure
enum Result<T> {
    case success(T)
    case failure(Error)
}

enum EmptyResult {
    case success
    case failure(Error)
}
