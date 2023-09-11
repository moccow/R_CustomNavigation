//
//  BViewController.swift
//  R_CustomNavigation
//  
//  Created by m.ishiyama on 2023/09/04
//  
//

import UIKit

class BViewController: UIViewController {
    
    
    // サイドバー表示で画面全体を移動するための入れ物
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var containerViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerViewLeadingConstraint: NSLayoutConstraint!
    
    var customNavigationBar: CustomNavigationBar!
    var sideMenuView: SideMenuView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // カスタムナビゲーションバーを作成
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            customNavigationBar = appDelegate.customNavigationBar
            sideMenuView = appDelegate.sideMenuView
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        containerView.addSubview(customNavigationBar)
        customNavigationBar.setAutoLayout(view: containerView)
        customNavigationBar.navigationController = self.navigationController
        customNavigationBar.setCurrentVc(type: .b)
        customNavigationBar.isHidden = false
        customNavigationBar.delegate = self
        // MARK: デバイス幅+サイドバー幅
        containerViewWidthConstraint.constant = UIScreen.main.bounds.size.width + SideMenuView.SideMenuWidth

        containerView.addSubview(sideMenuView)
        sideMenuView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sideMenuView.topAnchor.constraint(equalTo: containerView.topAnchor),
            sideMenuView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            sideMenuView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
            sideMenuView.widthAnchor.constraint(equalToConstant: SideMenuView.SideMenuWidth)
        ])
        sideMenuView.delegate = self
        
        containerViewLeadingConstraint.constant = 0
        self.view.layoutIfNeeded()
    }
    
}

extension BViewController: CustomNavigationBarDelegate {
    func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func homeButtonTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "home") as! HomeViewController
        navigationController?.setViewControllers([vc], animated: false)
    }
    
    func aButtonTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "a") as! AViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func bButtonTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "b") as! BViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func humburgerButtonTapped() {
        UIView.animate(withDuration: 0.3) {
            self.containerViewLeadingConstraint.constant = self.containerViewLeadingConstraint.constant == 0 ? -SideMenuView.SideMenuWidth : 0
            self.view.layoutIfNeeded()
        }
    }
}

extension BViewController: SideMenuViewDelegate {
    func nextButtonTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "next") as! NextViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
