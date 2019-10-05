//
//  Dog.swift
//  Tindogs
//
//  Created by Tim Belfield on 05.10.19.
//  Copyright © 2019 Tindogs. All rights reserved.
//

import Foundation

struct Dog: Codable {
    let id: Int
    let name: String
    let age: String
    let breed: String
}

struct Dogs: Codable {
    let dogs: [Dog]
}
