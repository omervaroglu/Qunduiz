//
//  NameViewController.swift
//  Qunduiz
//
//  Created by Ömer Varoğlu on 15.05.2019.
//  Copyright © 2019 Omer Varoglu. All rights reserved.
//

import UIKit
import CoreData

class NameViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    
    var questions : [Questions] = []
    var score  = 0
    
    @IBAction func buttonAction(_ sender: Any) {
        saveData()
        let vc = storyboard!.instantiateViewController(withIdentifier: "HighScoreTableViewController") as! HighScoreTableViewController
        let vc1 = storyboard!.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        vc1.questions = questions
        navigationController?.setViewControllers([vc1,vc], animated: true)
 
    }
    
    func saveData () {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let scores = NSEntityDescription.insertNewObject(forEntityName: "Scores", into: context)
        
        scores.setValue(nameField.text, forKey: "name")
        scores.setValue(score, forKey: "score")
        do {
            try context.save()
            print("kaydetme basarili")
        } catch  {
            print("CoreData Error")
        }
    }
}
