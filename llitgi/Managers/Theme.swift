//
//  Theme.swift
//  llitgi
//
//  Created by Xavi Moll on 24/08/2018.
//  Copyright © 2018 xmollv. All rights reserved.
//

import Foundation
import UIKit

enum Theme: String {
    case white
    case blue
    case black
    
    init(withName name: String) {
        switch name {
        case "white": self = .white
        case "blue": self = .blue
        case "black": self = .black
        default: self = .white
        }
    }
    
    var tintColor: UIColor {
        switch self {
        case .white: return .black
        case .blue, .black: return .white
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .white: return .white
        case .blue: return UIColor(red: 30/255, green: 40/255, blue: 52/255, alpha: 1)
        case .black: return .black
        }
    }
    
    var textTitleColor: UIColor {
        switch self {
        case .white: return .black
        case .blue, .black: return .white
        }
    }
    
    var textSubtitleColor: UIColor {
        switch self {
        case .white: return .darkGray
        case .blue, .black: return .lightGray
        }
    }
    
    var highlightBackgroundColor: UIColor {
        switch self {
        case .white: return UIColor(red: 230/255, green: 228/255, blue: 226/255, alpha: 1)
        case .blue: return UIColor(red: 55/255, green: 73/255, blue: 94/255, alpha: 1)
        case .black: return UIColor(red: 110/255, green: 110/255, blue: 110/255, alpha: 1)
        }
    }
}

final class ThemeManager {
    
    typealias ThemeChanged = (_ theme: Theme) -> Void
    
    //MARK:- Private properties
    private var themeChangedBlocks: [ThemeChanged] = []
    
    //MARK: Public properties
    var theme: Theme = .white {
        didSet {
            UserDefaults.standard.setValue(theme.rawValue, forKey: "savedTheme")
            self.themeChangedBlocks.forEach{ $0(theme) }
        }
    }
    var themeChanged: ThemeChanged? {
        didSet {
            guard let block = self.themeChanged else { return }
            //TODO: The array is holding the blocks in a strong way, therefore they are never being deallocated
            //and can cause the same call more times than extened.
            self.themeChangedBlocks.append(block)
        }
    }
    
    init() {
        self.theme = Theme(withName: UserDefaults.standard.string(forKey: "savedTheme") ?? "")
    }
}