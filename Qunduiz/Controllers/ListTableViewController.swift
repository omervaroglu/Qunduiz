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

    override func viewDidLoad() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Testi Sonlandır", style: UIBarButtonItem.Style.plain, target: self, action: #selector(quitQuiz))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Devam", style: .plain, target: self, action: #selector(finishedQuiz))
        questions = Utils.questions
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return questions.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return questions[section].soru
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions[section].answers.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let containerView = UIView()
        let view = UIView(frame: CGRect(x: 8, y: 4, width: tableView.frame.width, height: 2))
        let label = UILabel(frame: CGRect(x: 8, y: 10, width: tableView.frame.width, height: 50))
        label.numberOfLines = 0
        label.text = questions[section].soru
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .white
        view.backgroundColor = .gray
        containerView.addSubview(label)
        containerView.addSubview(view)
        return containerView
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UINib(nibName: "AnswerCell", bundle: nil), forCellReuseIdentifier: "AnswerCell" )
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerCell", for: indexPath) as! AnswerCell
        cell.answerLabel.text = questions[indexPath.section].answers[indexPath.row].name
        if questions[indexPath.section].answers[indexPath.row].isSelected {
            cell.answerView.layer.borderColor = UIColor.cyan.cgColor
        }else {
            cell.answerView.layer.borderColor = UIColor.orange.cgColor
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(" Row \(indexPath.row) selected")
        //let cell = tableView.cellForRow(at: indexPath) as! AnswerCell
            
        if questions[indexPath.section].answers[indexPath.row].isSelected {
            setSelected(indexpath: indexPath.section)
            questions[indexPath.section].answers[indexPath.row].isSelected = false
        } else {
            setSelected(indexpath: indexPath.section)
            questions[indexPath.section].answers[indexPath.row].isSelected = true
        }
        self.tableView.reloadData()
    }
    
    func setSelected(indexpath: Int) {
        for number in  0...questions[indexpath].answers.count - 1{
            if questions[indexpath].answers[number].isSelected {
                questions[indexpath].answers[number].isSelected = false
            }
        }
    }
    @objc func finishedQuiz () {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        let vc1 = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        vc.questions = questions
        //vc1.questions = questions
        self.navigationController?.setViewControllers([vc1, vc], animated: true)
    }
    @objc func quitQuiz() {
        ViewUtils.showCsAlert(withController: self, title: "Çıkmak istediğinize emin misin?", message: "Eğer çıkış yaparsan skorun kaydedilmeyecek!") { (_) in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            //vc.questions = self.questions
            self.navigationController?.setViewControllers([vc], animated: true)
        }
    }
}
