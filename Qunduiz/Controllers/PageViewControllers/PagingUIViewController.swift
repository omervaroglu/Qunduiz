//
//  PagingUIViewController.swift
//  Qunduiz
//
//  Created by Ömer Varoğlu on 10.07.2019.
//  Copyright © 2019 Omer Varoglu. All rights reserved.
//

import UIKit

class PagingUIViewController: UIViewController {
    
    @IBOutlet weak var pagingImageView: UIImageView!
    @IBOutlet weak var pagingLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var chooseButton: CustomButton!
    
    var imageName : String?
    var viewName  : String?
    
    override func viewDidLoad() {
        pagingImageView.image = UIImage(named: imageName ?? "")
        pagingLabel.text = viewName ?? ""
    }
    
    @IBAction func chooseAction(_ sender: Any) {
        
    }
}

