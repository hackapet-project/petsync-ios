//
//  SplashView.swift
//  hackapet
//
//  Created by Felipe Gadea Llopis on 18/10/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack {
            Rectangle()
                .fill(.clear)
                .overlay {
                    Image("logo")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                }
        }
        .padding()
        .background(.baseBlue)
    }
}

#Preview {
    SplashView()
}
