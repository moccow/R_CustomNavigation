//
//  CustomViewController.swift
//  R_CustomNavigation
//  
//  Created by m.ishiyama on 2023/09/01
//  
//

import UIKit

class CustomViewController: UIViewController {
    
    @IBOutlet weak var customNavigationBar: CustomNavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customNavigationBar.navigationViewController = self.navigationController
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
    @IBAction func secondButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "second") as! SecondViewController
        print("=========== \(navigationController)")
        navigationController?.pushViewController(vc, animated: true)
    }
}
