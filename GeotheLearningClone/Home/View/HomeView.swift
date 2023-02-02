//
//  HomeView.swift
//  GeotheLearningClone
//
//  Created by Palnar on 12/01/23.
//

import SwiftUI

struct HomeView: View {
    @State var buttonSelected: Bool = false
    @State var centreButtonSelected: Bool = false
    @State var selectedCity = Utilities.shared.selectedCity
    var body: some View {
        NavigationView{
            ZStack(alignment: .trailing){
                MainView(buttonSelected: $buttonSelected, centerButtonSelected: $centreButtonSelected, selectedCity: selectedCity, backButton: false)
                
                HomeGridView()
                
                if buttonSelected{
                    ProfileBalloonView()
                }
                
                if centreButtonSelected{
                    CitySelectionView(selectedCity: $selectedCity)
                }
            }
            .onTapGesture(perform: {
                centreButtonSelected = false
                buttonSelected = false
            })
            .ignoresSafeArea(.container, edges: .bottom)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct CitySelectionView: View {
    
    @Binding var selectedCity: String
    var cities = Utilities.shared.cities
    var body: some View{
        VStack{
            Spacer()
            VStack {
                HStack{
                    Text("Choose centre")
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                HStack(spacing: 15){
                    ForEach(0..<3) { index in
                        Button(action: {
                            selectedCity = cities[index]
                            Utilities.shared.selectedCity = cities[index]
                        }) {
                            VStack(spacing:10){
                                Image(uiImage: UIImage(named: "mapIcon")!)
                                    .resizable()
                                    .renderingMode(.original)
                                    .frame(width: 20, height: 30)
                                Text(cities[index])
                                    .frame(maxWidth: .infinity)
                            }
                            .frame(height: 60)
                            .padding(10)
                            .background(Color.ui.grey)
                            .cornerRadius(5)
                        }
                        .foregroundColor(.black)
                    }
                }
                .padding(.horizontal, 20)
                
                Spacer()
            }
            .background(Color.ui.green)
            .frame(width: UIScreen.main.bounds.width, height: 170)
        }
    }
}

struct ProfileBalloonView: View {
    var body: some View {
        VStack(alignment: .trailing){
            ZStack{
                ProfileDropDown()
                    .fill(.white)
                    .frame(width: 200, height: 140)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                
                VStack(alignment: .leading, spacing: 15){
                    HStack(alignment:.center){
                        Image(systemName: "person.fill")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.black)
                            .frame(width: 25, height: 25)
                            .padding(.trailing, 20)
                        VStack(spacing: 2){
                            
                            Text("User Name")
                            
                            Button("View Profile") {
                            }
                            .padding(.horizontal, 10)
                            .frame(height: 20)
                            .foregroundColor(Color.white)
                            .background(Color.ui.green)
                            .cornerRadius(10)
                            .padding(.bottom, 10)
                        }
                    }
                    //                                    .background(Color.yellow)
                    .frame(height: 20)
                    
                    Divider()
                        .overlay(Color.black)
                        .frame(width: 160, height: 2)
                    
                    Button("Log Out") {
                    }
                    .foregroundColor(Color.black)
                }
                .padding(.top, 35)
                .padding(.trailing, 10)
            }
            Spacer()
        }
        .padding(.top, 45)
        .padding(.trailing, 10)
    }
}

struct TopNavView: View{
    
    @Binding var buttonSelected: Bool
    var body: some View{
    HStack{
        Button(action: {
        }) {
            Image(uiImage: UIImage(named: "hamburger_icon")!)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.black)
                .scaledToFill()
                .frame(width: 25, height: 25)
        }
        .padding(.leading, 20)
        
        Spacer()
        
        Button(action: {
        }) {
            Image(uiImage: UIImage(named: "goethe_logo")!)
                .resizable()
                .renderingMode(.original)
                .frame(width: 150, height: 50)
        }
        
        Spacer()
        
        Button(action: {
            withAnimation(.easeInOut(duration: 0.2)) {
                buttonSelected.toggle()
            }
        }) {
            Image(systemName: "person.fill")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.black)
                .frame(width: 25, height: 25)
                .padding(.trailing, 20)
        }
    }
    .frame(width: UIScreen.main.bounds.width, height: 70)
    }
}

// MARK: - Main View
struct MainView: View {
    
