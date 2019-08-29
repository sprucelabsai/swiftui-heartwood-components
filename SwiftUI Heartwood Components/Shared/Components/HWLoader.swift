//
//  HWLoader.swift
//  SwiftUI Heartwood Components
//
//  Created by Ricky Padilla on 8/28/19.
//  Copyright © 2019 Spruce Labs, Inc. All rights reserved.
//

import SwiftUI

public struct HWLoader: View {
  
  @State private var spin = false
  
  private struct WedgeShape: Shape {
    func path(in rect: CGRect) -> Path {
      var p = Path()
      let a0 = Angle(degrees: 0.0)
      let a1 = Angle(degrees: 270.0)
      let cen =  CGPoint(x: rect.size.width/2, y: rect.size.width/2)
      let r0 = rect.size.width/3.5
      let r1 = rect.size.width/2
      p.addArc(center: cen, radius: r0, startAngle: a0, endAngle: a1, clockwise: false)
      p.addArc(center: cen, radius: r1, startAngle: a1, endAngle: a0, clockwise: true)
      p.closeSubpath()
      return p
    }
  }
  
  public init(){}
  
  public var body: some View {
    WedgeShape()
      .rotationEffect(.degrees(spin ? 360 : 0))
      .animation(
        Animation
          .linear(duration: 0.9)
          .repeatForever(autoreverses: false)
      )
      .onAppear() { self.spin.toggle() }
  }
}

struct HWLoader_Previews: PreviewProvider {
    static var previews: some View {
        HWLoader()
    }
}
