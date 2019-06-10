//
//  QuestionHeaderTableViewController.swift
//  Qunduiz
//
//  Created by Omer  on 12.04.2019.
//  Copyright © 2019 Omer Varoglu. All rights reserved.
//

import UIKit

class QuestionHeaderTableViewController: UITableViewController {
    var questions : [Questions] = []
    
    override func viewDidLoad() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Testi Sonlandır", style: UIBarButtonItem.Style.plain, target: self, action: #selector(finishedQuiz))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Devam", style: UIBarButtonItem.Style.plain, target: self, action: #selector(finishedQuiz))
    }
    
    @objc func finishedQuiz () {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        let vc1 = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        vc.questions = questions
        vc1.questions = questions
        self.navigationController?.setViewControllers([vc1, vc], animated: true)
    }
    
    func isAnsweredQuestion(q: Questions)->Bool{
        for answer in q.answers {
            if answer.isSelected {
                return true
            }
        }
        return false
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
        cell.questionLabel.text = " soru \(indexPath.row + 1)"
        
        if isAnsweredQuestion(q: questions[indexPath.row]) {
            cell.questionView.layer.borderColor = UIColor.cyan.cgColor
        }else {
            cell.questionView.layer.borderColor = UIColor.orange.cgColor
        }
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "QuestionPagingTableViewController") as! QuestionPagingTableViewController
        vc.questions = questions
        vc.indexNumber = indexPath.row
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
