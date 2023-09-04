//
//  CustomNavigationBar.swift
//  R_CustomNavigation
//  
//  Created by m.ishiyama on 2023/09/04
//  
//

import UIKit

class CustomNavigationBar: UIView {
    
    @IBOutlet var contentView: UIView!
        
    static let barHeight: CGFloat = 85.0
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
                
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationViewController?.popViewController(animated: true)
    }
}
