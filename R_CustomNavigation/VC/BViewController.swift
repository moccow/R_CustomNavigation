//
//  BViewController.swift
//  R_CustomNavigation
//  
//  Created by m.ishiyama on 2023/09/04
//  
//

import UIKit

class BViewController: UIViewController {
    
    var customNavigationBar: CustomNavigationBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // カスタムナビゲーションバーを作成
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            customNavigationBar = appDelegate.customNavigationBar
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        view.addSubview(customNavigationBar)
        customNavigationBar.setAutoLayout(view: self.view)
        customNavigationBar.navigationController = self.navigationController
        customNavigationBar.setCurrentVc(type: .b)
        customNavigationBar.isHidden = false
    }
}
