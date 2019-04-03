//
//  PageViewController.swift
//  hyoi_MOC
//
//  Created by Sota Saito on 2019/03/28.
//  Copyright © 2019 unwithdrawal. All rights reserved.
//

import UIKit

struct PageSettings {
    static let pageControllerIdentifierList : [String] = [
        "VC-1",
        "VC-2",
        "VC-3",
        "VC-4"
    ]
    
    static func generateViewControllerList() -> [UIViewController] {
        var viewControllers : [UIViewController] = []
        self.pageControllerIdentifierList.forEach{ viewControllerName in
            let viewController = UIStoryboard(name: "Main", bundle: nil) . instantiateViewController(withIdentifier: "\(viewControllerName)")
            
            viewControllers.append(viewController)
        }
        return viewControllers
    }
}

class PageViewController: UIPageViewController {
    
    var viewControllerIndex : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.setViewControllers([PageSettings.generateViewControllerList().first!], direction: .forward, animated: true, completion: nil)
        self.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension PageViewController : UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let targetViewControllers : [UIViewController] = PageSettings.generateViewControllerList()
        
        if viewControllerIndex == targetViewControllers.count - 1 {
            return nil
        } else {
            viewControllerIndex = viewControllerIndex + 1
        }
        
        return targetViewControllers[viewControllerIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let targetViewControllers : [UIViewController] = PageSettings.generateViewControllerList()
        
        if viewControllerIndex == 0 {
            return nil
        } else {
            viewControllerIndex = viewControllerIndex - 1
        }
        
        return targetViewControllers[viewControllerIndex]
    }
    
}
