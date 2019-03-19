//
//  AddPersonViewController.swift
//  PersonProjet
//
//  Created by Thomas Falcone on 19/03/2019.
//  Copyright © 2019 Thomas Falcone. All rights reserved.
//

import Foundation
import UIKit

class AddPersonViewController : UIViewController{
    
    @IBOutlet weak var firstnameLabel: UITextField!
    @IBOutlet weak var lastnameLabel: UITextField!
    var newPerson : Person?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addPersonSegue"{
            guard let firstname = firstnameLabel.text, let lastname = lastnameLabel.text else { return }
            self.newPerson = Person(fn: firstname, ln: lastname)
        }
    }
    
}
