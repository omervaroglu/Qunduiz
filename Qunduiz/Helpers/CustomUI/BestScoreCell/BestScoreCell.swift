//
//  BestScoreCell.swift
//  Qunduiz
//
//  Created by Ömer Varoğlu on 12.06.2019.
//  Copyright © 2019 Omer Varoglu. All rights reserved.
//

import UIKit

class BestScoreCell: UITableViewCell {
    @IBOutlet weak var bestScoreView: UIView!
    
    @IBOutlet weak var bestScoreNameLabel: UILabel!
    @IBOutlet weak var bestScoreScoreCell: UILabel!
    
    override func awakeFromNib() {
       bestScoreView.layer.cornerRadius = 10.0
       bestScoreView.layer.shadowColor = UIColor.black.cgColor
       bestScoreView.layer.shadowOffset = CGSize(width: 0, height: 1)
       bestScoreView.layer.shadowOpacity = 0.2
       bestScoreView.layer.shadowRadius = 5
       bestScoreView.layer.borderWidth = 3
       bestScoreView.layer.borderColor = UIColor.cyan.cgColor
    }
}
