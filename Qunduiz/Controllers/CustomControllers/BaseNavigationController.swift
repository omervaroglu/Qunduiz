//
//  BaseNavigationController.swift
//  knight-commerce-ios
//
//  Created by Kasım on 29.12.2018.
//  Copyright © 2018 Kasım. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        navigationBar.tintColor = UIColor.white

        //navigationItem.backBarButtonItem = UIBarButtonItem(title: "Geri", style: .plain, target: nil, action: nil)

        navigationBar.tintColor = UIColor(hex: "#FFFFFF")
        let backButton = UIBarButtonItem()
        backButton.title = "Geri"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton

    }
}
