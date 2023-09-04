//
//  SecondViewController.swift
//  R_CustomNavigation
//  
//  Created by m.ishiyama on 2023/09/01
//  
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var customNavigationBar: CustomNavigationBar! {
        didSet {
            customNavigationBar.navigationViewController = self.navigationController
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // カスタムナビゲーションバーを作成
        
    }
}
