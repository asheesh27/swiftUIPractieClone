//
//  ExamRegistrationView.swift
//  GeotheLearningClone
//
//  Created by Palnar on 18/01/23.
//

import SwiftUI

struct ExamRegistrationView: View {
    
    @State var centreButtonSelected: Bool = false
    @State var buttonSelected: Bool = false
    @State var selectedCity = Utilities.shared.selectedCity
    var examName: String
    var body: some View {
        ZStack(alignment: .trailing){
            MainView(buttonSelected: $buttonSelected, centerButtonSelected: $centreButtonSelected, selectedCity: selectedCity, backButton: true)
            
            RegistrationOptionsView(examName: examName)
                .padding(.top, 155)
            
            if buttonSelected{
                ProfileBalloonView()
            }
            
            if centreButtonSelected{
                CitySelectionView(selectedCity: $selectedCity)
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea(.container, edges: .bottom)
    }
}

struct RegistrationOptionsView: View {
    
    enum FeesType{
        case full
        case moduleWise
    }
    
    enum ExamType: CaseIterable{
        case hoeren
        case lesen
        case schreiben
        case sprechen
    }
    
    @State var selectedFeesType: FeesType?
    @State var selectedExamType: ExamType?
    var examType = ["Hoeren", "Lesen", "Schreiben", "Sprechen"]
    var examName: String
    let layout = [
        GridItem(.flexible(minimum: 100)),
        GridItem(.flexible(minimum: 100)),
        GridItem(.flexible(minimum: 100))
    ]
    var body: some View{
        VStack {
            
            HStack{
                Text(examName)
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(.horizontal, 20)
            
            VStack{
                HStack(spacing: 20){
                    Button(action: {
                        selectedFeesType = .full
                    }) {
                        HStack{
                            RadioButton(selected: selectedFeesType == .full)
                            Text("Full fees")
                        }
                    }
                    
                    Button(action: {
                        selectedFeesType = .moduleWise
                    }) {
                        HStack{
                            RadioButton(selected:selectedFeesType == .moduleWise)
                            Text("Module wise fees")
                        }
                    }
                    
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width - 60)
                .padding()
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), alignment: .leading), count: 3)){
                    ForEach(0..<examType.count, id: \.self) {
                        index in
                        // MARK: - Buttons View
                        Button(action: {
                            selectedExamType = ExamType.allCases[index]
                        }) {
                            HStack{
                                CheckBox(selected: ExamType.allCases[index] == selectedExamType)
                                Text(examType[index])
                            }
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width - 60)
                
                VStack(spacing: 15){
                    HStack(alignment: .center, spacing: 5){
                        ExamDetailCell(dataName: "Total Fees", data: "5000", amount: true)
                        ExamDetailCell(dataName: "CGST @ 9%", data: "450", amount: true)
                    }
                    
                    HStack(alignment: .center, spacing: 5){
                        ExamDetailCell(dataName: "SGST @ 9%", data: "450", amount: true)
                        ExamDetailCell(dataName: "Total Fees", data: "5900", amount: true)
                    }
                }
                .padding(.vertical, 10)
                .frame(width: UIScreen.main.bounds.width - 60)
                .background(Color.white)
                
            }
            .padding(20)
            .frame(width: UIScreen.main.bounds.width - 30)
            .foregroundColor(.black)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 10.0, x: 5, y: 5)
            
//            NavigationLink(destination: ExamRegistrationView(examName: examName), label: {
//                Text("Make Payment")
//                    .font(.subheadline)
//                    .bold()
//            })
//                .frame(width: UIScreen.main.bounds.width * 0.4, height: 30)
//                .foregroundColor(Color.ui.green)
//                .background(Color.white)
//                .cornerRadius(25)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 25)
//                        .stroke(Color.ui.green, lineWidth: 2))
//                .padding(20)
            
            Button(action: {
            }) {
                Text("Make Payment")
                    .font(.subheadline)
                    .bold()
            }
            .frame(width: UIScreen.main.bounds.width * 0.4, height: 30)
            .foregroundColor(Color.ui.green)
            .background(Color.white)
            .cornerRadius(25)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.ui.green, lineWidth: 2))
            .padding(20)
            
            Spacer()
        }
    }
}

struct CheckBox: View {
    var selected: Bool
    var body: some View{
        ZStack{
            Rectangle()
                .fill(Color.ui.green)
                .frame(width: 18, height: 18)
                .cornerRadius(4)
            
            Rectangle()
                .fill(selected ? Color.ui.green: Color.white)
                .frame(width: 14, height: 14)
                .cornerRadius(3)
            
            if selected{
                Image(systemName: "checkmark")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 10, height: 10)
            }
        }
    }
}

struct ExamRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        ExamRegistrationView(examName: "Sankrit")
    }
}
