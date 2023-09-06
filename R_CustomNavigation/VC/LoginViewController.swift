//
//  LoginViewController.swift
//  R_CustomNavigation
//  
//  Created by m.ishiyama on 2023/09/06
//  
//

import UIKit

class LoginViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "home") as! HomeViewController
        let customNavigationController = CustomNavigationController(rootViewController: vc)

        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            // 新しいビューコントローラをウィンドウのrootViewControllerに設定
            sceneDelegate.window?.rootViewController = customNavigationController
        }

    }
}
