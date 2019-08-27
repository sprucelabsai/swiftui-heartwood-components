//
//  HWSelectable.swift
//  SwiftUI Heartwood Components
//
//  Created by Ricky Padilla on 8/21/19.
//  Copyright © 2019 Spruce Labs, Inc. All rights reserved.
//

import Foundation

public enum HWSelectable {
  case singleSelectable
  case multiSelectable
  var name: String {
    switch self {
    case .singleSelectable: return "radio button"
    case .multiSelectable: return "checkbox"
    }
  }
}
