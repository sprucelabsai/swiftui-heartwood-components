//
//  HWListItem.swift
//  SwiftUI Heartwood Components
//
//  Created by Ricky Padilla on 8/21/19.
//  Copyright © 2019 Spruce Labs, Inc. All rights reserved.
//

import SwiftUI

public struct HWListItem: View {
  
  public struct Model: Identifiable {
    public let id: String
    var title: String
    var subtitle: String?
    var avatarString: String?
    var icon: String?
    var toggleId: String?
    var isSeparatorVisible: Bool = true
    var selectableType: HWSelectable?
    var actions: [HWAction]?
    var contextMenuActions: [HWAction]?
  }
  
  @State var model: Model
  
  @State var toggleIsOn: Bool = false // TODO REMOVE THIS
  
  public var body: some View {
    HStack(alignment: .top, spacing: 8) {
      if model.selectableType != nil {
        Button(action: { }) {
          HWIcon(name: "")
        }
      }
      if model.avatarString != nil {
        HWAvatar(model:
          HWAvatar.Model(
            id: model.id,
            imageURLString: model.avatarString!
        ))
      } else if model.icon != nil {
        Button(action: { }) {
          HWIcon(name: model.icon!)
          }
        .disabled(true)
//        .foregroundColor(Color.secondary)
      }
      VStack(alignment: .leading) {
        Text(model.title)
        if model.subtitle != nil {
          Text(model.subtitle!)
        }
      }
      .layoutPriority(1.0)
      Spacer()
      if model.contextMenuActions != nil {
        Button(action: { }) {
          HWIcon(name: "")
        }
      } else if model.actions != nil {
        if model.actions!.filter({ $0.icon != nil }).count != model.actions!.count {
          ForEach(model.actions!, id: \.id) { action in
            Button(action: { }) {
              Text("\(action.text)")
            }
            .frame(width: nil, height: 42, alignment: .center)
          }
        } else {
          ForEach(model.actions!, id: \.id) { action in
            Button(action: { }) {
              HWIcon(name: action.icon!)
            }
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
          avatarString: "https://randomuser.me/api/portraits/women/65.jpg"
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
            HWAction(id: "0", text: "Undo", icon: "SPIcon.add"),
            HWAction(id: "1", text: "Redo", icon: "SPIcon.settings"),
          ]
          ),
        HWListItem.Model(
          id: "8",
          title: "LaKesha Iverness",
          subtitle: "Stylist",
          avatarString: "https://randomuser.me/api/portraits/women/71.jpg",
          actions: [
            HWAction(id: "0", text: "Undo", icon: "SPIcon.add"),
            HWAction(id: "1", text: "Redo", icon: "SPIcon.settings"),
          ]
          ),
      ]
      return List(testItems) { item in
        HWListItem(model: item)
      }
    }
}
