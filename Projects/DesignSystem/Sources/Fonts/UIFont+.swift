//
//  UIFont+.swift
//  DesignSystem
//
//  Created by Woody on 2022/07/12.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//
// https://github.com/mash-up-kr/GGiriGGiri_iOS/pull/33/files 참고링크

import UIKit

extension UIFont {

    public static func h1(name: Font.Name = .notosanskr) -> UIFont {
        switch name {
        case .notosanskr:
            return .notosanskr(weight: .bold, size: ._40)
        case .montserrat:
            return .montserrat(weight: .bold, size: ._40)
        }
    }

    public static func h2(name: Font.Name = .notosanskr) -> UIFont {
        switch name {
        case .notosanskr:
            return .notosanskr(weight: .bold, size: ._34)
        case .montserrat:
            return .montserrat(weight: .bold, size: ._34)
        }
    }

    public static func h3(name: Font.Name = .notosanskr) -> UIFont {
        switch name {
        case .notosanskr:
            return .notosanskr(weight: .bold, size: ._24)
        case .montserrat:
            return .montserrat(weight: .bold, size: ._24)
        }
    }

    public static func h4(name: Font.Name = .notosanskr) -> UIFont {
        switch name {
        case .notosanskr:
            return .notosanskr(weight: .bold, size: ._20)
        case .montserrat:
            return .montserrat(weight: .bold, size: ._20)
        }
    }

    public static func h5(name: Font.Name = .notosanskr) -> UIFont {
        switch name {
        case .notosanskr:
            return .notosanskr(weight: .bold, size: ._16)
        case .montserrat:
            return .montserrat(weight: .bold, size: ._16)
        }
    }

    public static func subtitle1(name: Font.Name = .notosanskr) -> UIFont {
        switch name {
        case .notosanskr:
            return .notosanskr(weight: .medium, size: ._20)
        case .montserrat:
            return .montserrat(weight: .medium, size: ._20)
        }
    }

    public static func subtitle2(name: Font.Name = .notosanskr) -> UIFont {
        switch name {
        case .notosanskr:
            return .notosanskr(weight: .medium, size: ._16)
        case .montserrat:
            return .montserrat(weight: .medium, size: ._16)
        }
    }

    public static func subtitle3(name: Font.Name = .notosanskr) -> UIFont {
        switch name {
        case .notosanskr:
            return .notosanskr(weight: .medium, size: ._14)
        case .montserrat:
            return .montserrat(weight: .medium, size: ._14)
        }
    }

    public static func body1(name: Font.Name = .notosanskr) -> UIFont {
        switch name {
        case .notosanskr:
            return .notosanskr(weight: .regular, size: ._16)
        case .montserrat:
            return .montserrat(weight: .regular, size: ._16)
        }
    }

    public static func body2(name: Font.Name = .notosanskr) -> UIFont {
        switch name {
        case .notosanskr:
            return .notosanskr(weight: .regular, size: ._14)
        case .montserrat:
            return .montserrat(weight: .regular, size: ._14)
        }
    }

    public static func body3(name: Font.Name = .notosanskr) -> UIFont {
        switch name {
        case .notosanskr:
            return .notosanskr(weight: .regular, size: ._12)
        case .montserrat:
            return .montserrat(weight: .regular, size: ._12)
        }
    }
}

extension UIFont {

    /// Noto Sans KR 폰트 적용
    /// - Parameters:
    ///  - weight: 등록할 폰트 weight
    ///  - ofSize: 등록할 폰트 크기
    private static func notosanskr(weight: Font.Weight, size: Font.Size) -> UIFont {
        let font = Font.MTFont(name: .notosanskr, weight: weight, extension_: .otf)
        return ._font(name: font.name, size: size.rawValue)
    }

    /// Montserrat 폰트 적용
    /// - Parameters:
    ///   - weight
    ///   - ofSize: 등록할 폰트 크기
    public static func montserrat(weight: Font.Weight, size: Font.Size) -> UIFont {
        let font = Font.MTFont(name: .montserrat, weight: weight, extension_: .ttf)
        return ._font(name: font.name, size: size.rawValue)
    }

    private static func _font(name: String, size: CGFloat) -> UIFont {
        guard let font = UIFont(name: name, size: size) else {
            return .systemFont(ofSize: size)
        }
        return font
    }
}
