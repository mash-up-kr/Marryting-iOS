//
//  Colors+.swift
//  DesignSystem
//
//  Created by Woody on 2022/07/02.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit

public enum Pallete {
    
    public enum Dark: String {
        
        // MARK: Dark Background Color
        
        case background = "Background_dark"
        case black = "Black"
        case white = "White"
        
        // MARK: Dark Brand Colors
        
        case errorRed = "Error_Red_dark"
        case main100 = "Main_100"
        case main200 = "Main_200"
        case main300 = "Main_300"
        case subBlue = "Sub_Blue_dark"
        case subGreen = "Sub_Green_dark"
        case subPurple = "Sub_Purple_dark"
        case subYellow = "Sub_Yellow_dark"
        
        // MARK: Dark Greyscale Colors
        case grey100 = "Grey_100_dark"
        case grey200 = "Grey_200_dark"
        case grey300 = "Grey_300_dark"
        case grey400 = "Grey_400_dark"
        case grey500 = "Grey_500_dark"
        case grey600 = "Grey_600_dark"
        case grey700 = "Grey_700_dark"
        case grey800 = "Grey_800_dark"
        
        public var color: UIColor? {
            let bundle = Bundle(identifier: "kr.mash-up.DesignSystem")
            return .init(named: self.rawValue, in: bundle, compatibleWith: nil)
        }
    }
    
    public enum Light: String {
        
        // MARK: Light Background Color
        
        case background = "Background_light"
        case black = "Black"
        case white = "White"
        
        // MARK: Light Brand Colors
        
        case errorRed = "Error_Red_light"
        case main100 = "Main_100"
        case main200 = "Main_200"
        case main300 = "Main_300"
        case subBlue = "Sub_Blue_light"
        case subGreen = "Sub_Green_light"
        case subPurple = "Sub_Purple_light"
        case subYellow = "Sub_Yellow_light"
        
        // MARK: Light Greyscale Colors
        
        case grey100 = "Grey_100_light"
        case grey200 = "Grey_200_light"
        case grey300 = "Grey_300_light"
        case grey400 = "Grey_400_light"
        case grey500 = "Grey_500_light"
        case grey600 = "Grey_600_light"
        case grey700 = "Grey_700_light"
        case grey800 = "Grey_800_light"
        
        public var color: UIColor? {
            let bundle = Bundle(identifier: "kr.mash-up.DesignSystem")
            return .init(named: self.rawValue, in: bundle, compatibleWith: nil)
        }
    }
}
