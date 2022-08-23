//
//  RegisterProfileImageView.swift
//  ProfileRegister
//
//  Created by Yoojin Park on 2022/07/24.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit
import DesignSystem
import SnapKit

protocol RegisterProfileImageViewDelegate: AnyObject {
    func tapRegisterimageButton(_ sender: UIButton)
}
final class RegisterProfileImageView: UIView {
    weak var delegate: RegisterProfileImageViewDelegate?
    
    let maximumNumberOfImages = 5
    var images: [UIImage] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    let itemSize: CGSize = {
        let width = UIScreen.main.bounds.width - 80
        return CGSize(width: width, height: (width * 4 / 3) + 56)
    }()
    
    let itemSpacing = 16.0
    
    var insetX: CGFloat {
        (UIScreen.main.bounds.width - itemSize.width) / 2.0
    }
    var collectionViewContentInset: UIEdgeInsets {
        UIEdgeInsets(top: 0, left: insetX, bottom: 0, right: insetX)
    }
    
    // MARK: UI Properties
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = itemSize
        layout.minimumLineSpacing = itemSpacing
        layout.minimumInteritemSpacing = 0
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.isScrollEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = true
        view.backgroundColor = .clear
        view.clipsToBounds = true
        view.register(RegisterProfileImageCell.self, forCellWithReuseIdentifier: RegisterProfileImageCell.id)
        view.isPagingEnabled = false // 한 페이지의 넓이를 조절 할 수 없기 때문에 scrollViewWillEndDragging을 사용하여 구현
        view.contentInsetAdjustmentBehavior = .never // 내부적으로 safe area에 의해 가려지는 것을 방지하기 위해서 자동으로 inset조정해 주는 것을 비활성화
        view.contentInset = collectionViewContentInset
        view.decelerationRate = .fast // 스크롤이 빠르게 되도록 (페이징 애니메이션같이 보이게하기 위함)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    func configureUI() {
        
        self.addSubview(self.collectionView)
        collectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(itemSize.height)
            make.top.equalToSuperview()
        }
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
}

extension RegisterProfileImageView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count + 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RegisterProfileImageCell.id, for: indexPath) as? RegisterProfileImageCell else { return UICollectionViewCell()
        }
        cell.delegate = self
        if images.count > indexPath.row {
            cell.setImage(image: images[indexPath.row])
        } else {
            cell.setImage(image: nil)
        }
        return cell
    }
}

extension RegisterProfileImageView: UICollectionViewDelegateFlowLayout {
    func scrollViewWillEndDragging(
        _ scrollView: UIScrollView,
        withVelocity velocity: CGPoint,
        targetContentOffset: UnsafeMutablePointer<CGPoint>
    ) {
        let scrolledOffsetX = targetContentOffset.pointee.x + scrollView.contentInset.left
        let cellWidth = itemSize.width + itemSpacing
        let index = round(scrolledOffsetX / cellWidth)
        targetContentOffset.pointee = CGPoint(x: index * cellWidth - scrollView.contentInset.left, y: scrollView.contentInset.top)
    }
}

extension RegisterProfileImageView: RegisterProfileImageCellDelegate {
    func tapRegisterimageButton(_ sender: UIButton) {
        delegate?.tapRegisterimageButton(sender)
    }
    
    func deleteImage(for image: UIImage) {
        images = images.filter { $0 != image }
    }
}
