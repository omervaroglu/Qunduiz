//
//  QuestionCell.swift
//  Qunduiz
//
//  Created by Omer  on 3.04.2019.
//  Copyright © 2019 Omer Varoglu. All rights reserved.
//

import UIKit

class QuestionCell: UITableViewCell {
    @IBOutlet weak var questionView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    
    override func awakeFromNib() {
        questionView.layer.cornerRadius = 10.0
        questionView.layer.shadowColor = UIColor.black.cgColor
        questionView.layer.shadowOffset = CGSize(width: 0, height: 1)
        questionView.layer.shadowOpacity = 0.2
        questionView.layer.shadowRadius = 5
        questionView.layer.borderWidth = 3
        questionView.layer.borderColor = UIColor.cyan.cgColor
    }
}
