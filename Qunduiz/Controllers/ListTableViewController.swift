//
//  ListTableViewController.swift
//  Qunduiz
//
//  Created by Omer  on 10.04.2019.
//  Copyright © 2019 Omer Varoglu. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    var questions : [Questions] = []
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return questions.count
        case 1:
            return 3
        default:
            return 1
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            tableView.register(UINib(nibName: "QuestionCell", bundle: nil), forCellReuseIdentifier: "QuestionCell" )
            let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! QuestionCell
            cell.questionLabel.text = questions[indexPath.row].soru
            return cell
        case 1:
            tableView.register(UINib(nibName: "AnswerCell", bundle: nil), forCellReuseIdentifier: "AnswerCell" )
            let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerCell", for: indexPath) as! AnswerCell
            cell.answerLabel.text = questions[indexPath.row].answers![indexPath.row].name
            if questions[indexPath.row].answers![indexPath.row].isSelected {
                cell.answerView.layer.borderColor = UIColor.cyan.cgColor
            }else {
                cell.answerView.layer.borderColor = UIColor.orange.cgColor
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
}
