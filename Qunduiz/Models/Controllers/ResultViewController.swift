//
//  ResultViewController.swift
//  Qunduiz
//
//  Created by Omer  on 5.04.2019.
//  Copyright © 2019 Omer Varoglu. All rights reserved.
//

import UIKit

class ResultViewController: UITableViewController {
    var questions : [Questions] = []
    var index : Int = 0
    override func viewDidLoad() {
        self.navigationItem.backBarButtonItem?.action
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UINib(nibName: "QuestionCell", bundle: nil), forCellReuseIdentifier: "QuestionCell" )
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! QuestionCell
        if String(questions[indexPath.row].answers![indexPath.row].isSelected) == questions[indexPath.row].answers![indexPath.row].isTrue {
            cell.questionView.layer.borderColor = UIColor.green.cgColor
        } else {
            cell.questionView.layer.borderColor = UIColor.red.cgColor
        }
        cell.questionLabel.text = questions[indexPath.row].soru
        return cell
    }
}
