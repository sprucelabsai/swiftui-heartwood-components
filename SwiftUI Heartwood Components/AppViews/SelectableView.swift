//
//  SelectableView.swift
//  SwiftUI Heartwood Components
//
//  Created by Ricky Padilla on 8/28/19.
//  Copyright © 2019 Spruce Labs, Inc. All rights reserved.
//

import SwiftUI

struct SelectableView: View {
    var body: some View {
      VStack(alignment: .leading) {
        HWSelectButton(selectableType: .singleSelectable)
        HWSelectButton(selectableType: .multiSelectable)
        Spacer()
      }.padding()
    }
}

struct SelectableView_Previews: PreviewProvider {
    static var previews: some View {
        SelectableView()
    }
}
