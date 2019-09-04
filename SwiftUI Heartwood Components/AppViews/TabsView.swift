//
//  TabsView.swift
//  SwiftUI Heartwood Components
//
//  Created by Ricky Padilla on 9/3/19.
//  Copyright © 2019 Spruce Labs, Inc. All rights reserved.
//

import SwiftUI

struct TabsView: View {
  var body: some View {
    let model = HWTabs.Model(tabs: [
      "Dashboard",
      "Notes",
      "Reports",
      "Pasta",
      "Sicophantically",
      "stuff on 🔥",
      "Another long one"
    ])
    return VStack {
      HWTabs(model: model)
      Spacer()
    }
  }
}

struct TabsView_Previews: PreviewProvider {
  static var previews: some View {
    TabsView()
  }
}
