//
//  ExampleDataModel.swift
//  Tindogs
//
//  Created by Tim Belfield on 05.10.19.
//  Copyright © 2019 Tindogs. All rights reserved.
//

import Foundation
import Alamofire


class ExampleDataModel {
    init() {
        let yoururl = URL(string: "http")!
        
        
        AF.request(URL(string: "http://www.google.com")!).response { response in
            print("response: \(response)")
            
        }
    }
}
