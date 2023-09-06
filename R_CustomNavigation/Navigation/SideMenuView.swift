//
//  SideMenuView.swift
//  R_CustomNavigation
//  
//  Created by m.ishiyama on 2023/09/06
//  
//

import UIKit

class SideMenuView: UIView {
        
    @IBOutlet var contentView: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        setupUI()
        
        Bundle.main.loadNibNamed("SideMenuView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        setupUI()
    }
}
