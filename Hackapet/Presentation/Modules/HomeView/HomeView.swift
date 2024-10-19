//
//  HomeView.swift
//  Hackapet
//
//  Created by Felipe Gadea Llopis on 18/10/24.
//
import SwiftUI
struct HomeView: View {
    var preview: Bool = false
    @State var showSplash: Bool = true
    @State var pageSelection: Int = 1
    
    var body: some View {
        NavigationStack {
            ZStack {
                ZStack(alignment: .bottom) {
                    ContentView(pageSelection: $pageSelection)
                    BottomBar(pageSelection: $pageSelection)
                }
                if showSplash, !preview {
                    SplashView()
                        .transition(
                            .scale(scale: 10)
                            .combined(with: .opacity)
                        )
                }
            }
        }
        .task {
            guard !preview else { return }
            try? await Task.sleep(for: .seconds(2))
            withAnimation {
                showSplash = false
            }
        }
    }
}

#Preview {
    HomeView(preview: true)
}
