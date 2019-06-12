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
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return scoreList.count-1
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 200
        default:
            return 80
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
        switch indexPath.section {
            case 0:
                tableView.register(UINib(nibName: "BestScoreCell", bundle: nil), forCellReuseIdentifier: "BestScoreCell" )
                let cell = tableView.dequeueReusableCell(withIdentifier: "BestScoreCell", for: indexPath) as! BestScoreCell
                cell.bestScoreNameLabel.text = scoreList[0].name
                cell.bestScoreScoreCell.text = "Score: \(String(scoreList[0].score))"
                return cell
            default:
                tableView.register(UINib(nibName: "HighScoreCell", bundle: nil), forCellReuseIdentifier: "HighScoreCell" )
                let cell = tableView.dequeueReusableCell(withIdentifier: "HighScoreCell", for: indexPath) as! HighScoreCell
//                if indexPath.row != 0 {
//
//                }
                cell.scoreNameLabel.text = scoreList[indexPath.row + 1].name
                cell.scoreLabel.text = "Score: \(String(scoreList[indexPath.row + 1].score))"
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
