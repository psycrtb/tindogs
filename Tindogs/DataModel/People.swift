//
//  People.swift
//  Tindogs
//
//  Created by Tim Belfield on 05.10.19.
//  Copyright © 2019 Tindogs. All rights reserved.
//

import Foundation

struct People: Codable {
    let id: Int
    let user_id: Int
    let biography: String
    let photo: String
    let name: String
    let phone: String
    let address: String
}
