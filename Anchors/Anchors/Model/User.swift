//
//  User.swift
//  Anchors
//
//  Created by Rahul on 08/05/21.
//

import Foundation

struct Response: Codable {
    var users : [User]
}

struct User: Codable {
    let name, city: String
}
