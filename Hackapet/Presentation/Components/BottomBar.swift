//
//  BottomBar.swift
//  Hackapet
//
//  Created by FELIPE GADEA LLOPIS on 19/10/24.
//
import SwiftUI

struct BottomBar: View {
    
    let box = UnevenRoundedRectangle( bottomLeadingRadius: 60, bottomTrailingRadius: 60).fill(.white)
    @State var location: CGPoint = .zero
    @Binding var pageSelection: Int
    var body: some View {
                HStack {
                    Spacer()
                    customButton(0)
                    Spacer()
                    customButton(1)
                    Spacer()
                    customButton(2)
                    Spacer()
                    customButton(3)
                    Spacer()
                    
                }
                .frame(height: 90)
                .background(
                    UnevenRoundedRectangle(topLeadingRadius: 30, topTrailingRadius: 30)
                        .fill(.tabBar)
                        .ignoresSafeArea()
                )
                .compositingGroup()
    }
    
    func getIconName(_ index: Int) -> String {
        switch index {
        case 0: "homeIcon"
        case 1: "dogIcon"
        case 2: "metricIcon"
        case 3: "settingsIcon"
        default: ""
        }
    }
    
    func customButton(_ index: Int) -> some View {
            Button {
                withAnimation {
                    pageSelection = index
                }
            } label: {
                if pageSelection == index {
                    ZStack {
                        box.blendMode(.destinationOut)
                                .offset(y: -20)
                        Circle()
                            .fill(.tabSelected)
                            .frame(width: 56, height: 56)
                            .shadow(radius: 4, y: 4)
                            .overlay {
                                Image(getIconName(index))
                                    .resizable()
                                    .frame(width: 32, height: 32)
                            }
                            .offset(y: -20)
                            .transition(.blurReplace)
                    }
                } else {
                    Image(getIconName(index))
                        .resizable()
                        .frame(width: 32, height: 32)
                        .transition(.blurReplace)
                }
            }
        .frame(width: pageSelection == index ? 76 : 56, height: pageSelection == index ? 76 : 56)
    }
}
