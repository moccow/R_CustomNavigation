//
//  CustomNavigationBar.swift
//  R_CustomNavigation
//  
//  Created by m.ishiyama on 2023/09/04
//  
//

import UIKit

class CustomNavigationBar: UIView {
    
    enum VcType {
        case home
        case a
        case b
        case next

        var activeImage: UIImage? {
            switch self {
            case .home:
                return UIImage(named: "header-home-active")
            case .a:
                return UIImage(named: "header-a-active")
            case .b:
                return UIImage(named: "header-b-active")
            default:
                return nil
            }
        }
        
        var inactiveImage: UIImage? {
            switch self {
            case .home:
                return UIImage(named: "header-home-inactive")
            case .a:
                return UIImage(named: "header-a-inactive")
            case .b:
                return UIImage(named: "header-b-inactive")
            default:
                return nil
            }
        }
    }
    
    private var currentVC = CustomNavigationBar.VcType.home
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var prevButtonWidth: NSLayoutConstraint!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    
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
        switchPrevButton(isOn: false)
    }
    
    func switchPrevButton(isOn: Bool) {
        prevButton.isEnabled = isOn
//        UIView.animate(withDuration: 0.3) {
//            // prevButtonの幅を0に変更
//            self.prevButtonWidth.constant = isOn ? 85 : 0
//
//            // Auto Layoutの制約を更新
//            self.layoutIfNeeded()
//        }
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationViewController?.popViewController(animated: false)
    }
    @IBAction func homeButtonTapped(_ sender: UIButton) {
        switchPrevButton(isOn: false)
        guard currentVC != .home else { return }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "home") as! HomeViewController
        navigationViewController?.setViewControllers([vc], animated: false)
    }
    @IBAction func aButtonTapped(_ sender: Any) {
        switchPrevButton(isOn: false)
        guard currentVC != .a else { return }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "a") as! AViewController
        navigationViewController?.setViewControllers([vc], animated: false)
    }
    @IBAction func bButtonTapped(_ sender: UIButton) {
        switchPrevButton(isOn: false)
        guard currentVC != .b else { return }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "b") as! BViewController
        navigationViewController?.setViewControllers([vc], animated: false)
    }
    
    func setCurrentVc(type: CustomNavigationBar.VcType) {
        guard type == .home || type == .a || type == .b else {
            return
        }
        let buttonMappings: [CustomNavigationBar.VcType: UIButton] = [
            .home: homeButton,
            .a: aButton,
            .b: bButton
        ]
        
        for (vcType, button) in buttonMappings {
            let isActive = (vcType == type)
            let image = isActive ? vcType.activeImage : vcType.inactiveImage
            button.setImage(image, for: .normal)
        }
        self.currentVC = type
        print("=========== \(self.currentVC)")
    }
}
