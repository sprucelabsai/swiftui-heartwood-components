//
//  ContentView.swift
//  SwiftUI Heartwood Components
//
//  Created by Ricky Padilla on 8/21/19.
//  Copyright © 2019 Spruce Labs, Inc. All rights reserved.
//

import SwiftUI
import HeartwoodTokens

struct ContentView: View {
    var body: some View {
            
//      Image(HeartwoodTokens.Icon.fillGithub, bundle: HeartwoodTokens.bundle)
      
//      Text("Hello world").font(Font.custom(HeartwoodTokens.Font.semibold.name, size: 22))
      
//      let models = [
//        HWAvatar.Model(id: "30", imageURLString: "https://randomuser.me/api/portraits/women/29.jpg"),
//        HWAvatar.Model(
//          id: "31",
//          imageURLString: "https://randomuser.me/api/portraits/women/31.jpg",
//          name: "Brooke Lindstrom"
//        ),
//        HWAvatar.Model(
//          id: "32",
//          imageURLString: "https://randomuser.me/api/portraits/women/32.jpg",
//          name: "Jennifer Mosely",
//          text: "Stylist"
//        ),
//        HWAvatar.Model(
//          id: "33",
//          imageURLString: "https://randomuser.me/api/portraits/women/30.jpg",
//          name: "Katrina Jordan",
//          text: "Owner",
//          showIndicator: true,
//          status: .offline
//        ),
//        HWAvatar.Model(
//          id: "34",
//          imageURLString: "https://randomuser.me/api/portraits/women/34.jpg",
//          name: "Katie Mote",
//          text: "Manager",
//          showIndicator: true,
//          status: .online
//        ),
//        HWAvatar.Model(
//          id: "35",
//          imageURLString: "https://randomuser.me/api/portraits/women/35.jpg",
//          name: "Jill Li",
//          text: "Stylist",
//          showIndicator: true,
//          status: .offline,
//          isLarge: true
//        ),
//        HWAvatar.Model(
//          id: "36",
//          imageURLString: "https://randomuser.me/api/portraits/women/36.jpg",
//          name: "Debra Wallace",
//          text: "Stylist",
//          showIndicator: true,
//          status: .online,
//          isLarge: true,
//          isVertical: true
//        ),
//
//      ]
//      return List(models) { model in
//        HWAvatar(model: model)
//      }
      
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
