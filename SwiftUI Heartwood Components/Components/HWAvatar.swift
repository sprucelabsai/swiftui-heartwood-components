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
    var showIndicator = false
    var status: HWOnlineStatus?
    var isLarge = false
    var isVertical = false
  }
  
  private var avatar: UIImage {
    guard
      let url = URL(string: model.imageURLString),
      let data = try? Data(contentsOf: url)
      else {
        return UIImage()
    }
    return UIImage(data: data) ?? UIImage()
  }
  
  private var indicatorColor: Color {
    guard let status = model.status else {
      return .clear
    }
    switch status {
    case .offline: return .gray
    case .online: return .green
    }
  }
  
  private var avatarDimension: CGFloat {
    return model.isLarge
      ? HWStyles.avatarHeightLarge
      : HWStyles.avatarHeightMedium
  }
  
  @State var model: Model
  
  var body: some View {
    
    let ImageStack = ZStack(alignment: .topTrailing) {
      Image(uiImage: avatar )
        .resizable()
        .frame(
          width: avatarDimension,
          height: avatarDimension,
          alignment: .topLeading)
        .clipShape(Circle())
      if model.showIndicator && model.status != nil {
        Circle()
          .frame(
            width: HWStyles.onlinIndicatorWidth,
            height: HWStyles.onlinIndicatorWidth,
            alignment: .topTrailing)
          .foregroundColor(indicatorColor)
          .overlay(
            Circle()
              // TODO: Use actual color for stroke
              .stroke(Color.white, lineWidth: HWStyles.onlineIndicatorStroke)
          )
          .padding([.top, .trailing], model.isLarge ? 8 : 0)
      }
    }
    
    let TextStack = VStack(alignment: model.isVertical ? .center : .leading) {
      if model.name != nil {
        Text(model.name!)
      }
      if model.text != nil {
        Text(model.text!)
      }
    }
    
    return HStack(alignment: .center, spacing: HWStyles.horizonatlSpacing) {
      if model.isVertical {
        VStack(alignment: .center) {
          ImageStack
          if model.name != nil {
            TextStack
          }
        }
      } else {
        ImageStack
        if model.name != nil {
          TextStack
        }
      }
    }
    
    
  }
}

struct HWAvatar_Previews: PreviewProvider {
  static var previews: some View {
    let models = [
      HWAvatar.Model(id: "30", imageURLString: "https://randomuser.me/api/portraits/women/29.jpg"),
      HWAvatar.Model(
        id: "31",
        imageURLString: "https://randomuser.me/api/portraits/women/31.jpg",
        name: "Brooke Lindstrom"
      ),
      HWAvatar.Model(
        id: "32",
        imageURLString: "https://randomuser.me/api/portraits/women/32.jpg",
        name: "Jennifer Mosely",
        text: "Stylist"
      ),
      HWAvatar.Model(
        id: "33",
        imageURLString: "https://randomuser.me/api/portraits/women/30.jpg",
        name: "Katrina Jordan",
        text: "Owner",
        showIndicator: true,
        status: .offline
      ),
      HWAvatar.Model(
        id: "34",
        imageURLString: "https://randomuser.me/api/portraits/women/34.jpg",
        name: "Katie Mote",
        text: "Manager",
        showIndicator: true,
        status: .online
      ),
      HWAvatar.Model(
        id: "35",
        imageURLString: "https://randomuser.me/api/portraits/women/35.jpg",
        name: "Jill Li",
        text: "Stylist",
        showIndicator: true,
        status: .offline,
        isLarge: true
      ),
      HWAvatar.Model(
        id: "36",
        imageURLString: "https://randomuser.me/api/portraits/women/36.jpg",
        name: "Debra Wallace",
        text: "Stylist",
        showIndicator: true,
        status: .online,
        isLarge: true,
        isVertical: true
      ),

    ]
    return List(models) { model in
      HWAvatar(model: model)
    }
  }
}
