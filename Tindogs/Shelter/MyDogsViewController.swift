//
//  MyDogsViewController.swift
//  Tindogs
//
//  Created by Tim Belfield on 05.10.19.
//  Copyright © 2019 Tindogs. All rights reserved.
//

import UIKit

class MyDogsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    var dogs: [Dog] = {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.myShelterDogs
    }()
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogs.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myDogTableViewCell") as! MyDogTableViewCell

        let dog = self.dogs[indexPath.row]
        cell.dogName.text = dog.name
        cell.dogPicture.sd_setImage(with: URL(string: dog.photo), placeholderImage: UIImage(named: "placeholder.png"))
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.myShelterDogSelected = dogs[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)

    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
