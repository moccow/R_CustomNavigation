//
//  SecondViewController.swift
//  R_CustomNavigation
//  
//  Created by m.ishiyama on 2023/09/01
//  
//

import UIKit

class AViewController: UIViewController {
    
    var customNavigationBar: CustomNavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            customNavigationBar = appDelegate.customNavigationBar
        }
        // MARK: 未使用
        // navigationController?.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        view.addSubview(customNavigationBar)
        customNavigationBar.setAutoLayout(view: self.view)
        customNavigationBar.navigationController = self.navigationController
        customNavigationBar.setCurrentVc(type: .a)
        customNavigationBar.isHidden = false
        customNavigationBar.delegate = self

    }
    
}

extension AViewController: CustomNavigationBarDelegate {
    func backButtonTapped() {
        transitionWithAnimation(escaping: {
            self.navigationController?.popViewController(animated: true)
        })
    }
    
    func aButtonTapped() {
        transitionWithAnimation(escaping: {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "a") as! AViewController
            self.navigationController?.pushViewController(vc, animated: true)
        })
    }
    
    func bButtonTapped() {
        transitionWithAnimation(escaping: {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "b") as! BViewController
            self.navigationController?.pushViewController(vc, animated: true)
        })
    }
}
    }
}
