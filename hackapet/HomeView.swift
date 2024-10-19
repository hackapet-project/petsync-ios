//
//  HomeView.swift
//  hackapet
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

struct BottomBar: View {
    
    let box = UnevenRoundedRectangle( bottomLeadingRadius: 60, bottomTrailingRadius: 60).fill(.white)
    @State var location: CGPoint = .zero
    @Binding var pageSelection: Int
    var body: some View {
                HStack {
                    Spacer()
                    customButton(0)
                    Spacer()
                    customButton(1)
                    Spacer()
                    customButton(2)
                    Spacer()
                    customButton(3)
                    Spacer()
                    
                }
                .frame(height: 90)
                .background(
                    UnevenRoundedRectangle(topLeadingRadius: 30, topTrailingRadius: 30)
                        .fill(.tabBar)
                        .ignoresSafeArea()
                )
                .compositingGroup()
    }
    
    func getIconName(_ index: Int) -> String {
        switch index {
        case 0: "homeIcon"
        case 1: "dogIcon"
        case 2: "metricIcon"
        case 3: "settingsIcon"
        default: ""
        }
    }
    
    func customButton(_ index: Int) -> some View {
            Button {
                withAnimation {
                    pageSelection = index
                }
            } label: {
                if pageSelection == index {
                    ZStack {
                        box.blendMode(.destinationOut)
                                .offset(y: -20)
                        Circle()
                            .fill(.tabSelected)
                            .frame(width: 56, height: 56)
                            .shadow(radius: 4, y: 4)
                            .overlay {
                                Image(getIconName(index))
                                    .resizable()
                                    .frame(width: 32, height: 32)
                            }
                            .offset(y: -20)
                            .transition(.blurReplace)
                    }
                } else {
                    Image(getIconName(index))
                        .resizable()
                        .frame(width: 32, height: 32)
                        .transition(.blurReplace)
                }
            }
        .frame(width: pageSelection == index ? 76 : 56, height: pageSelection == index ? 76 : 56)
    }
}

struct ContentView: View {
    @Binding var pageSelection: Int
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $pageSelection) {
                HomeTabView()
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

struct HomeTabView: View {
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                LazyHStack(alignment: .top, spacing: 15) {
                    addDogButton()
                    dogButton(0)
                    dogButton(1)
                    dogButton(2)
                    dogButton(3)
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
                    monthDay("Lun", "30")
                    monthDay("Mar", "1")
                    monthDay("Mie", "2")
                    monthDay("Jue", "3", true)
                    monthDay("Vie", "4")
                    monthDay("Sab", "5")
                    monthDay("Dom", "6")
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
    }
    
    func monthDay(_ dayName: String, _ dayNum: String, _ isSelected: Bool = false) -> some View {
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
    
    func addDogButton() -> some View {
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
    
    func dogButton(_ dog: Int) -> some View {
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
