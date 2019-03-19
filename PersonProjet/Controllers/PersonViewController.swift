//
//  MyTableViewDelegate.swift
//  PersonProjet
//
//  Created by Thomas Falcone on 15/03/2019.
//  Copyright © 2019 Thomas Falcone. All rights reserved.
//

import Foundation
import UIKit

class PersonViewController : NSObject, UITableViewDataSource, UITableViewDelegate, PersonSetViewModelDelegate{
    
    @IBOutlet weak var table: UITableView!
    var data : ViewModelPersonTable
    
    override init(){
        self.data = ViewModelPersonTable()
        super.init()
        data.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell")!;
        cell.textLabel?.text = self.data.get(personAt: indexPath.row).fullname
       // cell.textLabel?. = self.set.count[indexPath.row].birthdate
        return cell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    //Pas ouf pas ouf. Faudrait lier VC à VM
    func get(personAt: Int) -> Person {
        return self.data.get(personAt: personAt);
    }
    
    func add(person: Person){
        self.data.add(person: person)
    }
    
    func personAdded(){
        table.reloadData()
    }
    
    func personRemoved(){
        table.reloadData()
    }
    
}
