//
//  HWAction.swift
//  SwiftUI Heartwood Components
//
//  Created by Ricky Padilla on 8/21/19.
//  Copyright © 2019 Spruce Labs, Inc. All rights reserved.
//

import Foundation

public struct HWAction: Identifiable {
  public let id: String
  public var text: String
  public var icon: String?
  public var isIconOnly: Bool
  public init(id: String, text: String, icon: String? = nil, isIconOnly: Bool = false) {
    self.id = id
    self.text = text
    self.icon = icon
    self.isIconOnly = isIconOnly
  }
}
