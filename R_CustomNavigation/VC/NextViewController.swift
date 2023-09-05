//
//  NextViewController.swift
//  R_CustomNavigation
//  
//  Created by m.ishiyama on 2023/09/05
//  
//

import UIKit

class NextViewController: UIViewController {
    
    @IBOutlet weak var customNavigationBar: CustomNavigationBar! {
        didSet {
            customNavigationBar.navigationController = self.navigationController
            customNavigationBar.switchPrevButton(isOn: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // カスタムナビゲーションバーを作成
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customNavigationBar.setCurrentVc(type: .next)
    }
}
