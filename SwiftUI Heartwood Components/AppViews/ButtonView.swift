//
//  ButtonView.swift
//  SwiftUI Heartwood Components
//
//  Created by Ricky Padilla on 8/28/19.
//  Copyright © 2019 Spruce Labs, Inc. All rights reserved.
//

import HeartwoodTokens
import SwiftUI

struct ButtonView: View {
  
  let models = [
    HWButton.Model(
      id: "1",
      action: {},
      title: "Add a guest"
    ),
    HWButton.Model(
      id: "2",
      action: {},
      title: "Add a guest",
      icon: HeartwoodTokens.Icon.add
    ),
    HWButton.Model(
      id: "3",
      action: {},
      title: "Add a guest",
      icon: HeartwoodTokens.Icon.add,
      kind: .secondary
    ),
    HWButton.Model(
      id: "4",
      action: {},
      title: "Add a guest",
      icon: HeartwoodTokens.Icon.add,
      kind: .simple
    ),
    HWButton.Model(
      id: "5",
      action: {},
      title: "Add a guest",
      icon: HeartwoodTokens.Icon.add,
      isFullWidth: false
    ),
    HWButton.Model(
      id: "6",
      action: {},
      title: "Add a guest",
      icon: HeartwoodTokens.Icon.add,
      isLoading: true,
      isFullWidth: false
    ),
    HWButton.Model(
      id: "16",
      action: {},
      title: "Add a guest",
      icon: HeartwoodTokens.Icon.add,
      kind: .secondary,
      isLoading: true,
      isFullWidth: false
    ),
    HWButton.Model(
      id: "7",
      action: {},
      title: "Add a guest",
      icon: HeartwoodTokens.Icon.add,
//      colorKind: .success,
        isDisabled: true,
//        isLoading: true,
      isFullWidth: false
    ),
    HWButton.Model(
      id: "11",
      action: {},
      title: "Remove guest",
      colorKind: .critical
    ),
    HWButton.Model(
      id: "12",
      action: {},
      title: "Remove guest",
      icon: HeartwoodTokens.Icon.remove,
      colorKind: .critical
    ),
    HWButton.Model(
      id: "13",
      action: {},
      title: "Remove guest",
      icon: HeartwoodTokens.Icon.remove,
      colorKind: .critical,
      isLoading: true
    ),
    HWButton.Model(
      id: "14",
      action: {},
      title: "Remove guest",
      icon: HeartwoodTokens.Icon.remove,
      colorKind: .critical,
      isFullWidth: false
    ),
  ]
  
    var body: some View {
      ScrollView {
        VStack(alignment: .leading) {
          ForEach(models) {
            HWButton(model: $0)
          }
        .padding()
        }
      }
    }
  
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
