//
//  HighScoreTableViewController.swift
//  Qunduiz
//
//  Created by Omer  on 8.04.2019.
//  Copyright © 2019 Omer Varoglu. All rights reserved.
//

import UIKit
import CoreData

class HighScoreTableViewController: UITableViewController {
    var scoreArray: [Int16] = [] {
        didSet{
            tableView.reloadData()
        }
    }
    var nameArray: [String] = [] {
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        getData()
//        if UserDefaults.standard.array(forKey: "scoreArray") != nil {
//            scoreArray = UserDefaults.standard.array(forKey: "scoreArray") as! [Int]
//            nameArray = UserDefaults.standard.array(forKey: "nickname") as! [String]
//            tableView.reloadData()
//            print(scoreArray, nameArray)
//        }
    }
    //islevsiz
    @objc func backAction() {
        let vc = storyboard!.instantiateViewController(withIdentifier: "HomeViewController")
        navigationController?.setViewControllers([vc], animated: true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scoreArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UINib(nibName: "HighScoreCell", bundle: nil), forCellReuseIdentifier: "HighScoreCell" )
        let cell = tableView.dequeueReusableCell(withIdentifier: "HighScoreCell", for: indexPath) as! HighScoreCell
        cell.scoreNameLabel.text = nameArray[indexPath.row]
        cell.scoreLabel.text = "Score: \(String(scoreArray[indexPath.row]))"
        return cell
    }
    
    func getData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Scores")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(fetchRequest)
            
            if results.count > 0 {
                for result in results  as! [NSManagedObject]{
                    if let name = result.value(forKey: "name") as? String {
                        self.nameArray.append(name)
                    }
                    if let score = result.value(forKey: "score") as? Int16 {
                        self.scoreArray.append(score)
                    }
                }
            }
        } catch  {
            
        }
        
    }
}
