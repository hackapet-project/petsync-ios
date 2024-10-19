//
//  ChipCapsule.swift
//  Hackapet
//
//  Created by FELIPE GADEA LLOPIS on 19/10/24.
//
import SwiftUI

struct ChipCapsule: View {
    let text: String
    var success: Bool = true
    var body: some View {
        HStack {
            Circle()
                .fill(success ? .selectedDay : .outline)
                .frame(width: 24)
                .overlay {
                    Image(systemName: "checkmark")
                        .foregroundStyle(.white)
                }
            Text(text)
        }
        .padding(.leading, 4)
        .padding(.trailing, 16)
        .padding(.vertical, 4)
        .background {
            Capsule()
                .fill(success ? .secondaryContainer : .clear)
                .stroke(success ? .clear : .outline, lineWidth: 1)
                .frame(height: 32)
                
        }
    }
}
