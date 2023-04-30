//
//  FASettings.swift
//  Fructus
//
//  Created by Jaimon, Bibin on 29/04/23.
//

import SwiftUI

struct FASettings: View {
    
    @Environment(\.presentationMode) var presentationMode
    
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
        
        VStack {
            HStack {
                Text("Application".uppercased())
                Spacer()
                Image(systemName: "xmark")
            }
            
            Divider()
            HStack {
                
                Text("Developer")
                    .foregroundColor(.gray)
                Spacer()
                Image(systemName: "xmark")
            }
            
            
            
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
                    
                    GroupBox() {
                        infoView
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
