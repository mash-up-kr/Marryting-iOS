//
//  LoadingIndicator.swift
//  Network
//
//  Created by 박건우 on 2022/08/25.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit
import Lottie
import SnapKit

public final class LoadingActor {
    
    var indicator: LoadingIndicator?
    
    public init() {}
    
    public func start() {
        DispatchQueue.main.async {
            guard let rootView = UIApplication.shared.windows.first?.rootViewController?.view else {
                return
            }
            let indicator = LoadingIndicator(frame: rootView.frame)
            rootView.addSubview(indicator)
            self.indicator = indicator
        }
    }
    
    public func stop() {
        DispatchQueue.main.async {
            self.indicator?.removeFromSuperview()
        }
    }
}

final class LoadingIndicator: UIView {
    
    lazy var animationView: AnimationView = {
        let v = AnimationView(name: "loading", bundle: .module)
        v.play()
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(animationView)
        
        animationView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalTo(200)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
