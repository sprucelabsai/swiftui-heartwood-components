//
//  HWSearchBar.swift
//  SwiftUI Heartwood Components
//
//  Created by Ricky Padilla on 9/4/19.
//  Copyright © 2019 Spruce Labs, Inc. All rights reserved.
//

import HeartwoodTokens
import SwiftUI

public struct HWSearchBar: View {
  
  // MARK: - DATA MODEL
  public struct Model {
    public let placeholder: String
    public var isReadonly: Bool
    public var isSmall: Bool
    public init(placeholder: String = "Search...", isReadonly: Bool = false, isSmall: Bool = false) {
      self.placeholder = placeholder
      self.isReadonly = isReadonly
      self.isSmall = isSmall
    }
  }
  
  // MARK: - PUBLIC PROPERTIES
  public var model: Model
  @Binding internal var text: String
  
  // MARK: - PUBLIC INIT
  public init(model: Model, text: Binding<String>) {
    self.model = model
    self._text = text
  }
  
  // MARK: - VIEW
  public var body: some View {
    var inputModel = HWTextInput.Model(
      id: "search",
      placeholder: "Search...",
      iconBefore: HeartwoodTokens.Icon.fillSearch,
      iconAfterAction: { self.text = "" },
      isReadOnly: false,
      isSmall: false
    )
    inputModel.iconAfter = text.count > 0 ? HeartwoodTokens.Icon.fillCancelSolid : nil
    return HWTextInput(model: inputModel, text: $text)
  }
}

struct HWSearchBar_Previews: PreviewProvider {
  static var previews: some View {
    // NOTE: Cannot store state in a preview, so cannot preview :(
    Text("Hello world")
  }
}
