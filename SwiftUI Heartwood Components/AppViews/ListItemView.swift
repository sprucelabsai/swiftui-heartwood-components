//
//  ListItemView.swift
//  SwiftUI Heartwood Components
//
//  Created by Ricky Padilla on 8/28/19.
//  Copyright © 2019 Spruce Labs, Inc. All rights reserved.
//

import SwiftUI

struct ListItemView: View {
    var body: some View {
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

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView()
    }
}
