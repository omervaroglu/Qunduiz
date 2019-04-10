//
//  ViewController.swift
//  Qunduiz
//
//  Created by Omer  on 3.04.2019.
//  Copyright © 2019 Omer Varoglu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var listCardView: UIView!
    @IBOutlet weak var singleCardView: UIView!
    @IBOutlet weak var lineCardView: UIView!
    @IBOutlet weak var listSelectedLabel: UILabel!
    @IBOutlet weak var singleSelectedLabel: UILabel!
    @IBOutlet weak var lineSelectedLabel: UILabel!
    
    var questions : [Questions] = []
    var answers : [Answers] = []
    var name: String = ""
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Devam", style: UIBarButtonItem.Style.plain, target: self, action: #selector(startQuiz))
  
        let listgestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(listSelected))
        listCardView.addGestureRecognizer(listgestureRecognizer)
        
        let singeGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(singeSelected))
        singleCardView.addGestureRecognizer(singeGestureRecognizer)
        
        let lineGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(lineSelected))
        lineCardView.addGestureRecognizer(lineGestureRecognizer)
    }
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.barStyle = UIBarStyle.default
        
    }
    
    @objc func listSelected () {
        listSelectedLabel.text = "✔️"
        singleSelectedLabel.text = ""
        lineSelectedLabel.text = ""
    }
    
    @objc func singeSelected () {
        listSelectedLabel.text = ""
        singleSelectedLabel.text = "✔️"
        lineSelectedLabel.text = ""
    }
    @objc func lineSelected () {
        listSelectedLabel.text = ""
        singleSelectedLabel.text = ""
        lineSelectedLabel.text = "✔️"
    }
    
    @objc func startQuiz() {
        if listSelectedLabel.text ==  "✔️" {
            let vc = storyboard!.instantiateViewController(withIdentifier: "ListTableViewController") as! ListTableViewController
            vc.questions = questions
            vc.tableView.reloadData()
            self.navigationController?.pushViewController(vc, animated: true)
            
        }else if singleSelectedLabel.text == "✔️"  {
            let vc = storyboard!.instantiateViewController(withIdentifier: "QuestionListTableView") as! QuestionListTableView
            vc.questions = questions
            vc.tableView.reloadData()
            self.navigationController?.pushViewController(vc, animated: true)
            
        }else if lineSelectedLabel.text == "✔️" {
            
        }else {
            ViewUtils.showAlert(withController: self, title: "HATA!", message: "Lutfen gorunum seciniz.")

        }
    }
}

