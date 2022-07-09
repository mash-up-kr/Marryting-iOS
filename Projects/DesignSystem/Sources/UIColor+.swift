//
//  Colors+.swift
//  DesignSystem
//
//  Created by Woody on 2022/07/02.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit

public extension UIColor {
   
    enum Dark {
        
        // MARK: Dark Background Color
        
        static let background: UIColor  = .init(named: "Background_dark")!
        
        // MARK: Dark Brand Colors
        
        static let errorRed: UIColor    = .init(named: "Error_Red_dark")!
        static let subBlue: UIColor     = .init(named: "Sub_Blue_dark")!
        static let subGreen: UIColor    = .init(named: "Sub_Green_dark")!
        static let subPurple: UIColor   = .init(named: "Sub_Purple_dark")!
        static let subYellow: UIColor   = .init(named: "Sub_Yellow_dark")!

        // MARK: Dark Greyscale Colors
        
        static let grey100: UIColor  = .init(named: "Grey_100_dark")!
        static let grey200: UIColor  = .init(named: "Grey_200_dark")!
        static let grey300: UIColor  = .init(named: "Grey_300_dark")!
        static let grey400: UIColor  = .init(named: "Grey_400_dark")!
        static let grey500: UIColor  = .init(named: "Grey_500_dark")!
        static let grey600: UIColor  = .init(named: "Grey_600_dark")!
        static let grey700: UIColor  = .init(named: "Grey_700_dark")!
        static let grey800: UIColor  = .init(named: "Grey_800_dark")!
    }
    
    enum Light {
        
        // MARK: Light Background Color
        
        static let background: UIColor  = .init(named: "Background_light")!
        
        // MARK: Light Brand Colors
        
        static let errorRed: UIColor    = .init(named: "Error_Red_light")!
        static let subBlue: UIColor     = .init(named: "Sub_Blue_light")!
        static let subGreen: UIColor    = .init(named: "Sub_Green_light")!
        static let subPurple: UIColor   = .init(named: "Sub_Purple_light")!
        static let subYellow: UIColor   = .init(named: "Sub_Yellow_light")!
        
        // MARK: Light Greyscale Colors
        
        static let grey100: UIColor  = .init(named: "Grey_100_light")!
        static let grey200: UIColor  = .init(named: "Grey_200_light")!
        static let grey300: UIColor  = .init(named: "Grey_300_light")!
        static let grey400: UIColor  = .init(named: "Grey_400_light")!
        static let grey500: UIColor  = .init(named: "Grey_500_light")!
        static let grey600: UIColor  = .init(named: "Grey_600_light")!
        static let grey700: UIColor  = .init(named: "Grey_700_light")!
        static let grey800: UIColor  = .init(named: "Grey_800_light")!
    }
    
    static let main100   = UIColor(named: "Main_100")!
    static let main200   = UIColor(named: "Main_200")!
    static let main300   = UIColor(named: "Main_300")!
    
    static let black    = UIColor(named: "Black")!
    static let white    = UIColor(named: "White")!
}
