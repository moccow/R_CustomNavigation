//
//  CustomViewController.swift
//  R_CustomNavigation
//  
//  Created by m.ishiyama on 2023/09/01
//  
//

import UIKit

class TopViewController: UIViewController {
    
    @IBOutlet weak var customNavigationBar: CustomNavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customNavigationBar.navigationViewController = self.navigationController
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customNavigationBar.setCurrentVc(type: .top)
    }

    @IBAction func secondButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "a") as! AViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}
