//
//  CustomNavigationBar.swift
//  R_CustomNavigation
//  
//  Created by m.ishiyama on 2023/09/04
//  
//

import UIKit

class CustomNavigationBar: UIView {
    
    enum VcType: Int {
        case top = 0
        case a = 1
        case b = 2
        
        var activeImage: UIImage {
            switch self {
            case .top:
                return UIImage(named: "header-home-active")!
            case .a:
                return UIImage(named: "header-a-active")!
            case .b:
                return UIImage(named: "header-b-active")!

            }
        }
        
        var inactiveImage: UIImage {
            switch self {
            case .top:
                return UIImage(named: "header-home-inactive")!
            case .a:
                return UIImage(named: "header-a-inactive")!
            case .b:
                return UIImage(named: "header-b-inactive")!

            }
        }
    }
    
    private var currentVC = CustomNavigationBar.VcType.top
    
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    
    var headerItems: [UIButton] = []
    
    @IBOutlet var contentView: UIView!
        
    static let barHeight: CGFloat = 80.0
    weak var navigationViewController: UINavigationController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        Bundle.main.loadNibNamed("CustomNavigationBar", owner: self, options: nil)
        addSubview(contentView)
                contentView.frame = self.bounds
                contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        headerItems = [homeButton, aButton, bButton]
                
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationViewController?.popViewController(animated: true)
    }
    @IBAction func homeButtonTapped(_ sender: UIButton) {
        navigationViewController?.popToRootViewController(animated: true)
    }
    @IBAction func aButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "a") as! AViewController
        navigationViewController?.pushViewController(vc, animated: true)
    }
    @IBAction func bButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "b") as! BViewController
        navigationViewController?.pushViewController(vc, animated: true)
    }
    
    func setCurrentVc(type: CustomNavigationBar.VcType) {
        switch type {
        case .top:
            homeButton.setImage(VcType.top.activeImage, for: .normal)
            aButton.setImage(VcType.a.inactiveImage, for: .normal)
            bButton.setImage(VcType.b.inactiveImage, for: .normal)
        case .a:
            homeButton.setImage(VcType.top.inactiveImage, for: .normal)
            aButton.setImage(VcType.a.activeImage, for: .normal)
            bButton.setImage(VcType.b.inactiveImage, for: .normal)
        case .b:
            homeButton.setImage(VcType.top.inactiveImage, for: .normal)
            aButton.setImage(VcType.a.inactiveImage, for: .normal)
            bButton.setImage(VcType.b.activeImage, for: .normal)
        }
        self.currentVC = type
        print("=========== \(self.currentVC)")
    }
}
