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
  public var isIconOnly: Bool = false
}
