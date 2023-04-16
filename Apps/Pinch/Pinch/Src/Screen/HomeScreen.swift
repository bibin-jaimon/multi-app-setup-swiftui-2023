//
//  HomeScreen.swift
//  Pinch
//
//  Created by Jaimon, Bibin on 19/03/23.
//

import SwiftUI
import StringsPluginAPI
import ElementsPluginAPI

public struct HomeScreen: View {
    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset: CGSize = .zero
    
    let pages: [PageModel] = createPageData()
    @State private var pageIndex: Int = 0
    public var body: some View {
        NavigationView {
            ZStack {
                Color.clear
                mainImageContainer
                    .gesture(dragGesture)
                    .gesture(magnificationGesture)
            }
            .navigationTitle(PinchConstants.pinchNZoom)
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                withAnimation(.linear(duration: 1)) {
                    isAnimating = true
                }
            }
            .overlay(
                infoPanelViewOverlay,
                alignment: .top
            )
            .overlay(
                controlCenterOverlay,
                alignment: .bottom
            )
            ///Drawer
            .overlay(
                drawerViewOverlay,
                alignment: .topTrailing
            )
        } //Navigation
        .navigationViewStyle(.stack)
    }

    public init() {}

}

extension HomeScreen {
    
    private var mainImageContainer: some View {
        PinchAssets.getImage(name: pages[pageIndex].imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(10)
            .padding()
            .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y:2)
            .opacity(isAnimating ? 1 : 0)
            .offset(x: imageOffset.width, y: imageOffset.height)
            .scaleEffect(imageScale)
            .onTapGesture(count: 2, perform: {
                if imageScale == 1 {
                    withAnimation {
                        imageScale = 5
                    }
                } else {
                    withAnimation {
                        resetImageState()
                    }
                }
            })
    }
    
    private var dragGesture: some Gesture {
        DragGesture()
            .onChanged({ value in
                withAnimation {
                    imageOffset = value.translation
                }
            })
            .onEnded({ _ in
                if imageScale <= 1 {
                    withAnimation(.spring()) {
                        resetImageState()
                    }
                }
            })
    }
    
    private var magnificationGesture: some Gesture {
        MagnificationGesture()
            .onChanged({ value in
                withAnimation {
                    if imageScale >= 1 && imageScale <= 5 {
                        imageScale = value
                    } else if imageScale > 5 {
                        imageScale = 5
                    }
                }
            })
            .onEnded({ _ in
                if imageScale > 5 {
                    imageScale = 5
                } else if imageScale <= 1 {
                    resetImageState()
                }
            })
    }
    
    private var controlCenterOverlay: some View {
        Group {
            HStack {
                ControlImageViewButton(controlImageView: ControlImageView(icon: "minus.magnifyingglass")) {
                    withAnimation(.spring()) {
                        if imageScale > 1 {
                            imageScale -= 1
                        }
                        
                        if imageScale <= 1 {
                            resetImageState()
                        }
                    }
                }
                
                ControlImageViewButton(controlImageView: ControlImageView(icon: "arrow.up.left.and.down.right.magnifyingglass")) {
                    withAnimation(.spring()) {
                        resetImageState()
                    }
                }
                
                ControlImageViewButton(controlImageView: ControlImageView(icon: "plus.magnifyingglass")) {
                    withAnimation(.spring()) {
                        if imageScale < 5 {
                            imageScale += 1
                        }
                        
                        if imageScale > 5 {
                            imageScale = 5
                        }
                    }
                }
                
            }
            .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
            .background(.ultraThinMaterial)
            .cornerRadius(12)
            .opacity(isAnimating ? 1 : 0)
        }.padding(.bottom, 30)
    }
    
    private var drawerViewOverlay: some View {
        DrawerView(animating: isAnimating) {
            ForEach(pages) { item in
                Image(item.thumbImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80)
                    .cornerRadius(8)
                    .shadow(radius: 4)
                    .onTapGesture {
                        isAnimating = true
                        pageIndex = item.id
                    }
                    
            }
        }
        .padding(.top, UIScreen.main.bounds.height / 12)
    }
    
    private var infoPanelViewOverlay: some View {
        InfoPanelView(scale: imageScale, offset: imageOffset)
            .padding(.horizontal)
            .padding(.top, 30)
    }

    private func resetImageState() {
        imageScale = 1
        imageOffset = .zero
    }
    
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
