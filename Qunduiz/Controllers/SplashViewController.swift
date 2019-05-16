//
//  SplashViewController.swift
//  Qunduiz
//
//  Created by Omer  on 3.04.2019.
//  Copyright © 2019 Omer Varoglu. All rights reserved.
//

import UIKit
import ObjectMapper
import SwiftyJSON

class SplashViewController: UIViewController {
    
    var questionList: QuestionList? {
        didSet{
            print(questionList!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.isNavigationBarHidden = true
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(nextPage), userInfo: nil, repeats: false)
    }
    
    @objc func nextPage(){
        // veri icin once data tipini olusturuyoruz.sonrasinda da json u dataya gore mapliyoruz.
        let path = Bundle.main.path(forResource: "mock_questions_data", ofType: "json")
        guard let filePath = path, let jsonData = try? Data(contentsOf: URL(fileURLWithPath: filePath))  else { return }
        questionList = Mapper<QuestionList>().map(JSONObject: JSON(jsonData).dictionaryObject)
        
        let vc = storyboard!.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        vc.questions = (questionList?.questions)!
        self.navigationController?.setViewControllers([vc], animated: true)
    }
}
