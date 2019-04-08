//
//  HighScoreTableViewController.swift
//  Qunduiz
//
//  Created by Omer  on 8.04.2019.
//  Copyright © 2019 Omer Varoglu. All rights reserved.
//

import UIKit

class HighScoreTableViewController: UITableViewController {
    var scoreArray: [Int] = [] {
        didSet{
            tableView.reloadData()
        }
    }
    var nameArray: [String] = [] {
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        scoreArray = UserDefaults.standard.array(forKey: "scoreArray") as! [Int]
        nameArray = UserDefaults.standard.array(forKey: "nickname") as! [String]
        tableView.reloadData()
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
}
