//
//  AddDogButton.swift
//  Hackapet
//
//  Created by FELIPE GADEA LLOPIS on 19/10/24.
//
import SwiftUI

struct AddDogButton: View {
    var body: some View {
        Button {
            print("add")
        } label: {
            Circle().fill(.schemeSecondary)
                .frame(width: 92)
                .shadow(radius: 4, y: 4)
                .overlay {
                    Image(systemName: "plus")
                }
                .foregroundStyle(.black)
        }
    }
}
