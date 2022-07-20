//
//  CarouselLayout.swift
//  GuestListScene
//
//  Created by Woody on 2022/07/20.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//
// 출처: https://dongminyoon.tistory.com/30

import UIKit

public protocol HorizontalCarouselLayoutDelegate: AnyObject {
    func collectionView(_ collectionView: UICollectionView) -> CGSize
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout) -> CGFloat
}

public class HorizontalCarouselLayout: UICollectionViewFlowLayout {

    private var isInit: Bool = false

    public weak var delegate: HorizontalCarouselLayoutDelegate?

    public override func prepare() {
        super.prepare()
        guard !isInit else { return }
        guard let collectionView = self.collectionView else { return }

        self.scrollDirection = .horizontal
        self.itemSize = delegate?.collectionView(collectionView) ?? .zero
        self.minimumLineSpacing = delegate?.collectionView(collectionView, layout: self) ?? 0

        self.isInit = true
    }
    public override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }

    public override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let superAttributes = super.layoutAttributesForElements(in: rect)

        superAttributes?.forEach { attributes in
            guard let collectionView = self.collectionView else { return }

            let collectionViewCenter = collectionView.frame.size.width / 2
            let offsetX = collectionView.contentOffset.x
            let center = attributes.center.x - offsetX

            let maxDis = self.itemSize.width + self.minimumLineSpacing
            let dis = min(abs(collectionViewCenter-center), maxDis)

            let ratio = (maxDis - dis)/maxDis
            let scale = ratio * (1-0.7) + 0.7

            attributes.transform = CGAffineTransform(scaleX: scale, y: scale)
        }

        return superAttributes
    }
}
