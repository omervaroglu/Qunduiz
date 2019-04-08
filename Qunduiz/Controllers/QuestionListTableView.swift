//
//  QuestionListTableView.swift
//  Qunduiz
//
//  Created by Omer  on 3.04.2019.
//  Copyright © 2019 Omer Varoglu. All rights reserved.
//

import UIKit
import ObjectMapper
import SwiftyJSON

class QuestionListTableView: UITableViewController {
    var questions : [Questions] = []
    var index : Int = 0{
        didSet{
            tableView.reloadData()
            setSelected()
        }
    }
    
    var name: String = ""
    var score: Int = 0
   
    override func viewDidLoad() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Devam", style: .plain, target: self, action: #selector(nextQuestions))

    }
    override func viewWillAppear(_ animated: Bool) {
        setSelected()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return questions[self.index].answers?.count ?? 0
        default:
            return 0
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            tableView.register(UINib(nibName: "QuestionCell", bundle: nil), forCellReuseIdentifier: "QuestionCell" )
            let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! QuestionCell
            cell.questionLabel.text = questions[self.index].soru
            return cell
        case 1:
            tableView.register(UINib(nibName: "AnswerCell", bundle: nil), forCellReuseIdentifier: "AnswerCell" )
            let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerCell", for: indexPath) as! AnswerCell
            cell.answerLabel.text = questions[self.index].answers![indexPath.row].name
            if questions[self.index].answers![indexPath.row].isSelected {
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
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 1:
            return 90
        default:
            return 120
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 1:
            print("Row \(indexPath.row) selected")
            let cell = tableView.cellForRow(at: indexPath) as! AnswerCell

            if questions[self.index].answers![indexPath.row].isSelected {
                setSelected()
                questions[self.index].answers![indexPath.row].isSelected = false
                cell.answerView.layer.borderColor = UIColor.orange.cgColor
                print(questions[self.index].answers![indexPath.row].isSelected)
            } else {
                cell.answerView.layer.borderColor = UIColor.cyan.cgColor
                setSelected()
                questions[self.index].answers![indexPath.row].isSelected = true
                print(questions[self.index].answers![indexPath.row].isSelected)
            }
        default:
            break
        }
            self.tableView.reloadData()
    }
    
    func setSelected() {
        for number in  0...questions[self.index].answers!.count - 1{
            if questions[self.index].answers![number].isSelected {
                questions[self.index].answers![number].isSelected = false
//                let cell = tableView.cellForRow(at: indexpath) as! AnswerCell
//                cell.answerView.layer.borderColor = UIColor.orange.cgColor
            }
        }
    }
    
    @objc func nextQuestions() {
        if self.index == questions.count - 1  {
            let vc = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
            let vc1 = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            vc.questions = questions
            vc1.questions = questions
            //vc.index = questions.count - 1
            self.navigationController?.setViewControllers([vc1, vc], animated: true)
        } else {
            self.index = self.index + 1
        }
    }
}
