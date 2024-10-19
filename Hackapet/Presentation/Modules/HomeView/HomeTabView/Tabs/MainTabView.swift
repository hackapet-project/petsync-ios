//
//  MainTabView.swift
//  Hackapet
//
//  Created by FELIPE GADEA LLOPIS on 19/10/24.
//
import SwiftUI

struct MainTabView: View {
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                LazyHStack(alignment: .top, spacing: 15) {
                    AddDogButton()
                    DogButton(dog: 0)
                    DogButton(dog: 1)
                    DogButton(dog: 2)
                    DogButton(dog: 3)
                }
                .padding(.horizontal, 16)
                .padding(.top, 20)
            }.frame(height: 150)
                .scrollIndicators(.never)
                .scrollClipDisabled()
            VStack {
                HStack {
                    Image(systemName: "arrow.left")
                        .padding(.leading, 32)
                    Spacer()
                    VStack {
                        Text("Octubre")
                            .fontWeight(.semibold)
                        Text("2024")
                            .fontWeight(.light)
                    }
                    Spacer()
                    Image(systemName: "arrow.right")
                        .padding(.trailing, 32)
                }
                HStack {
                    WeekDay(dayName: "Lun", dayNum: "30")
                    WeekDay(dayName: "Mar", dayNum: "1")
                    WeekDay(dayName: "Mie", dayNum: "2")
                    WeekDay(dayName: "Jue", dayNum: "3", isSelected: true)
                    WeekDay(dayName: "Vie", dayNum: "4")
                    WeekDay(dayName: "Sab", dayNum: "5")
                    WeekDay(dayName: "Dom", dayNum: "6")
                }
                .padding(.top, 12)
                ScrollView {
                    ForEach(0..<5) { index in
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Circle().fill(.corporateGreen)
                                    .frame(width: 10)
                                Text("10:30")
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.weekDay)
                                Spacer()
                                Button {
                                    print("options")
                                } label: {
                                    Image(systemName: "ellipsis")
                                        .foregroundStyle(.weekDay)
                                }
                                
                            }
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Visita de posible adoptante")
                                    .fontWeight(.semibold)
                                Text("interesados en rocky")
                                    .fontWeight(.light)
                                    .foregroundStyle(.weekDay)
                            }
                            .padding(.bottom, 6)
                            
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 16).fill(.schemeSurface))
                        .padding(.vertical, 6)
                    }
                }
                .contentMargins(.bottom, 110)
                .scrollIndicators(.never)
                .padding(.top)
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
        }
        .task {
            let animalsUseCase = DependencyContainer.getAnimalsUseCase()
            _ = try? await animalsUseCase.execute(1)
        }
    }
}
