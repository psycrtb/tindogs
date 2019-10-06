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
    
    func interestedPeople(dog_id: String, completionHandler: @escaping ([People]) -> Void) {
        let url = URL(string: DogsDataModel.api_base + "interested-people/" + dog_id)!
         AF.request(url).response { response in
            let jsonData = response.data! // response.data(encoding: .utf8)!
            let decoder = JSONDecoder()
            do {
                let people = try decoder.decode(Array<People>.self, from: jsonData)
                completionHandler(people)
            } catch {
                print("interestedPeople screwed up")
            }
        }
    }
    
    func hasShelterGotDogs(shelter_id: String = "1", completionHandler: @escaping ([Dog]) -> Void) {
        let url = URL(string: DogsDataModel.api_base + "shelterhasdogs/" + shelter_id)!
        
//        let request = AF.request(url, method: .post, parameters: ["dog_id": dog_id])
        AF.request(url).response { response in
//            print("res: \(response.debugDescription)")
            let jsonData = response.data! // response.data(encoding: .utf8)!
            let decoder = JSONDecoder()
            do {
                let dogs = try decoder.decode(Array<Dog>.self, from: jsonData)
                completionHandler(dogs)
            } catch {
                print("hasSheltergotdogs screwed up")
            }
        }
    }
    
    func sendInterest(dog_id: String) {
        let url = URL(string: DogsDataModel.api_base + "interests")!
        
        let request = AF.request(url, method: .post, parameters: ["dog_id": dog_id])
        request.response { response in
            print("res: \(response.debugDescription)")
        }
    }
    
    func getDogs(completionHandler: @escaping ([Dog]) -> Void){
        AF.request(URL(string: DogsDataModel.api_base + "dogs")!).response { response in
            
            let jsonData = response.data! // response.data(encoding: .utf8)!
            let decoder = JSONDecoder()
            do {
                let dogs = try decoder.decode(Array<Dog>.self, from: jsonData)
                completionHandler(dogs)
            } catch {
                print("we don screwed up")
            }
        }
        
    }
        
    func getDog(dog_id: String, completionHandler: @escaping (Dog) -> Void) {
        AF.request(URL(string: DogsDataModel.api_base + "dogs/" + dog_id)!).response { response in
                   
            let jsonData = response.data! // response.data(encoding: .utf8)!
                let decoder = JSONDecoder()
                do {
                    let dog = try decoder.decode(Dog.self, from: jsonData)
                    completionHandler(dog)
                } catch {
                    print("we don screwed up")
                }
        }
    }
}
