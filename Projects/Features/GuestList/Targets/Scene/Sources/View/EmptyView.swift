//
//  EmptyView.swift
//  GuestListScene
//
//  Created by Woody on 2022/08/26.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import DesignSystem
import UIKit

final class EmptyView: UIView {
    lazy var imageView: UIImageView = {
        let v = UIImageView(asset: .ic_guest_list_empty_view)
        return v
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
    }

    private func setUI() {
        self.addSubview(self.imageView)

        self.imageView.snp.makeConstraints { make in
            make.center.equalToSuperview().inset(80)
            make.width.equalTo(296)
            make.height.equalTo(237)
        }
    }
}
