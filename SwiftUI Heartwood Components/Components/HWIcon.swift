//
//  HWIcon.swift
//  SwiftUI Heartwood Components
//
//  Created by Ricky Padilla on 8/21/19.
//  Copyright © 2019 Spruce Labs, Inc. All rights reserved.
//

import SwiftUI
import HeartwoodTokens

// TODO: Should get icon names and symbols from design tokens.

public struct HWIcon: View {
  
  var name: String
  
  var accessibilityLabel: Text {
    let label = name.replacingOccurrences(of: "_", with: " ")
      .replacingOccurrences(of: "ic", with: "")
      .replacingOccurrences(of: "fill", with: "")
    return Text(verbatim: label)
  }
  
  public var body: some View {
    Image(name, bundle: HeartwoodTokens.bundle)
      .accessibility(label: accessibilityLabel)
      .imageScale(.small)
  }
  
  static func getIconName(from givenString: String) -> String {
    // TODO: Should make `HeartwoodTokens.Icon iterable` so can find actual value
    return "ic_\(givenString)"
  }
  
}

struct HWIcon_Previews: PreviewProvider {
    static var previews: some View {
      HWIcon(name: "ic_settings")
    }
}

/*
 
 // Once Apple API is ready AND we can supply icon svg files
 // through design tokens, update this struct to use dynamic
 // images.
 
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
    Image(systemName: "star")
      .imageScale(.small)
  }
}
 */
