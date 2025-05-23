//
//  ContentView.swift
//  Pinch
//
//  Created by Abdulgafur Demirci on 18.04.2025.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    
    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset: CGSize = .zero
    @State private var isDrawerOpen: Bool = false
    
    let pages: [Page] = pagesData
    @State private var pageIndex: Int = 1
    
    // MARK: - FUNCTIONS
    
    func resetImageState() {
        return withAnimation(.spring()) {
            self.imageOffset = .zero
            self.imageScale = 1
        }
    }
    
    func currentPage() -> String {
        return pages[pageIndex - 1].imageName
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color.clear
                
                // MARK: - PAGE IMAGE
                Image(currentPage())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(x: imageOffset.width, y: imageOffset.height)
                    .scaleEffect(imageScale)
                // MARK: - 1. TAP GESTURE
                    .onTapGesture(count: 2) {
                        if self.imageScale == 1 {
                            withAnimation(.spring) {
                                self.imageScale = 5
                            }
                        } else {
                            resetImageState()
                        }
                    }
                // MARK: - 2. DRAG GESTURE
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                withAnimation(.linear(duration: 1)) {
                                    self.imageOffset = value.translation
                                }
                            }
                            .onEnded { _ in
                                if imageScale <= 1 {
                                    resetImageState()
                                }
                                
                            }
                    )
                // MARK: - 3. MAGNIFICATION
                    .gesture(
                        MagnificationGesture()
                            .onChanged({ value in
                                withAnimation(.linear(duration: 1)) {
                                    if self.imageScale >= 1 && self.imageScale <= 5 {
                                        self.imageScale = value
                                    } else if self.imageScale > 5 {
                                        self.imageScale = 5
                                    }
                                }
                            })
                            .onEnded { _ in
                                if self.imageScale > 5 {
                                    self.imageScale = 5
                                } else if self.imageScale <= 1 {
                                    resetImageState()
                                }
                            }
                    )
            } //: ZSTACK
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                withAnimation(.linear(duration: 1)) {
                    self.isAnimating = true
                }
            }
            // MARK: - INFO PANEL
            .overlay(
                InfoPanelView(scale: imageScale, offset: imageOffset)
                    .padding(.horizontal)
                    .padding(.top, 30)
                , alignment: .top
            )
            // MARK: - CONTROLS
            .overlay(
                Group {
                    HStack {
                        // MARK: - SCALE DOWN
                        
                        Button(action: {
                            withAnimation(.spring()) {
                                if self.imageScale > 1 {
                                    self.imageScale -= 1
                                    
                                    if self.imageScale <= 1 {
                                        resetImageState()
                                    }
                                }
                            }
                            
                        },label: {
                            ControlImageView(icon: "minus.magnifyingglass")
                        })
                        
                        // MARK: - RESET
                        
                        Button(action: {
                                resetImageState()
                        },label: {
                            ControlImageView(icon: "arrow.up.left.and.down.right.magnifyingglass")
                        })
                        
                        // MARK: - SCALE UP
                        
                        Button(action: {
                            withAnimation(.spring()) {
                                if self.imageScale < 5 {
                                    self.imageScale += 1
                                    
                                    if self.imageScale > 5 {
                                        self.imageScale = 5
                                    }
                                }
                            }
                        },label: {
                            ControlImageView(icon: "plus.magnifyingglass")
                        })
                        
                    } //: CONTROLS
                    .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .opacity(isAnimating ? 1 : 0)
                }
                .padding(.bottom, 30),
                alignment: .bottom
            )
            .overlay(
                HStack(spacing: 12) {
                    // MARK: - DRAWER HANDLE
                    
                    Image(systemName: isDrawerOpen ? "chevron.compact.right" : "chevron.compact.left")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                        .padding(8)
                        .foregroundColor(.secondary)
                        .onTapGesture {
                            withAnimation(.easeOut) {
                                self.isDrawerOpen.toggle()
                            }
                        }
                    
                    
                    // MARK: - THUMBNAILS
                    
                    ForEach(pages) { page in
                        Image(page.thumbnailName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .shadow(radius: 4)
                            .opacity(isDrawerOpen ? 1 : 0)
                            .animation(.easeOut(duration: 0.5), value: isDrawerOpen)
                            .onTapGesture {
                                self.isAnimating = true
                                self.pageIndex = page.id
                                withAnimation(.easeOut) {
                                    self.isDrawerOpen = false
                                }
                            }
                    }
                    
                    Spacer()
                } //: DRAWER
                .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .opacity(isAnimating ? 1 : 0)
                .frame(width: 260)
                .padding(.top, UIScreen.main.bounds.height / 12)
                .offset(x: isDrawerOpen ? 20 : 215)
                , alignment: .topTrailing
            )
        } //: NAVIGATION
    }
}

#Preview {
    ContentView()
}
