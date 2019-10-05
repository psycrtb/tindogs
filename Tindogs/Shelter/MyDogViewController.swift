//
//  MyDogViewController.swift
//  Tindogs
//
//  Created by Tim Belfield on 05.10.19.
//  Copyright © 2019 Tindogs. All rights reserved.
//

import UIKit

class MyDogViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var dogPhoto: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var dogName: UINavigationItem!
    var dog: Dog?
    var interestedPeople: [People] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        dog = appDelegate.myShelterDogSelected
        dogPhoto.sd_setImage(with: URL(string: dog!.photo), placeholderImage: UIImage(named: "placeholder.png"))
        dogName.title = dog?.name
        
        
        DogsDataModel().interestedPeople(dog_id: "\(dog!.id)") { people in
            self.interestedPeople = people
            self.tableView.reloadData()
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.interestedPeople.count // interested people
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "interestedPeopleTableViewCell")! as! InterestedPeopleTableViewCell
        
        cell.personNameField.text = interestedPeople[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.interestedPerson = interestedPeople[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
