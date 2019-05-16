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
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Devam", style: .plain, target: self, action: #selector(highScore))
        if UserDefaults.standard.array(forKey: "scoreArray") != nil {
            scoreArray = UserDefaults.standard.array(forKey: "scoreArray") as! [Int]
        }
    }
    
    @objc func highScore() {
        scoreArray.append(score)
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
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UINib(nibName: "QuestionCell", bundle: nil), forCellReuseIdentifier: "QuestionCell" )
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! QuestionCell
        if String(questions[indexPath.row].answers![indexPath.row].isSelected) == questions[indexPath.row].answers![indexPath.row].isTrue {
            score += 5
            cell.questionView.layer.borderColor = UIColor.green.cgColor
            UserDefaults.standard.set("scoreArray", forKey: "scoreArray")
        } else {
            cell.questionView.layer.borderColor = UIColor.red.cgColor
        }
        cell.questionLabel.text = questions[indexPath.row].soru
        return cell
    }
}
