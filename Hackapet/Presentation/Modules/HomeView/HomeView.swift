//
//  HomeView.swift
//  Hackapet
//
//  Created by FELIPE GADEA LLOPIS on 19/10/24.
//
import SwiftUI

struct HomeView: View {
    @State var pageSelection: Int = 1
    var body: some View {
        ZStack(alignment: .bottom) {
            HomeTabView(pageSelection: $pageSelection)
            BottomBar(pageSelection: $pageSelection)
        }
    }
}
