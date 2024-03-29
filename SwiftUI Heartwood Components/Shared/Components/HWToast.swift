//
//  HWToast.swift
//  SwiftUI Heartwood Components
//
//  Created by Ricky Padilla on 8/28/19.
//  Copyright © 2019 Spruce Labs, Inc. All rights reserved.
//

import HeartwoodTokens
import SwiftUI

public struct HWToast: View {
  
  public var model: Model
  
  public struct Model: Identifiable {
    public let id: String
    public let headline: String
    public var text: String?
    public var kind: Kind
    public var followupText: String?
    public init(id: String, headline: String, text: String? = nil, kind: Kind = .info, followupText: String? = nil) {
      self.id = id
      self.headline = headline
      self.text = text
      self.kind = kind
      self.followupText = followupText
    }
  }
  
  public enum Kind {
    case neutral
    case positive
    case negative
    case warn
    case info
    public var color: Color {
      var dynamicColor: HeartwoodTokens.DynamicColor
      switch self {
      case .neutral: dynamicColor = HeartwoodTokens.Color.textColorBase
      case .positive: dynamicColor = HeartwoodTokens.Color.colorSuccessBase
      case .negative: dynamicColor = HeartwoodTokens.Color.colorCriticalBase
      case .warn: dynamicColor = HeartwoodTokens.Color.colorWarningBase
      case .info: dynamicColor = HeartwoodTokens.Color.colorPrimaryBase
      }
      return HWStyles.dynamicColor(dynamicColor)
    }
  }
  
  private var neutralColor: Color {
    let dynamicColor = HeartwoodTokens.Color.colorNeutral
    return HWStyles.dynamicColor(dynamicColor)
  }
  
  private var titleFont: Font {
    let name =  HeartwoodTokens.Font.semibold.name
    let size = HeartwoodTokens.Font.Size.font2
    return HWStyles.dynamicFont(name: name, size: size)
  }

  private var subtitleFont: Font {
    let name =  HeartwoodTokens.Font.regular.name
    let size = HeartwoodTokens.Font.Size.font2
    return HWStyles.dynamicFont(name: name, size: size)
  }
  
  public init(model: Model){
    self.model = model
  }
  
  public var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      HStack {
        Text(model.headline)
          .font(titleFont)
          .foregroundColor(neutralColor)
          .lineLimit(1)
        Spacer()
        Button(action: { }) {
          HWIcon(name: HeartwoodTokens.Icon.fillClose)
            .foregroundColor(self.neutralColor.opacity(0.6))
          .padding(.trailing, -4)
        }
      }//.padding(.top, -6)
      if model.text != nil {
        Text(model.text!)
          .font(subtitleFont)
          .lineLimit(nil)
          .foregroundColor(neutralColor)
          .layoutPriority(1.0)
          .padding(.bottom, model.followupText == nil ? 4 : 0)
      }
      if model.followupText != nil {
        Button(action: {}) {
          Text(model.followupText!)
          .font(titleFont)
          .foregroundColor(neutralColor)
          .lineLimit(1)
          .padding(.bottom, 2)
          .padding(.top, 8)
        }
      }
    }
    .padding(.vertical, 10)
    .padding(.horizontal, 12)
    .background(model.kind.color)
    .cornerRadius(4)
  }
  
}

struct HWToast_Previews: PreviewProvider {
  static var previews: some View {
    let model = HWToast.Model(
      id: "1",
      headline: "Successfully added teammate",
//      text: "Way to go! You're so good at adding teammates. I can't wait to see what you do next.",
      kind: .warn,
      followupText: "Undo"
    )
    return HWToast(model: model).padding()
  }
}
