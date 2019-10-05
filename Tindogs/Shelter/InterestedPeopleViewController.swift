//
//  InterestedPeopleViewController.swift
//  Tindogs
//
//  Created by Tim Belfield on 05.10.19.
//  Copyright © 2019 Tindogs. All rights reserved.
//

import UIKit

class InterestedPeopleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var personPhoto: UIImageView!
    @IBOutlet weak var interestedPersonNavItem: UINavigationItem!
    @IBOutlet weak var personName: UILabel!
    var interestedPerson: People?
    
    override func viewDidLoad() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        interestedPerson = appDelegate.interestedPerson
        interestedPersonNavItem.title = interestedPerson!.name
        personName.text = interestedPerson?.name
        personPhoto.sd_setImage(with: URL(string: interestedPerson!.photo), placeholderImage: UIImage(named: "placeholder.png"))
        super.viewDidLoad()
    }
    
//    let appDelegate = UIApplication.shared.delegate as! AppDelegate
//    appDelegate.myShelterDogSelected = dogs[indexPath.row]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    @IBAction func rejectPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func acceptPressed(_ sender: Any) {
        let alertController = UIAlertController(title: "Applicant informed!", message: "You can now chat with them or call them to talk about the dog!", preferredStyle: .alert)
           
           //then we create a default action for the alert...
           //It is actually a button and we have given the button text style and handler
           //currently handler is nil as we are not specifying any handler
           let defaultAction = UIAlertAction(title: "Close Alert", style: .default, handler: nil)
           
           //now we are adding the default action to our alertcontroller
           alertController.addAction(defaultAction)
           
           //and finally presenting our alert using this method
        present(alertController, animated: true, completion: nil)
    }
    
}
