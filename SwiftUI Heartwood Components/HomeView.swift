//
//  HomeView.swift
//  SwiftUI Heartwood Components
//
//  Created by Ricky Padilla on 8/28/19.
//  Copyright © 2019 Spruce Labs, Inc. All rights reserved.
//

import HeartwoodTokens
import SwiftUI

struct HomeView: View {
  
  init() {
    UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: HeartwoodTokens.Font.semibold.name, size: 20)!]
  }
  
  private let items = [
    HWListItem.Model(
      id: "avatar",
      title: "Avatar",
      subtitle: "HWAvatar",
      canPushView: true
    ),
    HWListItem.Model(
      id: "button",
      title: "Button",
      subtitle: "HWButton",
      canPushView: true
    ),
    HWListItem.Model(
      id: "listItem",
      title: "List Item",
      subtitle: "HWListItem",
      canPushView: true
    ),
    HWListItem.Model(
      id: "selectable",
      title: "Checkbox and Ratio Buttons",
      subtitle: "HWSelectButton",
      canPushView: true
    ),
    HWListItem.Model(
      id: "toast",
      title: "Toast",
      subtitle: "HWToast",
      canPushView: true
    ),
  ]

  var body: some View {
    NavigationView {
      List(items) { item in
        ZStack {
          if item.id == "avatar" {
            NavigationLink(destination: AvatarView(), label: {
              EmptyView()
            })
          } else if item.id == "button" {
            NavigationLink(destination: ButtonView(), label: {
              EmptyView()
            })
          } else if item.id == "listItem" {
            NavigationLink(destination: ListItemView(), label: {
              EmptyView()
            })
          } else if item.id == "selectable" {
            NavigationLink(destination: SelectableView(), label: {
              EmptyView()
            })
          } else if item.id == "toast" {
             NavigationLink(destination: ToastView(), label: {
               EmptyView()
             })
           }
          
          HWListItem(model: item)
        }
      }
      .navigationBarTitle(
        Text("SwiftUI Heartwood Components"), displayMode: .inline
      )
    }
  }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
