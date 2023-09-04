//
//  BViewController.swift
//  R_CustomNavigation
//  
//  Created by m.ishiyama on 2023/09/04
//  
//

import UIKit

class BViewController: UIViewController {
    
    @IBOutlet weak var customNavigationBar: CustomNavigationBar! {
        didSet {
            customNavigationBar.navigationViewController = self.navigationController
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // カスタムナビゲーションバーを作成
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customNavigationBar.setCurrentVc(type: .b)
    }
}

