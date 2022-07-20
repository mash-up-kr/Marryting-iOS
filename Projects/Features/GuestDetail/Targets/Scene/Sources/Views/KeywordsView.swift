//
//  KeywordsView.swift
//  GuestDetailScene
//
//  Created by Woody on 2022/07/21.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import DesignSystem
import LeftAlignmentLayout
import UIKit

import SnapKit

struct KeywordsViewModel: ContainViewModel {
    var keywords: [KeywordCellViewModel]
}

final class KeywordsView: UIView, IntroductionContainerViewProtocol {

    private lazy var collectionView: UICollectionView = {
        // TODO: 왼쪽 정렬
        let layout = LeftAlignedCollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 4
        layout.estimatedItemSize = .init(width: 90, height: 40)
        let v = UICollectionView(frame: .zero, collectionViewLayout: layout)
        v.dataSource = self
        v.delegate = self
        v.backgroundColor = .clear
        v.register(KeywordCollectionViewCell.self)
        v.showsHorizontalScrollIndicator = false
        v.showsVerticalScrollIndicator = false
        return v
    }()
    private let colors: [UIColor?] = [
        Pallete.Light.main300.color,
        Pallete.Light.subPurple.color,
        Pallete.Light.subYellow.color,
        Pallete.Light.subBlue.color,
        Pallete.Light.subGreen.color
    ]

    var viewModel: ContainViewModel? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.collectionView.reloadData()
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
    }

    private func setUI() {
        self.addSubview(self.collectionView)

        self.collectionView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
            make.height.equalTo(88)
        }
    }
}

extension KeywordsView: UICollectionViewDataSource {

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        guard let viewModel = viewModel as? KeywordsViewModel else { return 0 }
        return viewModel.keywords.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(KeywordCollectionViewCell.self, for: indexPath)
        guard let viewModel = viewModel as? KeywordsViewModel else { return .init() }
        cell.viewModel = viewModel.keywords[indexPath.item]
        cell.contentView.backgroundColor = colors[indexPath.item]
        return cell
    }
}


extension KeywordsView: UICollectionViewDelegateFlowLayout {

}
