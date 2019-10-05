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
        let yoururl = URL(string: "http://165.22.22.124/api/dogs")!
        
        AF.request(yoururl).response { response in
            print(response.debugDescription)
//            print("response: \(String(response))")
            
        }
    }
}
