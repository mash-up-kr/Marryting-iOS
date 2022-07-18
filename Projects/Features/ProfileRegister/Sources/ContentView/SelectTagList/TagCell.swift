//
//  TagCell.swift
//  ProfileRegister
//
//  Created by Yoojin Park on 2022/07/09.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit

// MARK: - Cell 설정
final class TagCell: UICollectionViewCell, UICollectionViewDelegateFlowLayout {
    var titleLabel = UILabel()
    
    var isClicked: Bool = false {
        didSet {
            backgroundColor = isClicked ? .red : .green
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func setData(_ tag: String) {
        titleLabel.text = tag
        titleLabel.sizeToFit()
    }
    
    private func configureUI() {
        isClicked = false
        
        addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -7),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 7)
        ])
    }
}
