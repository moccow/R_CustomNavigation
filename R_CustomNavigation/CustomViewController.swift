//
//  CustomViewController.swift
//  R_CustomNavigation
//  
//  Created by m.ishiyama on 2023/09/01
//  
//

import UIKit

class CustomNavigationBar: UIView {
    
    static let barHeight: CGFloat = 85.0
    // カスタムナビゲーションバーの要素を配置する
    // 画像ボタンやその他のコントロールをここに配置
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "header-home"), for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // 別の画像ボタンや要素を追加可能
    
    weak var navigationViewController: UINavigationController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(backButton)
        
        self.backgroundColor = .cyan
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 106),
            backButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            backButton.widthAnchor.constraint(equalToConstant: 80),
            backButton.heightAnchor.constraint(equalToConstant: frame.size.height)
        ])
    }
    
    @objc private func backButtonTapped() {
        navigationViewController?.popViewController(animated: true)
    }
}

class CustomViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // カスタムナビゲーションバーを作成
        let customNavigationBar = CustomNavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: CustomNavigationBar.barHeight))
        customNavigationBar.navigationViewController = self.navigationController
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        // カスタムナビゲーションバーとコンテンツビューを配置
        view.addSubview(customNavigationBar)
        
        // Auto Layout制約を設定して配置を調整
        customNavigationBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            customNavigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            customNavigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customNavigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customNavigationBar.heightAnchor.constraint(equalToConstant: CustomNavigationBar.barHeight),
        ])
    }
    
    @IBAction func secondButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "second") as! SecondViewController
        print("=========== \(navigationController)")
        navigationController?.pushViewController(vc, animated: true)
    }
}
