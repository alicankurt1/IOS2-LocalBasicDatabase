//
//  ViewController.swift
//  BirthdayNoteLocalDatabase
//
//  Created by Alican Kurt on 7.08.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var birthdayText: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        // Casting as? vs. as!
        
        if let name = storedName as? String{
            nameLabel.text = name
        }
        if let birthday = storedBirthday as? String{
            birthdayLabel.text = birthday
        }
        
    }

    @IBAction func SaveClick(_ sender: Any) {
        
        UserDefaults.standard.set(nameText.text!, forKey: "name")
        UserDefaults.standard.set(birthdayText.text!, forKey: "birthday")
        
        nameLabel.text = "Name: \(nameText.text!)"
        birthdayLabel.text = "Birthday: \(birthdayText.text!)"
    }
    
    @IBAction func deleteClick(_ sender: Any) {
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if (storedName as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "deleted Name"
        }
        if(storedBirthday as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayLabel.text = "deleted Birthday"
        }
    }
    
    
    
}

