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
    var ScoreList : [Score] = [] {
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        getData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ScoreList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UINib(nibName: "HighScoreCell", bundle: nil), forCellReuseIdentifier: "HighScoreCell" )
        let cell = tableView.dequeueReusableCell(withIdentifier: "HighScoreCell", for: indexPath) as! HighScoreCell
        
        cell.scoreNameLabel.text = ScoreList[indexPath.row].name
        cell.scoreLabel.text = "Score: \(String(ScoreList[indexPath.row].score))"
        return cell
    }
    
    func getData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Score")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(fetchRequest)
            if results.count > 0 {
                self.ScoreList = results as! [NSManagedObject] as! [Score]
            }
        } catch  {
            
        }
        
    }
}
