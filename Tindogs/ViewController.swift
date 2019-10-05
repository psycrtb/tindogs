//
//  ViewController.swift
//  Tindogs
//
//  Created by Tim Belfield on 05.10.19.
//  Copyright © 2019 Tindogs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lookForDogButton: UIButton!
    
    var dogs: [Dog] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DogsDataModel().getDogs() { dogs in
            print("We have the dogs")
            self.dogs = dogs
            self.lookForDogButton.isEnabled = true
            
        }
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueFromRight"{
            let vc = segue.destination as! SwipeViewController
            vc.dogs = dogs
        }
    }
    
//    override func performSegue(withIdentifier identifier: String, sender: Any?) {
////        super.performSegue(withIdentifier: identifier, sender: sender)
//        if identifier == "segueFromRight"{
//             let vc = segue.destination as! FooTwoViewController
//             vc.colorString = colorLabel.text!
//         }
//    }


}

