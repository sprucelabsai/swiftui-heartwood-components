//
//  HWAction.swift
//  SwiftUI Heartwood Components
//
//  Created by Ricky Padilla on 8/21/19.
//  Copyright © 2019 Spruce Labs, Inc. All rights reserved.
//

import Foundation

struct HWAction: Identifiable {
  let id: String
  var text: String
  var icon: String?
  var isIconOnly: Bool = false
}
