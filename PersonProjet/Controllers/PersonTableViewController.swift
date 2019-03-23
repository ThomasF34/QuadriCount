//
//  MyTableViewDelegate.swift
//  PersonProjet
//
//  Created by Thomas Falcone on 15/03/2019.
//  Copyright © 2019 Thomas Falcone. All rights reserved.
//

import Foundation
import UIKit

class PersonTableViewController : NSObject, UITableViewDataSource, UITableViewDelegate, PersonSetViewModelDelegate{
    
    var table : UITableView!
    var data : ViewModelPersonTable
    let fetchResultController : PersonFetchResultController
    
    init(tableView : UITableView){
        self.table = tableView
        self.fetchResultController = PersonFetchResultController(view: self.table)
        self.data = ViewModelPersonTable(data : self.fetchResultController.personFetched)
        super.init()
        self.table.dataSource = self
        data.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        if let person = self.data.get(personAt: indexPath.row){
            cell.textLabel?.text = person.fullname
        }
        return cell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    //Pas ouf pas ouf. Faudrait lier VC à VM
    func get(personAt: Int) -> Person? {
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
