//
//  SecondViewController.swift
//  R_CustomNavigation
//  
//  Created by m.ishiyama on 2023/09/01
//  
//

import UIKit

class AViewController: UIViewController {
    
    // サイドバー表示で画面全体を移動するための入れ物
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var containerViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerViewLeadingConstraint: NSLayoutConstraint!
    var customNavigationBar: CustomNavigationBar!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            customNavigationBar = appDelegate.customNavigationBar
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        containerView.addSubview(customNavigationBar)
        customNavigationBar.setAutoLayout(view: containerView)
        customNavigationBar.navigationController = self.navigationController
        customNavigationBar.setCurrentVc(type: .a)
        customNavigationBar.isHidden = false
        customNavigationBar.delegate = self
        // MARK: storyboardでデバイス幅を指定できなかったのでここで設定
        containerViewWidthConstraint.constant = UIScreen.main.bounds.size.width
    }
}

extension AViewController: CustomNavigationBarDelegate {
    func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
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
            self.containerViewLeadingConstraint.constant = self.containerViewLeadingConstraint.constant == 0 ? -CustomNavigationBar.SideMenuWidth : 0
            self.view.layoutIfNeeded()
        }
    }
}
