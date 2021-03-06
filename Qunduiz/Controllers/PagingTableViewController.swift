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

class PagingTableViewController: UITableViewController {
    var questions : [Questions] = []
    var index : Int = 0 {
        didSet{
            tableView.reloadData()
//            Utils.setSelected(questions)
        }
    }
   
    override func viewDidLoad() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Testi Sonlandır", style: UIBarButtonItem.Style.plain, target: self, action: #selector(quitQuiz))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Devam", style: .plain, target: self, action: #selector(nextQuestions))
        questions = Utils.questions
    }
//    override func viewWillAppear(_ animated: Bool) {
//        Utils.setSelected(questions)
//    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return questions[self.index].answers.count
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
            cell.answerLabel.text = questions[self.index].answers[indexPath.row].name
            if questions[self.index].answers[indexPath.row].isSelected {
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

            if questions[self.index].answers[indexPath.row].isSelected {
                questions[self.index].answers[indexPath.row].isSelected = false
                cell.answerView.layer.borderColor = UIColor.orange.cgColor
                print(questions[self.index].answers[indexPath.row].isSelected)
            } else {
                cell.answerView.layer.borderColor = UIColor.cyan.cgColor
                questions[self.index].answers[indexPath.row].isSelected = true
                print(questions[self.index].answers[indexPath.row].isSelected)
            }
        default:
            break
        }
            self.tableView.reloadData()
    }

    @objc func nextQuestions() {
        if self.index == questions.count - 1  {
            let vc = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
            let vc1 = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            vc.questions = questions
            vc1.questions = questions
            self.navigationController?.setViewControllers([vc1, vc], animated: true)
            self.index = 0
        } else {
            self.index = self.index + 1
        }
    }
    @objc func quitQuiz() {
        ViewUtils.showCsAlert(withController: self, title: "Çıkmak istediğinize emin misin?", message: "Eğer çıkış yaparsan skorun kaydedilmeyecek!") { (_) in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
//            vc.questions = self.questions
            self.navigationController?.setViewControllers([vc], animated: true)
        }
    }
}