    @Binding var buttonSelected: Bool
    @Binding var centerButtonSelected: Bool
    var bottomView: Bool = true
    var selectedCity: String
    var backButton: Bool
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            VStack{
                
                TopNavView(buttonSelected: $buttonSelected)
                
                ZStack{
                    Rectangle()
                        .fill(Color.ui.green)
                        .padding(0)
                    
                    VStack{
                        HStack {
                            if backButton{
                                Button(action: {
                                    presentationMode.wrappedValue.dismiss()
                                }) {
                                    Image(systemName: "chevron.left")
                                        .resizable()
                                        .renderingMode(.template)
                                        .foregroundColor(.white)
                                        .scaledToFit()
                                        .frame(width: 20, height: 20)
                                }
                                .padding(.leading, 10)
                            }
                            
                            Spacer()
                            
                            Button(action: {withAnimation(.easeInOut(duration: 0.2)) {
                                centerButtonSelected.toggle()
                            }
                                
                            }) {
                                HStack{
                                    Image(systemName: "mappin")
                                        .resizable()
                                        .renderingMode(.template)
                                        .foregroundColor(.white)
                                        .scaledToFit()
                                        .frame(width: 20, height: 20)
                                    
                                    Text(selectedCity)
                                        .font(.title3)
                                        .foregroundColor(.white)
                                }
                            }
                            .padding(.trailing, backButton ? 45:0)
                            
                            Spacer()
                        }
                        .padding(.top, 10)
                        
                        if bottomView{
                            Rectangle()
                                .fill(Color.ui.grey)
                                .cornerRadius(50, corners: [.topLeft, .topRight])
                        }else{
                            Spacer()
                        }
                    }
                }
            }
        }
        .onChange(of: selectedCity) { _ in
            centerButtonSelected = false
        }
        .onDisappear(){
            centerButtonSelected = false
            buttonSelected = false
        }
    }
}

// MARK: - Grid View

struct HomeGridView: View {
    
    @State var selectedCell: Int = 0
    @State var isActive: Bool = false
    @State var index: Int = 0
    let names = ["Course", "Exams", "Payments", "Events", "Teams"]
    let layout = [
        GridItem(.flexible(minimum: 150)),
        GridItem(.flexible(minimum: 150))
    ]
    
    var body: some View{
        ZStack{
            ScrollView{
                LazyVGrid(columns: layout, spacing: 20){
                    ForEach(names, id: \.self) {
                        name in
                        // MARK: - Buttons View
                        Button(action: {
                            selectedCell = names.firstIndex(of: name)!
                            isActive.toggle()
                        }) {
                            ZStack{
                                Circle()
                                    .fill(.white)
                                    .frame( height: 150)
                                    .shadow(color: .gray, radius: 10, x: 2, y: 5)
                                    .opacity(0.1)
                                
                                VStack{
                                    Image(uiImage: UIImage(named: name)!)
                                        .renderingMode(.original)
                                        .frame(width: 40, height: 40)
                                    Text(name)
                                }
                            }
                        }
                        .foregroundColor(.black)
                    }
                }
            }
            .padding(.top, 40)
            
            NavigationLink(isActive: $isActive, destination: {
                if selectedCell == 0{
                    CourseView()
                }else if selectedCell == 1{
                    ExamsView()
                }else if selectedCell == 2{
                    PaymentsView()
                }else if selectedCell == 3{
                    EventsView()
                }else if selectedCell == 4{
                    TeamsView()
                }
            }, label: {
                EmptyView()
            })
        }
        .padding(.top, 125)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
