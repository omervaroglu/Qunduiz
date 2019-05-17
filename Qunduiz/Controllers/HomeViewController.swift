//
//  HomeViewController.swift
//  Qunduiz
//
//  Created by Omer  on 6.04.2019.
//  Copyright © 2019 Omer Varoglu. All rights reserved.
//
import UIKit
import IQKeyboardManagerSwift

class HomeViewController: UIViewController {
    @IBOutlet weak var startButton: CustomButton!
    @IBOutlet weak var highScoreButton: CustomButton!
    
    var questions : [Questions] = []
    var name: String = ""
    var score: Int = 0
    var storedName: [String] = []
    var indexpath = 0
    
    override func viewDidLoad() {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.topItem?.title = "Qunduiz"
    }
    override func viewWillAppear(_ animated: Bool) {
        setSelected()
    }
    
    @IBAction func startButtonAction(_ sender: Any) {
        let vc = storyboard!.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        vc.questions = questions
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setSelected() {
        for section in questions.indices {
            for number in  questions[section].answers!.indices{
                if questions[section].answers![number].isSelected {
                    questions[section].answers![number].isSelected = false
                }
            }
        }
    }
}
