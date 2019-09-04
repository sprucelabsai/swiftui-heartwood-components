//
//  TextInputView.swift
//  SwiftUI Heartwood Components
//
//  Created by Ricky Padilla on 9/4/19.
//  Copyright © 2019 Spruce Labs, Inc. All rights reserved.
//

import SwiftUI

struct TextInputView: View {
  
  @State var inputText = ""
  @State var os = "iOS"
  @State var errText = ""
  @State var searchText = ""
  
  var inputModel = HWTextInput.Model(
    id: "1",
    label: "First name",
    placeholder: "i.e. Tommy",
    helper: "Your first name goes before your last name."
  )
  
  var osModel = HWTextInput.Model(
    id: "2",
    label: "Favorite OS",
    postLabel: "3/20",
    isReadOnly: true,
    isSmall: true
  )
  
  var wrongModel = HWTextInput.Model(
    id: "3",
    label: "Only wrong answers here",
    errorMsg: "Oh no, that's wrong!"
  )
  
  let searchModel = HWSearchBar.Model(placeholder: "Search guests...")
  
  var body: some View {
    VStack(spacing: 22) {
      HWTextInput(model: inputModel, text: $inputText)
      HWTextInput(model: osModel, text: $os)
      HWTextInput(model: wrongModel, text: $errText)
      HWSearchBar(model: searchModel, text: $searchText)
      Spacer()
    }
  }
}

struct TextInputView_Previews: PreviewProvider {
    static var previews: some View {
      TextInputView().padding()
    }
}
