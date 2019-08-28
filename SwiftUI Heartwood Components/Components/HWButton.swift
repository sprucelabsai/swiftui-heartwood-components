//
//  HWButton.swift
//  SwiftUI Heartwood Components
//
//  Created by Ricky Padilla on 8/28/19.
//  Copyright © 2019 Spruce Labs, Inc. All rights reserved.
//

import HeartwoodTokens
import SwiftUI

struct HWButton: View {
  
  @State var model: Model
  
  struct Model: Identifiable {
    let id: String
    let action: () -> Void
    var title: String?
    var icon: String?
    var kind: Kind = .primary
    var colorKind: HWStyles.ColorKind = .primary
    var isDisabled = false
    var isLoading = false
    var isFullWidth = true
  }
  
  enum Kind {
    case primary
    case secondary
    case simple
  }
  
  private var titleFont: Font {
    let name =  HeartwoodTokens.Font.regular.name
    let size = HeartwoodTokens.Font.Size.font3
    return HWStyles.dynamicFont(name: name, size: size)
  }
  
  private var neutralColor: Color {
    let dynamicColor = HeartwoodTokens.Color.colorNeutral
    return HWStyles.dynamicColor(dynamicColor)
  }
  
  private var buttonColor: Color {
    var dynamicColor: HeartwoodTokens.DynamicColor
    switch model.colorKind {
    case .critical: dynamicColor = HeartwoodTokens.Color.colorCriticalBase
    case .primary: dynamicColor = HeartwoodTokens.Color.colorPrimaryBase
    case .success: dynamicColor = HeartwoodTokens.Color.colorSuccessBase
    case .warning: dynamicColor = HeartwoodTokens.Color.colorWarningBase
    }
    return HWStyles.dynamicColor(dynamicColor)
  }
  
  private var contentColor: Color {
    return model.kind == .primary ? neutralColor : buttonColor
  }
  
  // NOTE: If Apple does not exposed an `onPress`-like method, we'll need
  // to override the onPress BG color in the less ideal way as shown at:
  // https://stackoverflow.com/questions/56509640/how-to-set-custom-highlighted-state-of-swiftui-button
  
  var body: some View {
    Button(action: model.action) {
      HStack(alignment: .center) {
        if model.isFullWidth {
          Spacer()
        }
        ZStack {
          if model.isLoading {
            HWLoader()
              .frame(width: 20, height: 20, alignment: .center)
              .foregroundColor(contentColor)
          }
          HStack {
            if model.icon != nil {
              HWIcon(name: model.icon!)
                .foregroundColor(model.isLoading ? .clear : contentColor)
            }
            if model.title != nil {
              Text(model.title ?? "")
                .font(titleFont)
                .foregroundColor(model.isLoading ? .clear : contentColor)
            }
          }
        }
        if model.isFullWidth {
          Spacer()
        }
      }
      .padding(.horizontal, model.isFullWidth ? nil : 22)
      .frame(width: nil, height: 48, alignment: .center)
      .background(model.kind == .primary ? buttonColor : .clear)
      .cornerRadius(4)
      .overlay(
        RoundedRectangle(cornerRadius: 4)
          .stroke(model.kind == .secondary ? buttonColor : .clear, lineWidth: 1)
      )
        .opacity(model.isDisabled ? 0.5 : 1.0)
    }.disabled(model.isLoading || model.isDisabled)
  }
}

struct HWButton_Previews: PreviewProvider {
  static var previews: some View {
    let model = HWButton.Model(
        id: "1",
        action: {},
        title: "Add a guest",
        icon: HeartwoodTokens.Icon.add,
        kind: .secondary,
        colorKind: .success,
//        isDisabled: true,
//        isLoading: true,
        isFullWidth: false
      )
    return HWButton(model: model).padding()
  }
}
