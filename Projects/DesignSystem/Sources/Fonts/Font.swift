//
//  Font.swift
//  DesignSystem
//
//  Created by Woody on 2022/07/12.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//
// https://github.com/mash-up-kr/GGiriGGiri_iOS/pull/33/files 참고링크

import UIKit

public enum Font {
    public enum Name: String {
        case notosanskr = "NotoSansKR"
        case montserrat = "Montserrat"
    }

    public enum Weight: String {
        case bold = "Bold"
        case medium = "Medium"
        case regular = "Regular"
    }

    public enum Size: CGFloat {
        case _12 = 12
        case _14 = 14
        case _16 = 16
        case _20 = 20
        case _24 = 24
        case _34 = 34
        case _40 = 40
    }

    internal enum Extension: String {
        case otf
        case ttf
    }

    public struct MTFont {
        private let _name: Name
        private let _weight: Weight
        private let _extension: Extension

        init(name: Name, weight: Weight, extension_: Extension) {
            self._name = name
            self._weight = weight
            self._extension = extension_
        }

        var name: String {
            "\(_name.rawValue)-\(_weight.rawValue)"
        }

        var `extension`: String {
            _extension.rawValue
        }
    }

    /// 모든 폰트 파일 등록
    /// - 앱 초기에 최초 한 번 실행
    public static func registerFonts() {
        fonts.forEach {
            Font.registerFont(fontName: $0.name, fontExtension: $0.extension)
        }
    }
}

extension Font {

    public static var fonts: [MTFont] {
        [MTFont(name: .notosanskr, weight: .regular, extension_: .otf),
         MTFont(name: .notosanskr, weight: .medium, extension_: .otf),
         MTFont(name: .notosanskr, weight: .bold, extension_: .otf),
         MTFont(name: .montserrat, weight: .regular, extension_: .ttf),
         MTFont(name: .montserrat, weight: .medium, extension_: .ttf),
         MTFont(name: .montserrat, weight: .bold, extension_: .ttf)
        ]
    }

    /// 폰트 파일 등록
    /// - Parameters:
    ///   - bundle: 등록할 폰트 파일이 존재하는 Bundle
    ///   - fontName: 등록할 폰트 파일의 이름
    ///   - fontExtension: 등록할 폰트 파일의 확장자
    private static func registerFont(fontName: String, fontExtension: String) {
        guard let fontURL = Bundle(identifier: "kr.mash-up.DesignSystem")?.url(forResource: fontName, withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
            debugPrint("Couldn't create font from filename: \(fontName) with extension \(fontExtension)")
            return
        }

        var error: Unmanaged<CFError>?
        CTFontManagerRegisterGraphicsFont(font, &error)
    }
}
