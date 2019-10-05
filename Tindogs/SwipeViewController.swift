//
//  SwipeViewController.swift
//  Tindogs
//
//  Created by Tim Belfield on 05.10.19.
//  Copyright © 2019 Tindogs. All rights reserved.
//

import UIKit

class SwipeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
//    var commonSegue: UIStoryboardSegue {
//        
//    }
//    
    
    @IBOutlet weak var tableView: UITableView!
    let simpleFakeDataSourcePetFriendly: Bool = true
    let simpleFakeDataSourceBreed: String = "Labrador"
    let simpleFakeDataSourceOrigin: String = "Austria"
    let simpleFakeDataSourceFamilyFriendly: Bool = false
    let simpleFakeDataSourceBio: String = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."

    
    static let defaultCell = "defaultCell"
    static let selectionCell = "selectionCell"
    static let textCell = "textCell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 4:
            return 350.0
        case 2:
            if simpleFakeDataSourcePetFriendly {
                return 43.5
            }
            return 0
            
        case 3:
            if simpleFakeDataSourceFamilyFriendly {
                return 43.5
            }
            return 0
        default:
            return 43.5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        switch indexPath.row {
        case 0:
            cell = UITableViewCell(style: .default, reuseIdentifier: SwipeViewController.defaultCell)
            cell.textLabel?.text = "Breed: \(simpleFakeDataSourceBreed)"
        case 1:
            cell = UITableViewCell(style: .default, reuseIdentifier: SwipeViewController.defaultCell)
            cell.textLabel?.text = "Origin: \(simpleFakeDataSourceOrigin)"
        case 2:
            cell = UITableViewCell(style: .default, reuseIdentifier: SwipeViewController.selectionCell)
            cell.textLabel?.text = "Pet friendly"
            cell.accessoryType =  simpleFakeDataSourcePetFriendly ? .checkmark : .none
        case 3:
            cell = UITableViewCell(style: .default, reuseIdentifier: SwipeViewController.selectionCell)
            cell.textLabel?.text = "Family friendly"
            cell.accessoryType =  simpleFakeDataSourceFamilyFriendly ? .checkmark : .none
        case 4:
            let customDataCell = tableView.dequeueReusableCell(withIdentifier: SwipeViewController.textCell)
             as! TextCellView
            customDataCell.textContent.text = simpleFakeDataSourceBio
            customDataCell.textContent.textColor = #colorLiteral(red: 0.8269874454, green: 0.0782038793, blue: 0.35505265, alpha: 1)
            customDataCell.textContent?.font = UIFont(name: "Avenir Medium", size: 17.0)
            cell = customDataCell
                
        default:
            cell = UITableViewCell()
        }
        cell.backgroundColor = #colorLiteral(red: 1, green: 0.9176470588, blue: 0.9450980392, alpha: 1)
        cell.selectionStyle = .none
        tableView.backgroundColor = #colorLiteral(red: 1, green: 0.9176470588, blue: 0.9450980392, alpha: 1)
        cell.textLabel?.textColor = #colorLiteral(red: 0.8269874454, green: 0.0782038793, blue: 0.35505265, alpha: 1)
        cell.tintColor = #colorLiteral(red: 0.8269874454, green: 0.0782038793, blue: 0.35505265, alpha: 1)
        cell.textLabel?.font = UIFont(name: "Avenir Medium", size: 17.0)
        
        return cell
    }
    
    
    @IBOutlet weak var bioTextView: UITextView!
    @IBOutlet weak var bioTextConstraint: NSLayoutConstraint!
    

    override var prefersStatusBarHidden: Bool { return true }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    @IBAction func swipeLeft(_ sender: Any) {
        self.performSegue(withIdentifier: "swipeViewController", sender: self)
        self.dismiss(animated: true) {
            
        }
    }

    @IBAction func swipeRight(_ sender: Any) {
        print("yes")
    }
}
