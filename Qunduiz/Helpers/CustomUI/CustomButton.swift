//
//  CustomButton.swift
//  Qunduiz
//
//  Created by Omer  on 3.04.2019.
//  Copyright © 2019 Omer Varoglu. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    func setup(){
       layer.cornerRadius = 7.5
       layer.shadowColor = UIColor.black.cgColor
       layer.shadowOffset = CGSize(width: 0, height: 1)
       layer.shadowOpacity = 0.3
       layer.shadowRadius = 5
       layer.borderWidth = 3
       layer.borderColor = UIColor.cyan.cgColor
    }
}
