//
//  DogsDataModel.swift
//  Tindogs
//
//  Created by Максим Примак on 05.10.19.
//  Copyright © 2019 Tindogs. All rights reserved.
//

import Foundation
import Alamofire


class DogsDataModel {
    static var api_base = "http://165.22.22.124/api/"
    init() {

    }
    
    func getDogs(){
        AF.request(URL(string: DogsDataModel.api_base + "dogs")!).response { response in
            print("response: \(response.debugDescription)")
        }
        
    }
        
    func getDog(dog_id: String){
        AF.request(URL(string: DogsDataModel.api_base + "dogs/" + dog_id)!).response { response in
            print("response: \(response.debugDescription)")
            
        }
    }
}
