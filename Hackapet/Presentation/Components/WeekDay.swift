//
//  WeekDay.swift
//  Hackapet
//
//  Created by FELIPE GADEA LLOPIS on 19/10/24.
//
import SwiftUI

struct WeekDay: View {
    let dayName: String
    let dayNum: String
    var isSelected: Bool = false
    
    var body: some View {
        VStack(spacing: 12) {
            Text(dayName)
                .foregroundStyle(.weekDay)
            Text(dayNum)
                .background {
                    if isSelected {
                        Circle()
                            .fill(.selectedDay)
                            .frame(width: 30, height: 30)
                    }
                }
                .foregroundStyle(isSelected ? .white : .black)
        }
        .padding(.horizontal, 8)
    }
}
