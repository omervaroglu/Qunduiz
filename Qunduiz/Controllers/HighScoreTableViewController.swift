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
    var scoreList : [Score] = [] {
        didSet{
            scoreList = scoreList.sorted { (s1, s2) -> Bool in
                return s1.score > s2.score
            }
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        getData()
        //tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scoreList.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            if indexPath.row == 0 {
                tableView.register(UINib(nibName: "BestScoreCell", bundle: nil), forCellReuseIdentifier: "BestScoreCell" )
                let bestCell = tableView.dequeueReusableCell(withIdentifier: "BestScoreCell", for: indexPath) as! BestScoreCell
                bestCell.bestScoreNameLabel.text = scoreList[0].name
                bestCell.bestScoreScoreCell.text = "Score: \(String(scoreList[0].score))"
                return bestCell
            } else {
                tableView.register(UINib(nibName: "HighScoreCell", bundle: nil), forCellReuseIdentifier: "HighScoreCell" )
                let cell = tableView.dequeueReusableCell(withIdentifier: "HighScoreCell", for: indexPath) as! HighScoreCell
                cell.scoreNameLabel.text = scoreList[indexPath.row].name
                cell.scoreLabel.text = "Score: \(String(scoreList[indexPath.row].score))"
                return cell
            }
    }
    
    func getData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Score")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(fetchRequest)
            if results.count > 0 {
                self.scoreList = results as! [NSManagedObject] as! [Score]
            }
        } catch  {
            
        }
    }
}
