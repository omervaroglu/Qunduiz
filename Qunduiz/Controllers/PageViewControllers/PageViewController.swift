//
//  PageViewController.swift
//  Qunduiz
//
//  Created by Ömer Varoğlu on 9.07.2019.
//  Copyright © 2019 Omer Varoglu. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate {

    //let pageControl = UIPageControl()
    //let imageNames = ["pagingView", "listView", "lineSelected"]
    fileprivate lazy var pages: [UIViewController] = {
        return [
            self.getViewController(withIdentifier: "pagingView", 0, "pagingView", "Sayfa Gorunumu"),
            self.getViewController(withIdentifier: "listView", 1, "listView", "Liste Gorunumu"),
            self.getViewController(withIdentifier: "lineSelected", 2, "lineSelected", "Sirali Gorunum")
        ]
    }()
    
    override func viewDidLoad() {
        self.dataSource = self
        self.delegate = self
        
        if let firstVC = pages.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    fileprivate func getViewController(withIdentifier identifier: String, _ id: Int, _ imagaName: String, _ viewName: String) -> UIViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PagingUIViewController") as! PagingUIViewController
        vc.imageName = imagaName
        vc.viewName = viewName
        return vc
    }
}

extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = pages.index(of: viewController) else { return nil }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0          else { return pages.last }
        
        guard pages.count > previousIndex else { return nil        }
        
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        guard let viewControllerIndex = pages.index(of: viewController) else { return nil }
        
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex < pages.count else { return pages.first }
        
        guard pages.count > nextIndex else { return nil         }
        
        return pages[nextIndex]
    }
}
