//
//  SettingsView.swift
//  Hike
//
//  Created by Hưng Trần on 19/12/2023.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    private let alternateAppIcons: [String] = [
    "AppIcon-MagnifyingGlass",
    "AppIcon-Backpack",
    "AppIcon-Camera",
    "AppIcon-Campfire",
    "AppIcon-Map",
    "AppIcon-Mushroom",
    ]
    var body: some View {
        List{
            // MARK: - SECTION: HEADER
            Section{
                HStack {
                    Spacer()
                    
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80,weight: .black))
                    
                    VStack {
                        Text("Hike")
                            .font(.system(size: 66,weight: .black))
                        
                        Text("Editors' Choice")
                            .fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80,weight: .black))
                    
                    Spacer()
                }
                .foregroundStyle(LinearGradient(colors: [.customGreenLight,.customGreenMedium,.customGreenDark], startPoint: .top, endPoint: .bottom))
                .padding(.top,8)
                VStack(spacing: 8){
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    Text("The hike which looks gorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in the app.")
                        .font(.footnote)
                        .italic()
                    Text("Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }//: HEADER SECTION
            .listRowSeparator(.hidden)
            //MARK: - SECTION: ICONS
            Section(header: Text("Alternate Icons")){
                ScrollView(.horizontal, showsIndicators:false){
                    HStack(spacing: 12) {
                        ForEach(alternateAppIcons.indices, id: \.self) { item in
                            Button{
                                print("Icon \(alternateAppIcons[item]) was pressed.")
                                
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]){
                                    error in
                                    if error != nil{
                                        print("Failed request to update the app's icon: \(String(describing: error?.localizedDescription))")
                                              }else{
                                            print("Succes! you have changed the app's icon to \(alternateAppIcons[item])")
                                        }
                                }
                            }label: {
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80,height: 80)
                                    .cornerRadius(16)
                            }
                        .buttonStyle(.borderless)
                        }
                    }
                }//: ScrollView
                .padding(.top, 12)
                Text("Choose your favourite app icon from the collection above.")
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom, 12)
            }
            .listRowSeparator(.hidden)
            //MARK: -SECTION: ABOUT
            Section(
                header: Text("ABOUT THE APP"),
                footer: HStack{
                    Spacer()
                    Text("Copyright © All right reserved.")
                    Spacer()
                }
                    .padding(.vertical, 8)
                ){
                    // 1. Basic labeled content
                    // LabeledContent("Application", value:"Hike")
                    // 2. advanced labeled content
                    CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "Hike", rowTintColor: .blue)
                    CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS,iPadOS", rowTintColor: .red)
                    CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                    CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                    CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Hung Tran", rowTintColor: .mint)
                    CustomListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Robert Petras", rowTintColor: .pink)
                    CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowTintColor: .indigo,rowLinkLabel: "Credo Academy",rowLinkDestination: "https://credo.academy")
            }
        }//: LIST
    }
}

#Preview {
    SettingsView()
}
