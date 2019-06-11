//
//  ResultCell.swift
//  Qunduiz
//
//  Created by Ömer Varoğlu on 11.06.2019.
//  Copyright © 2019 Omer Varoglu. All rights reserved.
//

import UIKit

class ResultCell: UITableViewCell {
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var yourAnswerLabel: UILabel!
    @IBOutlet weak var trueAnswerLabel: UILabel!
    
    override func awakeFromNib() {
       resultView.layer.cornerRadius = 10.0
       resultView.layer.shadowColor = UIColor.black.cgColor
       resultView.layer.shadowOffset = CGSize(width: 0, height: 1)
       resultView.layer.shadowOpacity = 0.2
       resultView.layer.shadowRadius = 5
       resultView.layer.borderWidth = 3
       resultView.layer.borderColor = UIColor.cyan.cgColor
    }
    
}
