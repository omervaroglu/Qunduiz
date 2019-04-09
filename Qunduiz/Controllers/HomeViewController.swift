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
    var name: String = ""
    var score: Int = 0
    var storedName: [String] = []
    
    override func viewDidLoad() {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.topItem?.title = "Qunduiz"
        
    }
    override func viewWillAppear(_ animated: Bool) {
        if UserDefaults.standard.array(forKey: "nickname") != nil {
            self.storedName = UserDefaults.standard.array(forKey: "nickname") as! [String]
        }
    }
    
    @IBAction func startButtonAction(_ sender: Any) {

        if nameField.text == ""{
            ViewUtils.showAlert(withController: self, title: "HATA!", message: "Lutfen isimi doldurunuz!")
        }else {
            storedName.append(nameField.text ?? "")
            UserDefaults.standard.set(storedName, forKey: "nickname")
            print(storedName)
        }
        let vc = storyboard!.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        vc.questions = questions
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
