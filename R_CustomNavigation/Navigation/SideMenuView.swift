//
//  SideMenuView.swift
//  R_CustomNavigation
//  
//  Created by m.ishiyama on 2023/09/06
//  
//

import UIKit

protocol SideMenuViewDelegate: AnyObject {
    func nextButtonTapped()
}
class SideMenuView: UIView {
    
    static let SideMenuWidth: CGFloat = 300.0

    weak var delegate: SideMenuViewDelegate?
        
    @IBOutlet var contentView: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        Bundle.main.loadNibNamed("SideMenuView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        delegate?.nextButtonTapped()
    }
}
