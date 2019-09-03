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
  
  private let name = HeartwoodTokens.Font.semibold.name
  private let size = HeartwoodTokens.Font.Size.font2
  
  private var titleColor: Color {
    let color = HeartwoodTokens.Color.textColorBase
    return HWStyles.dynamicColor(color)
  }
  
  private var titleFont: Font {
    return HWStyles.dynamicFont(name: name, size: size)
  }
  
  private var underlineColor: Color {
    let color = HeartwoodTokens.Color.colorPrimaryBase
    return HWStyles.dynamicColor(color)
  }
  
  private func tabWidth(at index: Int) -> CGFloat {
    guard let font = UIFont(name: name, size: CGFloat(size)) else { return 0 }
    let textStyle = HWStyles.dynamicTextStyle(for: size)
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
//      collectionViewWidth += getUnderlineWidthForCell(at: i) + cellSpacing
    }
    return padding
  }
  
  @State public var selectedIndex: Int = 2
  
  public var model: Model
  
  public init(model: Model) {
    self.model = model
  }
  
  public var body: some View {
    VStack(alignment: .leading) {
      HStack(spacing: HWStyles.tabsSpacing) {
        ForEach(0..<model.tabs.count, id: \.self) { index in
          Button(action: { self.selectedIndex = index }) {
            Text(self.model.tabs[index])
            .font(self.titleFont)
            .foregroundColor(self.titleColor)
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

struct HWTabs_Previews: PreviewProvider {
  static var previews: some View {
    let model = HWTabs.Model(tabs: [
      "Dashboard",
      "Notes",
      "Reports"
    ])
    return VStack {
      Rectangle().frame(width: nil, height: 200, alignment: .top).foregroundColor(.white)
      HWTabs(model: model)
      Spacer()
    }
  }
}
