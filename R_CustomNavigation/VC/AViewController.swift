//
//  SecondViewController.swift
//  R_CustomNavigation
//  
//  Created by m.ishiyama on 2023/09/01
//  
//

import UIKit

class AViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
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
        customNavigationBar.switchPrevButton(isOn: false)
        customNavigationBar.delegate = self
    }
}

extension AViewController: CustomNavigationBarDelegate {
    func humburgerButtonTapped() {
        UIView.animate(withDuration: 0.3) {
            self.containerViewLeadingConstraint.constant = self.containerViewLeadingConstraint.constant == 0 ? -CustomNavigationBar.SideMenuWidth : 0
            self.view.layoutIfNeeded()
        }
    }
}
