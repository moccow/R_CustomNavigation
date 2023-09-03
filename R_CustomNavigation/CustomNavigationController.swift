//
//  CustomNavigationController.swift
//  R_CustomNavigation
//  
//  Created by m.ishiyama on 2023/09/01
//  
//

import UIKit

class CustomNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        // カスタムナビゲーションバーを作成
        let customNavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 340))
        customNavigationBar.tintColor = .white // ナビゲーションバーのアイテムの色を設定
        customNavigationBar.barTintColor = .blue // ナビゲーションバーの背景色を設定
        
        // カスタムナビゲーションアイテムを作成
        let navigationItem = UINavigationItem(title: "")
        customNavigationBar.items = [navigationItem]
        
        // カスタムナビゲーションバーをビューに追加
        self.view.addSubview(customNavigationBar)
        
        // カスタムビューを作成してボタンを配置
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 340))
        
        let image1 = UIImage(named: "header-home")
        let image2 = UIImage(named: "header-ASR")
        
        let button1 = UIButton(type: .custom)
        button1.setImage(image1, for: .normal)
        button1.addTarget(self, action: #selector(button1Tapped), for: .touchUpInside)
        
        let button2 = UIButton(type: .custom)
        button2.setImage(image2, for: .normal)
        button2.addTarget(self, action: #selector(button2Tapped), for: .touchUpInside)

        customView.addSubview(button1)
        customView.addSubview(button2)
        
        button1.frame = CGRect(x: 0, y: 0, width: 50, height: 44)
        button2.frame = CGRect(x: 50, y: 0, width: 50, height: 44)

        
        self.view.addSubview(customView)
         */
    }
    
//    @objc func button1Tapped() {
//        // 左のボタンがタップされた時の処理
//    }
//    
//    @objc func button2Tapped() {
//        // 右のボタンがタップされた時の処理
//    }
}

