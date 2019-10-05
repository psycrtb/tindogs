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
    let color: String
    let origin: String
    let description: String
    let photo: String
    let created_at: String
    let updated_at: String    
}
