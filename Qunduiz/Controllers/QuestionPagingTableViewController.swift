//
//  QuestionPagingTableViewController.swift
//  Qunduiz
//
//  Created by Omer  on 12.04.2019.
//  Copyright © 2019 Omer Varoglu. All rights reserved.
//

import UIKit

class QuestionPagingTableViewController: UITableViewController {
    var questions : [Questions] = []
    var indexNumber = 0
    
    override func viewDidLoad() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Devam", style: UIBarButtonItem.Style.plain, target: self, action: #selector(nextQuestions))
    }
    @objc func nextQuestions() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "QuestionHeaderTableViewController") as! QuestionHeaderTableViewController
        vc.questions = questions
        self.navigationController?.setViewControllers([vc], animated: true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return questions[section].answers?.count ?? 0
        default:
            return 0
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            tableView.register(UINib(nibName: "QuestionCell", bundle: nil), forCellReuseIdentifier: "QuestionCell" )
            let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! QuestionCell
            cell.questionLabel.text = questions[indexNumber].soru
            return cell
        case 1:
            tableView.register(UINib(nibName: "AnswerCell", bundle: nil), forCellReuseIdentifier: "AnswerCell" )
            let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerCell", for: indexPath) as! AnswerCell
            cell.answerLabel.text = questions[indexNumber].answers![indexPath.row].name
            if questions[indexNumber].answers![indexPath.row].isSelected {
                cell.answerView.layer.borderColor = UIColor.cyan.cgColor
            }else {
                cell.answerView.layer.borderColor = UIColor.orange.cgColor
            }
            return cell
        default:
            let cell = UITableViewCell()
            return cell
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 1:
            print("Row \(indexPath.row) selected")
            let cell = tableView.cellForRow(at: indexPath) as! AnswerCell
            
            if questions[indexNumber].answers![indexPath.row].isSelected {
                setSelected()
                questions[indexNumber].answers![indexPath.row].isSelected = false
                cell.answerView.layer.borderColor = UIColor.orange.cgColor
                print(questions[indexNumber].answers![indexPath.row].isSelected)
            } else {
                cell.answerView.layer.borderColor = UIColor.cyan.cgColor
                setSelected()
                questions[indexNumber].answers![indexPath.row].isSelected = true
                print(questions[indexNumber].answers![indexPath.row].isSelected)
            }
        default:
            break
        }
        self.tableView.reloadData()
    }
    func setSelected() {
        for number in  0...questions[indexNumber].answers!.count - 1{
            if questions[indexNumber].answers![number].isSelected {
                questions[indexNumber].answers![number].isSelected = false
            }
        }
    }    
}
