//
//  ViewController.swift
//  PersonProjet
//
//  Created by Thomas Falcone on 12/03/2019.
//  Copyright © 2019 Thomas Falcone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var studentTableView: UITableView!
    var studentTableViewController: PersonTableViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.studentTableViewController = PersonTableViewController(tableView: self.studentTableView)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showInfos" {
            let destination = segue.destination as? StudentInfoViewController, studIndex = studentTableView.indexPathForSelectedRow?.row
            guard (studIndex != nil) else { return }
            destination?.student = studentTableViewController.get(personAt: studIndex!)
        }
    }

    @IBAction func unwindToMainView(segue: UIStoryboardSegue){
        if let controller = segue.source as? AddPersonViewController{
            if let person = controller.newPerson {
                studentTableViewController.add(person: person)
            }
        }
    }
}

