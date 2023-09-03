//
//  SecondViewController.swift
//  R_CustomNavigation
//  
//  Created by m.ishiyama on 2023/09/01
//  
//

import UIKit

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // カスタムナビゲーションバーを作成
        let customNavigationBar = CustomNavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 80))
        customNavigationBar.navigationViewController = self.navigationController
        
        
        // カスタムナビゲーションバーとコンテンツビューを配置
        view.addSubview(customNavigationBar)
        
        // Auto Layout制約を設定して配置を調整
        customNavigationBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            customNavigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            customNavigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customNavigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customNavigationBar.heightAnchor.constraint(equalToConstant: 80),
        ])
    }
}
