//
//  GuestCardView.swift
//  GuestList
//
//  Created by Gunoo on 2022/07/09.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit
//import DesignSystem

final class GuestCardView: UIView {
    
    lazy var profileImageView: UIImageView = {
        let v = UIImageView()
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = bounds
        layer.addSublayer(gradient)
        
        layer.cornerRadius = 16

        return v
    }()
    
    lazy var nameLabel: UILabel = {
        let v = UILabel()
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    func setup() {
        
        // Corner Radius
        layer.cornerRadius = 16
        
        addSubview(profileImageView)
        
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            profileImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            profileImageView.heightAnchor.constraint(equalToConstant: 374)
        ])
    }
}
