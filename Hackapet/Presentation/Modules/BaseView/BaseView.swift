//
//  BaseView.swift
//  Hackapet
//
//  Created by Felipe Gadea Llopis on 18/10/24.
//
import SwiftUI
struct BaseView: View {
    var preview: Bool = false
    @State var showSplash: Bool = true
    
    var body: some View {
        NavigationStack {
            ZStack {
                HomeView()
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
    BaseView(preview: true)
}
