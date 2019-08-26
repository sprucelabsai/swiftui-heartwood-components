//
//  HWStyles.swift
//  SwiftUI Heartwood Components
//
//  Created by Ricky Padilla on 8/22/19.
//  Copyright © 2019 Spruce Labs, Inc. All rights reserved.
//

import SwiftUI

// All colors, font sizes and fonts should come from design tokens

enum HWStyles {
  
  // Avatar
  static let avatarHeightLarge: CGFloat = 96
  static let avatarHeightMedium: CGFloat = 40
  static let avatarHeightsmall: CGFloat = 22
  static let onlinIndicatorWidth: CGFloat = 10
  static let onlineIndicatorStroke: CGFloat = 1
  
  // ListItem
  static let horizonatlSpacing: CGFloat = 8
  
  static func dynamicFont(name: String, size: Int) -> Font {
    let textStyle = dynamicTextStyle(for: size)
    let font = UIFont(name: name, size: CGFloat(size)) ?? UIFont()
    let dynamicSize = UIFontMetrics(forTextStyle: textStyle)
      .scaledFont(for: font)
      .pointSize
    let dynamicFont = Font.custom(name, size: dynamicSize)
    return dynamicFont
  }
  
  static func dynamicTextStyle(for size: Int) -> UIFont.TextStyle {
    switch size {
    case 0..<16: return .body
    case 16..<24: return .headline
    default: return .title1
    }
  }
  
}


