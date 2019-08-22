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
  
  public var body: some View {

    HStack(alignment: .top, spacing: 8) {
    
      if model.selectableType != nil {
        Button(action: { }) {
          HWIcon(name: "").imageScale(.small)
        }
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
            HWAction(id: "0", text: "Undo", icon: "SPIcon.add"),
            HWAction(id: "1", text: "Redo", icon: "SPIcon.settings"),
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
      ]
      return List(testItems) { item in
        HWListItem(model: item)
      }
    }
}
 /*
//
//  SPListItem.swift
//  Spruce
//
//  Created by Ricky Padilla on 8/19/19.
//  Copyright © 2019 Spruce Labs, Inc. All rights reserved.
//

import SwiftUI

struct SPListItem: View {
  
  struct Model: Identifiable {
    let id: String
    var title: String
    var subtitle: String?
    var avatarString: String?
    var icon: SPIcon?
    var toggleId: String?
    var isSeparatorVisible: Bool = true
    var selectableType: SPSelectable?
    var actions: [Action]?
    var contextMenuActions: [Action]?
  }
  
  // TODO: move this out
  struct Action: Identifiable {
    let id: String
    var text: String
    var icon: SPIcon?
    var isIconOnly: Bool = false
  }
  
  private enum Constants {
    static let avatarDimension: CGFloat = 42
  }
  
  private var avatar: UIImage? {
    guard
      // TODO: Use kingfisher
      let avatarString = model.avatarString,
      let url = URL(string: avatarString),
      let data = try? Data(contentsOf: url)
      else {
        return nil
    }

    return UIImage(data: data)
  }
  
  private var checkImageName: String {
    guard let selectableType = model.selectableType else { return "" }
    switch selectableType {
    case .multiSelectable: return "ic_check_box_outline_blank"
    case .singleSelectable: return SPIcon.check_circle.value
    }
  }
  
  @State var model: Model
  
  @State var toggleIsOn: Bool = false
  
  var body: some View {
    HStack(alignment: .top, spacing: 8) {
      
      if model.selectableType != nil {
        Button(action: { }) {
          Image(checkImageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(
              width: 22,
              height: 22,
              alignment: .topTrailing)
            .padding([.top, .bottom], 10)
        }
        
      }
      
      if model.avatarString != nil {
        Image(uiImage: avatar ?? UIImage() )
          .resizable()
          .frame(
            width: Constants.avatarDimension,
            height: Constants.avatarDimension,
            alignment: .topLeading)
          .clipShape(Circle())
      } else if model.icon != nil {
        Button(action: { }) {
          Image(model.icon!.value)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(
              width: 22,
              height: 22,
              alignment: .topTrailing)
            .padding([.top, .bottom], 10)
          }
        .disabled(true)
        .foregroundColor(Color.secondary)
      }
      
      VStack(alignment: .leading) {
        Text(model.title)
          .foregroundColor(Color.primary)
          .font(model.subtitle != nil ? customFont : customFontTwo)
          .font(.headline)
          .lineLimit(nil)
        Text(model.subtitle ?? "")
          .foregroundColor(Color.secondary)
          .font(customFontTwo)
          .lineLimit(nil)
      }
      .layoutPriority(1.0)
      
      Spacer()
      
      if model.contextMenuActions != nil {
        Button(action: { }) {
          Image("navigation-menu-horizontal")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(
            width: 22,
            height: 22,
            alignment: .topTrailing)
          .padding([.top, .bottom], 10)
        }
      } else if model.actions != nil {
        if model.actions!.filter({ $0.icon != nil }).count != model.actions!.count {
          ForEach(model.actions!, id: \.id) { action in
            Button(action: { }) {
              Text("\(action.text)")
            }.frame(width: nil, height: 42, alignment: .center)
          }
        } else {
          ForEach(model.actions!, id: \.id) { action in
            Button(action: { }) {
              Image(action.icon!.value)
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(
                width: 32,
                height: 22,
                alignment: .topTrailing)
              .padding([.top, .bottom], 10)
            }
          }
        }
        
      } else if model.toggleId != nil {
        Toggle(isOn: $toggleIsOn) {
          Text("")
        }
          // TODO: Revisit accentColor once SwiftUI is out of Beta - doesnt work today
          .accentColor(Color(dynamicColor))
          .frame(width: nil, height: 42, alignment: .center)
      }
      
      }
      .foregroundColor(Color(dynamicColor))
  }
}

struct SPEmptyView: View {
  var body: some View {
    Text("")
  }
}

#if DEBUG
struct SPListItem_Previews : PreviewProvider {
    static var previews: some View {
//        SPListItem()
      let testItems = [
        SPListItem.Model(id: "0", title: "One title"),
        SPListItem.Model(
          id: "1",
          title: "Two",
          subtitle: "This here is a subtitle just for you.",
          icon: .edit,
          selectableType: .singleSelectable
        ),
        SPListItem.Model(id: "2", title: "Three", subtitle: "This here is a subtitle just for you. This here is a subtitle just for you. This here is a subtitle just for you. This here is a subtitle just for you."),
        SPListItem.Model(
          id: "3",
          title: "Four",
          subtitle: "This is a subtitle for me.This here is a subtitle just for you. This here is a subtitle just for you.",
          avatarString: "https://randomuser.me/api/portraits/women/65.jpg",
          icon: .edit,
          selectableType: .multiSelectable
        ),
      ]
      List(testItems) { item in
        SPListItem(model: item)
      }

    }
}
#endif

let dynamicColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
  if traitCollection.userInterfaceStyle == .dark {
    return UIColor(red:0.09, green:0.62, blue:0.98, alpha:1.0)
  } else {
    return UIColor(red:0.00, green:0.25, blue:0.75, alpha:1.0)
  }
}

var customFont: Font {
  return Font.custom(Fonts.SourceSansProSemiBold, size: fontSize)
}

var customFontTwo: Font {
  return Font.custom(Fonts.SourceSansPro, size: fontSizeTwo)
}

var fontSize: CGFloat {
  let font = UIFont(name: Fonts.SourceSansProSemiBold, size: 16)!
  let thing = UIFontMetrics(forTextStyle: UIFont.TextStyle.body).scaledFont(for: font)
  return thing.pointSize
}

var fontSizeTwo: CGFloat {
  let font = UIFont(name: Fonts.SourceSansPro, size: 16)!
  let thing = UIFontMetrics(forTextStyle: UIFont.TextStyle.body).scaledFont(for: font)
  return thing.pointSize
}


*/
