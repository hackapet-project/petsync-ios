//
//  HomeTabView.swift
//  Hackapet
//
//  Created by FELIPE GADEA LLOPIS on 19/10/24.
//
import SwiftUI

struct HomeTabView: View {
    @Binding var pageSelection: Int
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $pageSelection) {
                MainTabView()
                .tag(0)
                VStack {
                    Circle()
                        .fill(.schemeSecondary)
                        .frame(width: 180)
                        .overlay {
                            Image("detailedDog")
                                .resizable()
                                .frame(width: 160, height: 160)
                        }
                        .padding(20)
                    VStack(spacing: 6) {
                        Text("Simba")
                            .font(.title)
                        Text("Macho 10/6/2005")
                            .fontWeight(.semibold)
                        Text("Necesita comida especial para alergias. \n No se lleva bien con gatos")
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.weekDay)
                            .fontWeight(.light)
                    }
                    .padding(.bottom)
                    HStack {
                        ChipCapsule(text: "Chip")
                        ChipCapsule(text: "Vacunas")
                        ChipCapsule(text: "Desparasitado", success: false)
                    }
                    List {
                        ForEach(0..<3) { index in
                            VStack(alignment: .leading) {
                                Text("Visitas verinarias")
                                    .foregroundStyle(.black)
                                    .padding(.bottom, 2)
                                Text("10/09/2024 - Desparasitación")
                                    .font(.callout)
                                Text("25/07/2024 - Vacunas de refuerzo")
                                    .font(.callout)
                                Text("12/06/2024 - Consulta general")
                                    .font(.callout)
                            }
                            .foregroundStyle(.outline)
                        }
                    }
                    .contentMargins(.bottom, 110)
                    .listStyle(.plain)
                    .scrollIndicators(.never)
                }
                .tag(1)
                VStack {
                    Color.white
                        .overlay {
                            Text("Home 2")
                        }
                }
                .tag(2)
                VStack {
                    Color.white
                        .overlay {
                            Text("Home 3")
                        }
                }
                .tag(3)
            }
            .tabViewStyle(
                .page(indexDisplayMode: .never)
            )
        }
    }
}
