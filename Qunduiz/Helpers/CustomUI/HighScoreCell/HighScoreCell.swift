//
//  HighScoreCell.swift
//  Qunduiz
//
//  Created by Omer  on 8.04.2019.
//  Copyright © 2019 Omer Varoglu. All rights reserved.
//

import UIKit

class HighScoreCell: UITableViewCell {
    @IBOutlet weak var highScoreView: UIView!
    @IBOutlet weak var scoreNameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func awakeFromNib() {
        highScoreView.layer.cornerRadius = 10.0
        highScoreView.layer.shadowColor = UIColor.black.cgColor
        highScoreView.layer.shadowOffset = CGSize(width: 0, height: 1)
        highScoreView.layer.shadowOpacity = 0.2
        highScoreView.layer.shadowRadius = 5
        highScoreView.layer.borderWidth = 3
        highScoreView.layer.borderColor = UIColor.cyan.cgColor
    }
}
