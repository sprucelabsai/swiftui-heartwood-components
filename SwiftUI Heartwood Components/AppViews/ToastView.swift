//
//  ToastView.swift
//  SwiftUI Heartwood Components
//
//  Created by Ricky Padilla on 8/29/19.
//  Copyright © 2019 Spruce Labs, Inc. All rights reserved.
//

import SwiftUI

struct ToastView: View {
  let models = [
    HWToast.Model(
      id: "1",
      headline: "Something happened...",
      kind: .neutral
    ),
    HWToast.Model(
      id: "5",
      headline: "You are now connected to the Internet",
      kind: .info
    ),
    HWToast.Model(
      id: "2",
      headline: "Successfully added teammate",
      text: "Way to go! You're so good at adding teammates. I can't wait to see what you do next.",
      kind: .positive
    ),
    HWToast.Model(
      id: "3",
      headline: "Teammate removed",
      text: "If this was a mistake you can still fix it.",
      kind: .warn,
      followupText: "Undo"
    ),
    HWToast.Model(
      id: "4",
      headline: "Payment declined",
      text: "Oops! Please try again to regain access to the Spruce experience.",
      kind: .negative,
      followupText: "See details"
    ),
  ]
  
  var body: some View {
    List(models) { model in
      HWToast(model: model)//.padding()
    }
  }
}

struct ToastView_Previews: PreviewProvider {
    static var previews: some View {
        ToastView()
    }
}
