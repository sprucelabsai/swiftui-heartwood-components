//
//  HWTextInput.swift
//  SwiftUI Heartwood Components
//
//  Created by Ricky Padilla on 9/3/19.
//  Copyright © 2019 Spruce Labs, Inc. All rights reserved.
//

import HeartwoodTokens
import SwiftUI

public struct HWTextInput: View {
  
  // MARK: - DATA MODEL
  public struct Model: Identifiable {
    public let id: String
    public var label: String?
    public var postLabel: String?
    public var placeholder: String?
    public var iconBefore: String?
    public var iconAfter: String?
    public var iconAfterAction: (() -> Void)?
    public var helper: String?
    public var errorMsg: String?
    public var isReadOnly: Bool
    public var isSmall: Bool
    public init(
      id: String,
      label: String? = nil,
      postLabel: String? = nil,
      placeholder: String? = nil,
      iconBefore: String? = nil,
      iconAfter: String? = nil,
      iconAfterAction: (() -> Void)? = nil,
      helper: String? = nil,
      errorMsg: String? = nil,
      isReadOnly: Bool = false,
      isSmall: Bool = false
    ) {
      self.id = id
      self.label = label
      self.postLabel = postLabel
      self.placeholder = placeholder
      self.iconBefore = iconBefore
      self.iconAfter = iconAfter
      self.iconAfterAction = iconAfterAction
      self.helper = helper
      self.errorMsg = errorMsg
      self.isReadOnly = isReadOnly
      self.isSmall = isSmall
    }
  }
  
  // MARK: - PUBLIC PROPERTIES
  public var model: Model
  @Binding internal var text: String
  
  // MARK: - PRIVATE PROPERTIES
  private let styles: Styles
  
  // MARK: - PUBLIC INIT
  public init(model: Model, text: Binding<String>) {
    self.model = model
    self._text = text
    styles = Styles(model: model)
  }
  
  // MARK: - VIEW
  public var body: some View {
    VStack(alignment: .leading, spacing: styles.vStackSpacing) {
      HStack {
        Text(model.label ?? "")
          .font(styles.labelFont)
          .foregroundColor(styles.labelColor)
        Spacer()
        Text(model.postLabel ?? "")
          .font(styles.labelFont)
          .foregroundColor(styles.labelColor)
      }
      HStack(spacing: 0) {
        if model.iconBefore != nil {
          HWIcon(name: model.iconBefore!)
            .padding(.leading, styles.defaultPadding)
            .foregroundColor(styles.iconColor)
            .opacity(styles.iconOpacity)
        }
        TextField(model.placeholder ?? "", text: $text)
          .disabled(model.isReadOnly)
          .font(styles.textFont)
          .padding(.horizontal, styles.defaultPadding)
          .padding(.vertical, styles.textFieldPadding)
          .background(styles.backgroundColor)
        if model.iconAfter != nil {
          Button(action: model.iconAfterAction ?? {} ) {
            HWIcon(name: model.iconAfter!)
              .padding(styles.defaultPadding)
          }
          .accentColor(styles.iconColor)
        }
      }
      .overlay(
        RoundedRectangle(cornerRadius: styles.cornerRadius)
          .strokeBorder(styles.outlineColor, lineWidth: styles.strokeWidth)
      )
      if model.errorMsg != nil || model.helper != nil {
        Text(model.errorMsg ?? model.helper!)
          .font(styles.helperFont)
          .foregroundColor(styles.helperColor)
      }
    }
  }
}

private struct Styles {
  
  // MARK: - INTERNAL PROPERTIES
  internal var model: HWTextInput.Model
  
  internal let vStackSpacing = CGFloat(4)
  internal let defaultPadding = CGFloat(8)
  internal let iconOpacity = 0.6
  internal let cornerRadius = CGFloat(4)
  internal let strokeWidth = CGFloat(1)
  internal var textFieldPadding: CGFloat { return model.isSmall ? 8 : 14 }
  
  internal var labelFont: Font {
    let name = HeartwoodTokens.Font.mono.name
    let size = HeartwoodTokens.Font.Size.font1
    return HWStyles.dynamicFont(name: name, size: size)
  }
  
  internal var labelColor: Color {
    let color = HeartwoodTokens.Color.textColorBase
    return HWStyles.dynamicColor(color)
  }
  
  internal var textFont: Font {
    let name =  HeartwoodTokens.Font.regular.name
    let size = HeartwoodTokens.Font.Size.font3
    return HWStyles.dynamicFont(name: name, size: size)
  }
  
  internal var helperFont: Font {
    let name =  HeartwoodTokens.Font.regular.name
    let size = HeartwoodTokens.Font.Size.font2
    return HWStyles.dynamicFont(name: name, size: size)
  }
  
  internal var helperColor: Color {
    let color = model.errorMsg == nil
      ? HeartwoodTokens.Color.textColorSubdued
      : HeartwoodTokens.Color.colorCriticalBase
    return HWStyles.dynamicColor(color)
  }
  
  internal var outlineColor: Color {
    let color = model.errorMsg == nil
      ? HeartwoodTokens.Color.borderColorBold
      : HeartwoodTokens.Color.colorCriticalBase
    return HWStyles.dynamicColor(color)
  }
  
  internal var backgroundColor: Color {
    guard !model.isReadOnly else {
      return HWStyles.dynamicColor(HeartwoodTokens.Color.backgroundColorDark)
    }
    let isError = model.errorMsg != nil
    let color = isError
      ? HeartwoodTokens.Color.colorCriticalBase
      : HeartwoodTokens.Color.colorNeutral
    let opacity = isError ? 0.15 : 1.0
    return HWStyles.dynamicColor(color).opacity(opacity)
  }
  
  internal var neutralColor: Color {
    let color = HeartwoodTokens.Color.colorNeutral
    return HWStyles.dynamicColor(color)
  }
  
  internal var iconColor: Color {
    let color = HeartwoodTokens.Color.textColorBase
    return HWStyles.dynamicColor(color)
  }
}

struct HWTextInput_Previews: PreviewProvider {
    static var previews: some View {
      // NOTE: Cannot store state in a preview, so cannot preview :(
      Text("Hello world")
    }
}
