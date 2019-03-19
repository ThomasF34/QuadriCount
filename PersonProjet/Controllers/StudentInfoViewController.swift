//
//  StudentInfoViewController.swift
//  PersonProjet
//
//  Created by Thomas Falcone on 15/03/2019.
//  Copyright © 2019 Thomas Falcone. All rights reserved.
//

import UIKit

class StudentInfoViewController: UIViewController {
    
    var student : Person?;
    @IBOutlet weak var titleName: UINavigationItem!
    @IBOutlet weak var birthdateLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        guard (student != nil) else { return }
        titleName.title = student?.fullname
        if student?.birthdate != nil {
            birthdateLabel.text = student?.birthdate?.description
            birthdateLabel.textColor = UIColor.black
        } else {
            birthdateLabel.text = "No birthdate registered"
            birthdateLabel.textColor = UIColor.red
        }
        
        let url = URL(string: "https://i.pinimg.com/736x/6c/7f/87/6c7f877678abf1091a343c06edebd937--avatar-james-cameron-pandora.jpg")
        let data = try? Data(contentsOf: url!)
        if let imageData = data {
            imageView.image = UIImage(data: imageData)
        }
        
    }
    
   
    
}
