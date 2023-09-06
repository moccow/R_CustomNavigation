//
//  CustomViewController.swift
//  R_CustomNavigation
//  
//  Created by m.ishiyama on 2023/09/01
//  
//

import UIKit

class HomeViewController: UIViewController {
    
    var customNavigationBar: CustomNavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            customNavigationBar = appDelegate.customNavigationBar
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        view.addSubview(customNavigationBar)
        customNavigationBar.setAutoLayout(view: self.view)
        customNavigationBar.navigationController = self.navigationController
        customNavigationBar.setCurrentVc(type: .home)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    @IBAction func secondButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "next") as! NextViewController
        navigationController?.pushViewController(vc, animated: false)
    }
}
