//
//  HomeViewController.swift
//  Qunduiz
//
//  Created by Omer  on 6.04.2019.
//  Copyright © 2019 Omer Varoglu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var startButton: CustomButton!
    @IBOutlet weak var highScoreButton: CustomButton!
    
    var questions : [Questions] = []
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.topItem?.title = "Qunduiz"
        
    }
    
    @IBAction func startButtonAction(_ sender: Any) {
        let vc = storyboard!.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        vc.questions = questions
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
