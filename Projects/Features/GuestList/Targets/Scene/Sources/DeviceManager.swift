//
//  DeviceManager.swift
//  GuestListScene
//
//  Created by Woody on 2022/09/03.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit

class DeviceManager {
    // 디바이스 OS 버전 조회
    static func getOsVersion() -> String {
        return UIDevice.current.systemVersion
    }

    // 디바이스 모델 조회
    static func getModel() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let model = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return model
    }

    // 디바이스 모델명 조회
    static func getModelName() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let model = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }

        switch model {
            // Simulator
        case "i386", "x86_64":                          return "Simulator"
            // iPod
        case "iPod1,1":                                 return "iPod Touch"
        case "iPod2,1", "iPod3,1", "iPod4,1":           return "iPod Touch"
        case "iPod5,1", "iPod7,1":                      return "iPod Touch"
            // iPad
        case "iPad1,1":                                 return "iPad"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
        case "iPad6,11", "iPad6,12":                    return "iPad 5"
        case "iPad6,3", "iPad6,4":                      return "iPad Pro 9.7 Inch"
        case "iPad6,7", "iPad6,8":                      return "iPad Pro 12.9 Inch"
        case "iPad7,1", "iPad7,2":                      return "iPad Pro 12.9 Inch 2. Generation"
        case "iPad7,3", "iPad7,4":                      return "iPad Pro 10.5 Inch"
            // iPhone
        case "iPhone1,1", "iPhone1,2", "iPhone2,1":     return "iPhone"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
        case "iPhone4,1":                               return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
        case "iPhone7,1":                               return "iPhone 6 Plus"
        case "iPhone7,2":                               return "iPhone 6"
        case "iPhone8,1":                               return "iPhone 6s"
        case "iPhone8,2":                               return "iPhone 6s Plus"
        case "iPhone8,4":                               return "iPhone SE"
        case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
        case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
        case "iPhone10,1", "iPhone10,4":                return "iPhone 8"
        case "iPhone10,2", "iPhone10,5":                return "iPhone 8 Plus"
        case "iPhone10,3", "iPhone10,6":                return "iPhone X"
        case "iPhone11,2":                              return "iPhone XS"
        case "iPhone11,4", "iPhone11,6":                return "iPhone XS Max"
        case "iPhone11,8":                              return "iPhone XR"
        case "iPhone12,1":                              return "iPhone 11"
        case "iPhone12,3":                              return "iPhone 11 Pro"
        case "iPhone12,5":                              return "iPhone 11 Pro Max"
        case "iPhone12,8":                              return "iPhone SE 2nd Gen"
        case "iPhone13,1":                              return "iPhone 12 Mini"
        case "iPhone13,2":                              return "iPhone 12"
        case "iPhone13,3":                              return "iPhone 12 Pro"
        case "iPhone13,4":                              return "iPhone 12 Pro Max"
        default:                                        return model
        }
    }

    enum DeviceRatio {
        case _9_19
        case _9_16
    }
    static func getDeviceKind() -> DeviceRatio {
        let model = DeviceManager.getModel()

        /*
         iPhone 8+
         and 7+, 6s+, 6+

         Phone SE (gen 3)
         and SE (gen 2), 8, 7, 6s, 6
         */

        if model == "iPhone10,2" || // iPhone 8+
            model == "iPhone10,5" || // iPhone 8+
            model == "iPhone9,2" || // iPhone 7+
            model == "iPhone9,4" || // iPhone 7+
            model == "iPhone8,1" || // iPhone 6s
            model == "iPhone8,2" || // iPhone 6s+
            model == "iPhone12,8" || // iPhone SE 2nd Gen
            model == "iPhone9,1" || // iphone 7
            model == "iPhone9,3" || // iphone 7
            model == "iPhone10,1" || // iphone 8
            model == "iPhone10,4" || // iphone 8
            model == "iPhone7,2" ||
            model == "iPhone8,1" // iphone 6
        {
            return ._9_16
        }

        return ._9_19
    }
}
