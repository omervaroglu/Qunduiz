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
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var highScoreButton: UIButton!
    @IBOutlet weak var listSelectedLabel: UILabel!
    @IBOutlet weak var singleSelectedLabel: UILabel!
    
    var questions : [Questions] = []
    var answers : [Answers] = []
    var name: String = ""
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false

        
        let listgestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(listSelected))
        listCardView.addGestureRecognizer(listgestureRecognizer)
        
        let singeGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(singeSelected))
        singleCardView.addGestureRecognizer(singeGestureRecognizer)
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.barStyle = UIBarStyle.default
        
    }
    
    @objc func listSelected () {
        listSelectedLabel.text = "✔️"
        singleSelectedLabel.text = ""
    }
    
    @objc func singeSelected () {
        listSelectedLabel.text = ""
        singleSelectedLabel.text = "✔️"
    }
    
    @IBAction func baslaAction(_ sender: Any) {
        if listSelectedLabel.text ==  "✔️" {
            let vc = storyboard!.instantiateViewController(withIdentifier: "QuestionListTableView") as! QuestionListTableView
            vc.questions = questions
            vc.tableView.reloadData()
            self.navigationController?.pushViewController(vc, animated: true)
        }else {
            
        }
    }
}

