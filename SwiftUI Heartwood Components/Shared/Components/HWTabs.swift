//
//  HWTabs.swift
//  SwiftUI Heartwood Components
//
//  Created by Ricky Padilla on 9/3/19.
//  Copyright © 2019 Spruce Labs, Inc. All rights reserved.
//

import HeartwoodTokens
import SwiftUI

public struct HWTabs: View {
  
  public struct Model {
    public let tabs: [String]
    public init(tabs: [String]) {
      self.tabs = tabs
    }
  }
  
  private let fontName = HeartwoodTokens.Font.semibold.name
  private let fontSize = HeartwoodTokens.Font.Size.font2
  
  private var titleColor: Color {
    let color = HeartwoodTokens.Color.textColorBase
    return HWStyles.dynamicColor(color)
  }
  
  private var titleFont: Font {
    return HWStyles.dynamicFont(name: fontName, size: fontSize)
  }
  
  private var underlineColor: Color {
    let color = HeartwoodTokens.Color.colorPrimaryBase
    return HWStyles.dynamicColor(color)
  }
  
  private func tabWidth(at index: Int) -> CGFloat {
    guard let font = UIFont(name: fontName, size: CGFloat(fontSize)) else { return 0 }
    let textStyle = HWStyles.dynamicTextStyle(for: fontSize)
    let dynamicFont = UIFontMetrics(forTextStyle: textStyle)
      .scaledFont(for: font)
    let label = UILabel()
    label.text = model.tabs[index]
    label.font = dynamicFont
    let labelWidth = label.intrinsicContentSize.width
    return labelWidth
  }
  
  private var leadingPadding: CGFloat {
    var padding: CGFloat = 0
    for i in 0..<model.tabs.count {
      if i < selectedIndex {
        padding += tabWidth(at: i) + HWStyles.tabsSpacing
      }
    }
    return padding
  }
  
  @State public var selectedIndex: Int = 2
  
  public var model: Model
  
  public init(model: Model) {
    self.model = model
  }
  
  public var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      VStack(alignment: .leading, spacing: 0) {
        HStack(spacing: HWStyles.tabsSpacing) {
          ForEach(0..<model.tabs.count, id: \.self) { index in
            Button(action: { self.selectedIndex = index }) {
              Text(self.model.tabs[index])
              .font(self.titleFont)
              .foregroundColor(self.titleColor)
                .frame(width: nil, height: 42, alignment: .center)
            }
          }
          Spacer()
        }
        Rectangle()
          .frame(width: tabWidth(at: selectedIndex), height: 3, alignment: .bottomLeading)
          .foregroundColor(underlineColor)
          .padding(.leading, leadingPadding)
          .animation(Animation.spring())
      }
    }
  }
}

struct HWTabs_Previews: PreviewProvider {
  static var previews: some View {
    let model = HWTabs.Model(tabs: [
      "Dashboard",
      "Notes",
      "Reports",
      "Pasta",
      "Sicophantically",
      "🔥 stuff",
      "Another long one"
    ])
    return VStack {
      Rectangle().frame(width: nil, height: 200, alignment: .top).foregroundColor(.white)
      HWTabs(model: model)
      Spacer()
    }
  }
}
