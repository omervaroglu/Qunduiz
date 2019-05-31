//
//  TypeTableViewController.swift
//  Qunduiz
//
//  Created by Ömer Varoğlu on 17.05.2019.
//  Copyright © 2019 Omer Varoglu. All rights reserved.
//

import Foundation
import UIKit

class TypeTableViewController : UITableViewController {
    @IBOutlet weak var lineSelectedLabel: UILabel!
    @IBOutlet weak var listViewSelectedLabel: UILabel!
    @IBOutlet weak var pagingSelectedLabel: UILabel!
    var questions : [Questions] = []
    var answers : [Answers] = []
    
    override func viewDidLoad() {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "Görünümünü Seç"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Devam", style: UIBarButtonItem.Style.plain, target: self, action: #selector(startQuiz))
    }
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.barStyle = UIBarStyle.default
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            listViewSelectedLabel.text = ""
            pagingSelectedLabel.text = ""
            lineSelectedLabel.text = "✔️"
            tableView.reloadData()
        case 1:
            listViewSelectedLabel.text = "✔️"
            pagingSelectedLabel.text = ""
            lineSelectedLabel.text = ""
            tableView.reloadData()
        case 2:
            listViewSelectedLabel.text = ""
            pagingSelectedLabel.text = "✔️"
            lineSelectedLabel.text = ""
            tableView.reloadData()
        default: print("eror")
            
        }
    }
    
    @objc func startQuiz() {
        if listViewSelectedLabel.text ==  "✔️" {
            let vc = storyboard!.instantiateViewController(withIdentifier: "ListTableViewController") as! ListTableViewController
            vc.questions = questions
            vc.tableView.reloadData()
            self.navigationController?.pushViewController(vc, animated: true)

        }else if pagingSelectedLabel.text == "✔️"  {
            let vc = storyboard!.instantiateViewController(withIdentifier: "PagingTableViewController") as! PagingTableViewController
            vc.questions = questions
            vc.tableView.reloadData()
            self.navigationController?.pushViewController(vc, animated: true)

        }else if lineSelectedLabel.text == "✔️" {
            let vc = storyboard!.instantiateViewController(withIdentifier: "QuestionHeaderTableViewController") as! QuestionHeaderTableViewController
            vc.questions = questions
            vc.tableView.reloadData()
            self.navigationController?.pushViewController(vc, animated: true)
        }else {
            ViewUtils.showAlert(withController: self, title: "HATA!", message: "Lutfen gorunum seciniz.")
        }
    }
}
