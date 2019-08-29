//
//  AvatarView.swift
//  SwiftUI Heartwood Components
//
//  Created by Ricky Padilla on 8/28/19.
//  Copyright © 2019 Spruce Labs, Inc. All rights reserved.
//

import SwiftUI

struct AvatarView: View {
    var body: some View {
        let models = [
          HWAvatar.Model(id: "30", imageURLString: "https://randomuser.me/api/portraits/women/29.jpg"
          ),
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
            .padding()
      }
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView()
    }
}
