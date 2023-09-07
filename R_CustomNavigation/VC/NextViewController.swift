//
//  NextViewController.swift
//  R_CustomNavigation
//  
//  Created by m.ishiyama on 2023/09/05
//  
//

import UIKit

class NextViewController: UIViewController {
    
    var customNavigationBar: CustomNavigationBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            customNavigationBar = appDelegate.customNavigationBar
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customNavigationBar.setCurrentVc(type: .next)

        view.addSubview(customNavigationBar)
        customNavigationBar.setAutoLayout(view: self.view)
        customNavigationBar.navigationController = self.navigationController
    }
}
