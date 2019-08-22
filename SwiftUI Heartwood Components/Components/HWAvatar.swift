//
//  HWAvatar.swift
//  SwiftUI Heartwood Components
//
//  Created by Ricky Padilla on 8/21/19.
//  Copyright © 2019 Spruce Labs, Inc. All rights reserved.
//

import SwiftUI

struct HWAvatar: View {
  
  struct Model: Identifiable {
    let id: String
    let imageURLString: String
    var name: String?
    var text: String?
    var showIndicator: Bool = false
    var status: HWOnlineStatus?
  }
  
  @State var model: Model
  
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello World!"/*@END_MENU_TOKEN@*/)
    }
}

struct HWAvatar_Previews: PreviewProvider {
    static var previews: some View {
        HWAvatar()
    }
}
