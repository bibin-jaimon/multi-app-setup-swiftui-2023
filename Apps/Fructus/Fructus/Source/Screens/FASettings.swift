//
//  FASettings.swift
//  Fructus
//
//  Created by Jaimon, Bibin on 29/04/23.
//

import SwiftUI

struct FASettings: View {
    
    @Environment(\.presentationMode) var presentationMode
    @AppStorage(AppStorageKeys.isOnboarded) var isOnboarded: Bool = true
    
    var groupBoxHeader: some View {
        HStack {
            Text(FAStrings.fructus)
            Spacer()
            Image(systemName: ImageNames.infoCircle)
        }
    }
    
    var navBarItemTrailing: some View {
        FAButton(
            imageName: ImageNames.xMark,
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
    
    private var aboutGroup: some View {
        GroupBox(label: groupBoxHeader) {
            Divider().padding(.vertical, 4)
            HStack {
                Image(ImageNames.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80)
                    .cornerRadius(9)
                Text(FAStrings.about)
                    .font(.footnote)
            }
        }
    }
    
    private var cutomizationHeading: some View {
        HStack {
            Text(FAStrings.customization.uppercased())
            Spacer()
            Image(systemName: ImageNames.paintbrush)
        }
        .padding(.horizontal, 2)
        .padding(.vertical, 4)
    }
    
    private var customizationBody: some View {
        let background = Color(UIColor.tertiarySystemBackground)
            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
        return Group {
            Text(FAStrings.resetDescription)
                .padding(.vertical, 8)
                .frame(minHeight: 60)
                .layoutPriority(1)
                .font(.footnote)
                .multilineTextAlignment(.leading)
            
            Toggle(isOn: $isOnboarded) {
                if isOnboarded {
                    Text(FAStrings.onboarded.uppercased())
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                } else {
                    Text(FAStrings.showOnboard.uppercased())
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(background)
        }
    }
    
    private var infoViewHeading: some View {
        HStack {
            Text(FAStrings.application.uppercased())
            Spacer()
            Image(systemName: ImageNames.appsIphone)
        }
        .padding(.horizontal, 2)
        .padding(.vertical, 4)
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    aboutGroup
                    GroupBox(label: cutomizationHeading) { customizationBody }
                    GroupBox { infoView } label: { infoViewHeading }
                    
                }
                .padding(.horizontal, 8)
                .navigationBarTitle(FAStrings.settings, displayMode: .large)
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
