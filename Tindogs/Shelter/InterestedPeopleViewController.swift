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
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        interestedPerson = appDelegate.interestedPerson
        interestedPersonNavItem.title = interestedPerson!.name
        personName.text = interestedPerson?.name
        personPhoto.sd_setImage(with: URL(string: interestedPerson!.photo), placeholderImage: UIImage(named: "placeholder.png"))
        super.viewDidLoad()
        print("person:\(String(describing: interestedPerson))")
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 1:
            return 60.0
        case 2:
            return 100.0
        default:
            return 43.5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "standardCell") as! StandardTableViewCell
            cell.textLabelArea.text = "Phone: \(String(interestedPerson!.phone))"
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "largeTextCell") as! LargeTextCell
            cell.textArea.text = "Address: \(String(interestedPerson!.address))"
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "largeTextCell") as! LargeTextCell
            cell.textArea.text = interestedPerson!.biography
            return cell
            
        default:
            return UITableViewCell()
        }
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
