//
//  CardView.swift
//  Qunduiz
//
//  Created by Omer  on 3.04.2019.
//  Copyright © 2019 Omer Varoglu. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    func setup(){
       layer.borderColor = UIColor.cyan.cgColor
       layer.borderWidth = 3
       layer.cornerRadius = 7.5
       layer.shadowColor = UIColor.lightGray.cgColor
       layer.shadowOffset = CGSize(width: 0, height: 1)
       layer.shadowRadius = 12.0
    }
    
}
