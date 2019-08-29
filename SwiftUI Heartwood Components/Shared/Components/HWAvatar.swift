//
//  HWAvatar.swift
//  SwiftUI Heartwood Components
//
//  Created by Ricky Padilla on 8/21/19.
//  Copyright © 2019 Spruce Labs, Inc. All rights reserved.
//

import SwiftUI
import HeartwoodTokens

public struct HWAvatar: View {
  
  public struct Model: Identifiable {
    public let id: String
    public let imageURLString: String
    public var name: String?
    public var text: String?
    public var showIndicator: Bool
    public var status: HWOnlineStatus?
    public var isLarge: Bool
    public var isVertical: Bool
    public init(
      id: String,
      imageURLString: String,
      name: String? = nil,
      text: String? = nil,
      showIndicator: Bool = false,
      status: HWOnlineStatus? = nil,
      isLarge: Bool = false,
      isVertical: Bool = false)
    {
      self.id = id
      self.imageURLString = imageURLString
      self.name = name
      self.text = text
      self.showIndicator = showIndicator
      self.status = status
      self.isLarge = isLarge
      self.isVertical = isVertical
    }
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
    var color: HeartwoodTokens.DynamicColor
    switch status {
    case .offline: color = HeartwoodTokens.Color.textColorPlaceholder
    case .online: color = HeartwoodTokens.Color.textColorCodeGreen
    }
    return HWStyles.dynamicColor(color)
  }
  
  private var neutralColor: Color {
    let dynamicColor = HeartwoodTokens.Color.colorNeutral
    return HWStyles.dynamicColor(dynamicColor)
  }
  
  private var avatarDimension: CGFloat {
    let size = model.isLarge
      ? HeartwoodTokens.ComponentStyle.componentsAvatarSizeLarge
      : HeartwoodTokens.ComponentStyle.componentsAvatarSizeBase
    return CGFloat(size)
  }
  
  private var titleFont: Font {
    let name =  HeartwoodTokens.Font.semibold.name
    let size = model.isLarge
      ? HeartwoodTokens.Font.Size.font3
      : HeartwoodTokens.Font.Size.font2
    return HWStyles.dynamicFont(name: name, size: size)
  }

  private var subtitleFont: Font {
    let name =  HeartwoodTokens.Font.regular.name
    let size = model.isLarge
      ? HeartwoodTokens.Font.Size.font3
      : HeartwoodTokens.Font.Size.font2
    return HWStyles.dynamicFont(name: name, size: size)
  }

  private var titleColor: Color {
    let color = HeartwoodTokens.Color.textColorBase
    return HWStyles.dynamicColor(color)
  }
  
  private var subtitleColor: Color {
    let color = HeartwoodTokens.Color.textColorSubdued
    return HWStyles.dynamicColor(color)
  }
  
  @State public var model: Model
  
  public var body: some View {
    
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
              .stroke(neutralColor, lineWidth: HWStyles.onlineIndicatorStroke)
          )
          .padding([.top, .trailing], model.isLarge ? 8 : 0)
      }
    }
    
    let TextStack = VStack(alignment: model.isVertical ? .center : .leading) {
      if model.name != nil {
        Text(model.name!)
          .font(titleFont)
          .foregroundColor(titleColor)
        
      }
      if model.text != nil {
        Text(model.text!)
          .font(subtitleFont)
          .foregroundColor(subtitleColor)
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
