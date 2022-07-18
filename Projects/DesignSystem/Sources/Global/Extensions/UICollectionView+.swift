//
//  UICollectionView+.swift
//  DesignSystem
//
//  Created by Woody on 2022/07/18.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit

public extension UICollectionView {

    func register<Cell: UICollectionViewCell>(_ cellType: Cell.Type) {
        let identifier = String(describing: cellType)
        self.register(cellType, forCellWithReuseIdentifier: identifier)
    }

    func dequeueReusableCell<Cell: UICollectionViewCell>(_ cellType: Cell.Type, for indexPath: IndexPath) -> Cell {
        let identifier = String(describing: cellType)
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? Cell else {
            fatalError()
        }
        return cell
    }
}
