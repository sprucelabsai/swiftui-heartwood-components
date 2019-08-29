//
//  HWListItem.swift
//  SwiftUI Heartwood Components
//
//  Created by Ricky Padilla on 8/21/19.
//  Copyright © 2019 Spruce Labs, Inc. All rights reserved.
//

import HeartwoodTokens
import SwiftUI

public struct HWListItem: View {
  
  public struct Model: Identifiable {
    public let id: String
    public var title: String
    public var subtitle: String?
    public var avatarString: String?
    public var icon: String?
    public var toggleId: String?
    public var isSeparatorVisible: Bool
    public var selectableType: HWSelectable?
    public var actions: [HWAction]?
    public var contextMenuActions: [HWAction]?
    public var canPushView: Bool
    public init(
      id: String,
      title: String,
      subtitle: String? = nil,
      avatarString: String? = nil,
      icon: String? = nil,
      toggleId: String? = nil,
      isSeparatorVisible: Bool = true,
      selectableType: HWSelectable? = nil,
      actions: [HWAction]? = nil,
      contextMenuActions: [HWAction]? = nil,
      canPushView: Bool = false)
    {
      self.id = id
      self.title = title
      self.subtitle = subtitle
      self.avatarString = avatarString
      self.icon = icon
      self.toggleId = toggleId
      self.isSeparatorVisible = isSeparatorVisible
      self.selectableType = selectableType
      self.actions = actions
      self.contextMenuActions = contextMenuActions
      self.canPushView = canPushView
    }
  }
  
  private var titleFont: Font {
    let name =  HeartwoodTokens.Font.semibold.name
    let size = HeartwoodTokens.Font.Size.font2
    return HWStyles.dynamicFont(name: name, size: size)
  }

  private var subtitleFont: Font {
    let name =  HeartwoodTokens.Font.regular.name
    let size = HeartwoodTokens.Font.Size.font2
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
  
  private var buttonColor: Color {
    let color = HeartwoodTokens.Color.colorPrimaryBase
    return HWStyles.dynamicColor(color)
  }
  
  private var iconColor: Color {
    let color = HeartwoodTokens.Color.textColorSubdued
    return HWStyles.dynamicColor(color)
  }
  
  private var selectableIcon: String {
    guard let selectableType = model.selectableType else { return "" }
    switch selectableType {
    case .multiSelectable:
      return HeartwoodTokens.Icon.fillCheckBoxOutlineBlank //  HeartwoodTokens.Icon.fillCheckBox
    case .singleSelectable:
      return HeartwoodTokens.Icon.fillRadioButtonUnchecked
    }
    
  }
  
  public var model: Model
  public init(model: Model){
    self.model = model
  }
  
  @State var toggleIsOn: Bool = false // TODO REMOVE THIS
  
  public var body: some View {
    HStack(alignment: .top, spacing: 8) {
      if model.selectableType != nil {
        HWSelectButton(selectableType: model.selectableType!)
          .accessibility(label: Text(model.title))
      }
      if model.avatarString != nil {
        HWAvatar(model:
          HWAvatar.Model(
            id: model.id,
            imageURLString: model.avatarString!
        ))
      } else if model.icon != nil {
        Button(action: { }) {
          HWIcon(name: HWIcon.getIconName(from: model.icon!))
            .foregroundColor(iconColor)
          }
        .disabled(true)
      }
      VStack(alignment: .leading) {
        Text(model.title)
          .font(titleFont)
          .foregroundColor(titleColor)
        if model.subtitle != nil {
          Text(model.subtitle!)
            .font(subtitleFont)
            .foregroundColor(subtitleColor)
        }
      }
      .layoutPriority(1.0)
      Spacer()
      if model.canPushView == true {
        Button(action: { }) {
          HWIcon(name: HeartwoodTokens.Icon.fillKeyboardArrowRight)
            .accessibility(addTraits: .causesPageTurn)
            .foregroundColor(self.subtitleColor)
        }
        .frame(width: nil, height: 42, alignment: .center)
      } else if model.contextMenuActions != nil {
        Button(action: { }) {
          HWIcon(name: HeartwoodTokens.Icon.more)
          .foregroundColor(self.buttonColor)
        }
        .frame(width: nil, height: 42, alignment: .center)
      } else if model.actions != nil {
        if model.actions!.filter({ $0.icon != nil }).count != model.actions!.count {
          ForEach(model.actions!, id: \.id) { action in
            Button(action: { }) {
              Text("\(action.text)")
                .font(self.subtitleFont)
                .foregroundColor(self.buttonColor)
            }
            .frame(width: nil, height: 42, alignment: .center)
          }
        } else {
          ForEach(model.actions!, id: \.id) { action in
            Button(action: { }) {
              HWIcon(name: HWIcon.getIconName(from: action.icon!))
                .foregroundColor(self.buttonColor)
            }
            .frame(width: nil, height: 42, alignment: .center)
          }
        }
      } else if model.toggleId != nil {
        Toggle(isOn: $toggleIsOn) {
          Text("")
        }
          // TODO: Revisit accentColor once SwiftUI is out of Beta - doesnt work today
          .frame(width: nil, height: 42, alignment: .center)
      }
    }
  }
  
}

struct HWListItem_Previews: PreviewProvider {
    static var previews: some View {
      let testItems = [
        HWListItem.Model(id: "0", title: "A title and nothing else"),
        HWListItem.Model(
          id: "1",
          title: "Radio button thing",
          subtitle: "This here is a subtitle just for you.",
          selectableType: .singleSelectable
        ),
        HWListItem.Model(
          id: "2",
          title: "Three",
          subtitle: "This here is a subtitle just for you. This here is a subtitle just for you. This here is a subtitle just for you. This here is a subtitle just for you.",
          selectableType: .multiSelectable
        ),
        HWListItem.Model(
          id: "3",
          title: "Jessica Lee Wilson",
          subtitle: "Stylist",
          avatarString: "https://randomuser.me/api/portraits/women/65.jpg",
          canPushView: true
          ),
        HWListItem.Model(
          id: "4",
          title: "Dark mode enabled",
          subtitle: "Is the dark mode enabled?",
          toggleId: "dark"
          ),
        HWListItem.Model(
          id: "5",
          title: "The Regular",
          subtitle: "$32.55 | 45 min",
          icon: "calendar"
          ),
        HWListItem.Model(
          id: "6",
          title: "The Regular",
          subtitle: "$32.55 | 45 min",
          actions: [
            HWAction(id: "0", text: "Undo"),
            HWAction(id: "1", text: "Redo"),
          ]
          ),
        HWListItem.Model(
          id: "7",
          title: "LaKesha Iverness",
          subtitle: "Stylist",
          avatarString: "https://randomuser.me/api/portraits/women/71.jpg",
          contextMenuActions: [
            HWAction(id: "0", text: "Undo", icon: "add"),
            HWAction(id: "1", text: "Redo", icon: "settings"),
          ]
          ),
        HWListItem.Model(
          id: "8",
          title: "LaKesha Iverness",
          subtitle: "Stylist",
          avatarString: "https://randomuser.me/api/portraits/women/71.jpg",
          actions: [
            HWAction(id: "0", text: "Undo", icon: "add"),
            HWAction(id: "1", text: "Redo", icon: "settings"),
          ]
          ),
      ]
      return List(testItems) { item in
        HWListItem(model: item)
      }
    }
}
