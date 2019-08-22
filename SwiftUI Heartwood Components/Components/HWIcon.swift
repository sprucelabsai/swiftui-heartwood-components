//
//  HWIcon.swift
//  SwiftUI Heartwood Components
//
//  Created by Ricky Padilla on 8/21/19.
//  Copyright © 2019 Spruce Labs, Inc. All rights reserved.
//

import SwiftUI

// TODO: Should get icon names and symbols from design tokens.

struct HWIcon: View {
  
  var name: String
  
  // NOTE: `dynamicImage` does give us our custom symbol. However, when a user
  // changes system text sizes, this does not update until app restart and we
  // cannot apply color to it.
  // Hopefully this is just a Beta bug, and we can simply declare
  //   `Image(name).imageScale(.large)`
  var dynamicImage: UIImage {
    let configuration = UIImage.SymbolConfiguration(textStyle: .body, scale: .large)
    let image = UIImage(named: name) ?? UIImage()
    return image.withConfiguration(configuration)
  }
  
  var body: some View {
//    Image(uiImage: dynamicImage)
    Image(systemName: "star")
      .imageScale(.large)
  }
}

struct HWIcon_Previews: PreviewProvider {
    static var previews: some View {
      HWIcon(name: "test-circle")
    }
}
