//
//  SettingsView.swift
//  Fructus
//
//  Created by Tim on 08/06/2021.
//

import SwiftUI

struct SettingsView: View {
    //MARK:- PROPERTIES
    
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    
    //MARK:- BODY
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing: 20) {
                    //MARK:- Section 1
                    GroupBox( label: SettingsLabelView(labelText: "Fructus", labelImage: "info.circle"), content: {
                        
                        HStack(alignment: .center, spacing: 10, content: {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)
                            Text("Most fruits are bla bla bla i know bla bla bla thank God for bla bla bla hello mr bla bla sghbs  sjsvb  shjvs")
                                .font(.footnote)
                        })
                    })
                    
                    //MARK:- Section 2
                    
                    GroupBox(label: SettingsLabelView(labelText: "Customization", labelImage: "paintbrush"), content: {
                        Divider().padding(.vertical, 4)
                        Text("if you wish you can toggle the application by toggle the switch in the box. That way it starts the onboarding nd you will see the welcome screen again.")
                            .padding(.vertical, 8)
                            .frame(minHeight: 60)
                            .layoutPriority(1)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                        
                        Toggle(isOn: $isOnboarding, label: {
                            if isOnboarding {
                                Text("Restarted".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                            } else {
                                Text("Restart".uppercased())
                                    .fontWeight(.semibold)
                                    .foregroundColor(.secondary)
                            }
                        })
                        .padding()
                        .background(Color(.tertiarySystemBackground)
                                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        )
                    })
                    
                    //MARK:- Section 3
                    
                    GroupBox(label: SettingsLabelView(labelText: "Application", labelImage: "apps.iphone"), content: {
                        SettingsRowView(name: "Developer", content: "Tim Obeisun")
                        SettingsRowView(name: "Compatibility", content: "iOS 14")
                        SettingsRowView(name: "Company", linkLabel: "Agbora", linkDestination: "www.apple.com")
                        SettingsRowView(name: "SwiftUI", content: "2.0")
                        SettingsRowView(name: "Version", content: "1.1.0")
                        
                    }) // GROUPBOX
                    
                } //: VSTACK
                .navigationBarTitle("Settings", displayMode: .large)
                .navigationBarItems(trailing: Button(action: {presentationMode.wrappedValue.dismiss()}, label: {
                    Image(systemName: "xmark")
                }))
                .padding()
            } //: SCROLL VIEW
        } //: NAVIGATION VIEW
    }
}


//MARK:- PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .previewDevice("iPhone 11 Pro")
            .preferredColorScheme(.dark)
    }
}
