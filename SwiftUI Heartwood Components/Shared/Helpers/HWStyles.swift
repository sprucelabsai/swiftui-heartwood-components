//
//  HWStyles.swift
//  SwiftUI Heartwood Components
//
//  Created by Ricky Padilla on 8/22/19.
//  Copyright © 2019 Spruce Labs, Inc. All rights reserved.
//

import SwiftUI
import HeartwoodTokens

// All colors, font sizes and fonts should come from design tokens

public enum HWStyles {
  
  // Avatar
  static let onlinIndicatorWidth: CGFloat = 10
  static let onlineIndicatorStroke: CGFloat = 1
  
  // ListItem
  static let horizonatlSpacing: CGFloat = 8
  
  public static func dynamicFont(name: String, size: Int) -> Font {
    let textStyle = dynamicTextStyle(for: size)
    let font = UIFont(name: name, size: CGFloat(size)) ?? UIFont()
    let dynamicSize = UIFontMetrics(forTextStyle: textStyle)
      .scaledFont(for: font)
      .pointSize
    let dynamicFont = Font.custom(name, size: dynamicSize)
    return dynamicFont
  }
  
  public static func dynamicTextStyle(for size: Int) -> UIFont.TextStyle {
    switch size {
    case 0..<16: return .body
    case 16..<24: return .headline
    default: return .title1
    }
  }
  
  // NOTE: Unfortunately, we cannot set static dynamic colors because we set
  // colors programatically. If we used dynamic color xcassets we could just
  // use them like `Color(.primary)`, but these files are not automatable (yet)
  // so we cannot import them from HeartwoodTokens.
  public static func dynamicColor(_ color: HeartwoodTokens.DynamicColor) -> Color {
    let dynamicColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
      if traitCollection.userInterfaceStyle == .dark {
        return color.night
      } else {
        return color.day
      }
    }
    return Color(dynamicColor)
  }
  
  public static func getIconName(from givenString: String) -> String {
    // TODO: Should make `HeartwoodTokens.Icon iterable` so can find actual value
    return "ic_\(givenString)"
  }
  
  public enum ColorKind: CaseIterable {
    case primary
    case success
    case warning
    case critical
  }
  
}


