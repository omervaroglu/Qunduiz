//
//  AnswerCell.swift
//  Qunduiz
//
//  Created by Omer  on 3.04.2019.
//  Copyright © 2019 Omer Varoglu. All rights reserved.
//

import UIKit

class AnswerCell: UITableViewCell {
    @IBOutlet weak var answerView: UIView!
    @IBOutlet weak var answerLabel: UILabel!
    
    
    override func awakeFromNib() {
       answerView.layer.cornerRadius = 8.0
       answerView.layer.shadowColor = UIColor.black.cgColor
       answerView.layer.shadowOffset = CGSize(width: 0, height: 1)
       answerView.layer.shadowOpacity = 0.4
       answerView.layer.shadowRadius = 5
       answerView.layer.borderWidth = 3
       answerView.layer.borderColor = UIColor.orange.cgColor
        
//        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector())
//        answerView.addGestureRecognizer(gestureRecognizer)
    }
}
