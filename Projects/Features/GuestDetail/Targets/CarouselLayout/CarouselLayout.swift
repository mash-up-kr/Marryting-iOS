//
//  CarouselLayout.swift
//  GuestListScene
//
//  Created by Woody on 2022/07/20.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//
// 출처: https://lsh424.tistory.com/54

import UIKit

public class CarouselLayout: UICollectionViewFlowLayout {

    public var sideItemScale: CGFloat = 0.5
    public var sideItemAlpha: CGFloat = 0.5
    public var spacing: CGFloat = 10

    public var isPagingEnabled: Bool = false

    private var isSetup: Bool = false

    override public func prepare() {
        super.prepare()
        if isSetup == false {
            setupLayout()
            isSetup = true
        }
    }

    private func setupLayout() {
        guard let collectionView = self.collectionView else {return}

        let collectionViewSize = collectionView.bounds.size

        let xInset = (collectionViewSize.width - self.itemSize.width) / 2
        let yInset = (collectionViewSize.height - self.itemSize.height) / 2

        self.sectionInset = UIEdgeInsets(top: yInset, left: xInset, bottom: yInset, right: xInset)

        let itemWidth = self.itemSize.width

        let scaledItemOffset =  (itemWidth - itemWidth*self.sideItemScale) / 2
        self.minimumLineSpacing = spacing - scaledItemOffset

        self.scrollDirection = .horizontal
    }

    public override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }

    public override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let superAttributes = super.layoutAttributesForElements(in: rect),
            let attributes = NSArray(array: superAttributes, copyItems: true) as? [UICollectionViewLayoutAttributes]
            else { return nil }

        return attributes.map({ self.transformLayoutAttributes(attributes: $0) })
    }

    private func transformLayoutAttributes(attributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {

        guard let collectionView = self.collectionView else {return attributes}

        let collectionCenter = collectionView.frame.size.width / 2
        let contentOffset = collectionView.contentOffset.x
        let center = attributes.center.x - contentOffset

        let maxDistance = self.itemSize.width + self.minimumLineSpacing
        let distance = min(abs(collectionCenter - center), maxDistance)

        let ratio = (maxDistance - distance)/maxDistance

        let alpha = ratio * (1 - self.sideItemAlpha) + self.sideItemAlpha
        let scale = ratio * (1 - self.sideItemScale) + self.sideItemScale

        attributes.alpha = alpha

        let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
        let dist = attributes.frame.midX - visibleRect.midX
        var transform = CATransform3DScale(CATransform3DIdentity, scale, scale, 1)
        transform = CATransform3DTranslate(transform, 0, 0, -abs(dist/1000))
        attributes.transform3D = transform

        return attributes
    }
}
