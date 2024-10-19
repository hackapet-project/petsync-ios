//
//  DogButton.swift
//  Hackapet
//
//  Created by FELIPE GADEA LLOPIS on 19/10/24.
//
import SwiftUI

struct DogButton: View {
    var dog: Int
    var body: some View {
        VStack(spacing: 10) {
            Circle().fill(.schemeSecondary)
                .frame(width: 92)
                .shadow(radius: 4, y: 4)
                .overlay {
                    switch dog {
                    case 0,2:
                        Image("sampleDog1")
                            .resizable()
                            .frame(width: 82, height: 82)
                    case 1,3:
                        Image("sampleDog2")
                            .resizable()
                            .frame(width: 82, height: 82)
                    default: Image("sampleDog2")
                            .resizable()
                            .frame(width: 82, height: 82)
                    }
                }
            switch dog {
            case 0:
                Text("Nala")
                    .fontWeight(.semibold)
            case 1:
                Text("Coco")
                    .fontWeight(.semibold)
            case 2:
                Text("Simba")
                    .fontWeight(.semibold)
            case 3:
                Text("Dobby")
                    .fontWeight(.semibold)
            default: Text("Nala")
                    .fontWeight(.semibold)
            }
        }
    }
}
