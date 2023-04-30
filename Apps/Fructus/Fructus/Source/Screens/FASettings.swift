//
//  FASettings.swift
//  Fructus
//
//  Created by Jaimon, Bibin on 29/04/23.
//

import SwiftUI

struct FASettings: View {
    
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isOnboarded") var isOnboarded: Bool = true
    
    var groupBoxHeader: some View {
        HStack {
            Text("Fructus")
            Spacer()
            Image(systemName: "info.circle")
        }
    }
    
    var navBarItemTrailing: some View {
        FAButton(
            imageName: "xmark",
            handler: { presentationMode.wrappedValue.dismiss() }
        )
    }
    
    var infoView: some View {
        let data = InfoCardModel.getInfoCardViewData()
        
        struct ImageViewModifier: ViewModifier {
            func body(content: Content) -> some View {
                content.foregroundColor(.red)
            }
        }
        
        struct LeftTextViewModifier: ViewModifier {
            func body(content: Content) -> some View {
                content.foregroundColor(.gray)
            }
        }
        struct RightTextViewModifier: ViewModifier {
            func body(content: Content) -> some View {
                content.foregroundColor(.white)
            }
        }
        struct SettingsInfoCardViewStyleDataSource: InfoCardViewStyleDataSource {
            var leftImageModifiers: some ViewModifier {
                ImageViewModifier()
            }
            
            var leftTextModifiers: some ViewModifier {
                LeftTextViewModifier()
            }
            
            var rightTextModifiers: some ViewModifier {
                RightTextViewModifier()
            }
            
            var rightImageModifiers: some ViewModifier {
                ImageViewModifier()
            }
        }
        
        return ForEach(data) { item in
            InfoCardView(dataSource: item, modifiers: SettingsInfoCardViewStyleDataSource())
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    GroupBox(label: groupBoxHeader) {
                        Divider().padding(.vertical, 4)
                        HStack {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80)
                                .cornerRadius(9)
                            Text ("Most fruits are naturally low in fat, sodium, and calories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins, and much more.")
                                .font(.footnote)
                        }
                    }
                    
                    GroupBox(label: HStack {
                        Text("Customization".uppercased())
                        Spacer()
                        Image(systemName: "paintbrush")
                    }
                        .padding(.horizontal, 2)
                        .padding(.vertical, 4)) {
                            Text("If you wish you can restart the application by toogle the switch in this box. That way it starts the onboarding process and you will see the welcome screen again")
                                .padding(.vertical, 8)
                                .frame(minHeight: 60)
                                .layoutPriority(1)
                                .font(.footnote)
                                .multilineTextAlignment(.leading)
                            
                            Toggle(isOn: $isOnboarded) {
                                if isOnboarded {
                                    Text("Onboarded".uppercased())
                                        .fontWeight(.bold)
                                        .foregroundColor(.green)
                                } else {
                                    Text("Show Onboard".uppercased())
                                        .fontWeight(.bold)
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding()
                            .background(
                                Color(UIColor.tertiarySystemBackground)
                                    .clipShape(
                                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                                    )
                            )
                        }
                    GroupBox {
                        infoView
                    } label: {
                        HStack {
                            Text("Applicaton".uppercased())
                            Spacer()
                            Image(systemName: "apps.iphone")
                        }
                        .padding(.horizontal, 2)
                        .padding(.vertical, 4)
                        
                    }
                    
                }
                .padding(.horizontal, 8)
                .navigationBarTitle("Settings", displayMode: .large)
                .navigationBarItems(trailing: navBarItemTrailing)
            }
        }
    }
}

struct FASettings_Previews: PreviewProvider {
    static var previews: some View {
        FASettings()
            .preferredColorScheme(.dark)
    }
}
