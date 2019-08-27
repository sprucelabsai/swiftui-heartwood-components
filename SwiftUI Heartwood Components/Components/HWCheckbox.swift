//
//  HWSelectButton.swift
//  SwiftUI Heartwood Components
//
//  Created by Ricky Padilla on 8/27/19.
//  Copyright © 2019 Spruce Labs, Inc. All rights reserved.
//

import HeartwoodTokens
import SwiftUI

struct HWSelectButton: View {
  
  @State var isSelected: Bool = false
  var selectableType: HWSelectable
  
  private var buttonColor: Color {
    let color = isSelected
      ? HeartwoodTokens.Color.colorPrimaryBase
      : HeartwoodTokens.Color.textColorSubdued
    return HWStyles.dynamicColor(color)
  }
  
  private var iconName: String {
    switch selectableType {
    case .multiSelectable:
      return isSelected
        ? HeartwoodTokens.Icon.fillCheckBox
        : HeartwoodTokens.Icon.fillCheckBoxOutlineBlank
    case .singleSelectable:
      return isSelected
        ? HeartwoodTokens.Icon.fillRadioButtonChecked
        : HeartwoodTokens.Icon.fillRadioButtonUnchecked
    }
  }
  
  var body: some View {
    Button(action: { self.isSelected.toggle() }) {
      HWIcon(name: iconName)
        .foregroundColor(buttonColor)
    }
    .accessibility(label: Text(selectableType.name))
    .accessibility(addTraits: .isSelected)
    .accessibility(value: Text("\(isSelected.description)"))
  }
}

struct HWSelectButton_Previews: PreviewProvider {
    static var previews: some View {
      HWSelectButton(selectableType: .singleSelectable)
    }
}
