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
    var score : Int = 0
    var scoreArray : [Int] = []
    
    override func viewDidLoad() {
        self.navigationItem.title = "Cevapların"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Devam", style: .plain, target: self, action: #selector(highScore))
    }
    
    @objc func highScore() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "NameViewController") as! NameViewController
        vc.questions = questions
        vc.score = score
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UINib(nibName: "ResultCell", bundle: nil), forCellReuseIdentifier: "ResultCell" )
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath) as! ResultCell
        if resultTest(answers: questions[indexPath.row].answers) == true {
            score += 5
            cell.resultView.layer.borderColor = UIColor.green.cgColor
            cell.trueAnswerLabel.textColor = .green
            cell.yourAnswerLabel.textColor = .green
        } else if resultTest(answers: questions[indexPath.row].answers) == nil {
            cell.resultView.layer.borderColor = UIColor.gray.cgColor
        } else {
            cell.resultView.layer.borderColor = UIColor.red.cgColor
            cell.yourAnswerLabel.textColor = .red
            cell.trueAnswerLabel.textColor = .green
        }

        cell.questionLabel.text = questions[indexPath.row].soru
        yourAnswer(answers: questions[indexPath.row].answers, yourlabel: cell.yourAnswerLabel, truelabel: cell.trueAnswerLabel)

        return cell
    }
    
    func resultTest(answers : [Answers] ) -> Bool? {
        for answer in answers {
            if answer.isSelected {
                if answer.isTrue == "true" {
                    return true
                } else {
                    return false
                }
            }
        }
        return nil
    }
    func yourAnswer (answers : [Answers], yourlabel: UILabel, truelabel: UILabel ){
        for answer in answers {
            if answer.isSelected {
                yourlabel.text = answer.name
            }
            if answer.isTrue == "true" {
                truelabel.text = answer.name
            }
        }
    }
}
