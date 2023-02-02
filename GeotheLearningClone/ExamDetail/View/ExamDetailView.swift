//
//  ExamDetailView.swift
//  GeotheLearningClone
//
//  Created by Palnar on 18/01/23.
//

import SwiftUI

struct ExamDetailView: View {
    @State var centreButtonSelected: Bool = false
    @State var buttonSelected = false
    @State var selectedCity = Utilities.shared.selectedCity
    var examName: String
    var body: some View {
        ZStack(alignment: .trailing){
            MainView(buttonSelected: $buttonSelected, centerButtonSelected: $centreButtonSelected, selectedCity: selectedCity, backButton: true)
            
            ExamDetailsView(examName: examName)
            
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

struct ExamDetailsView: View {
    
    var examName: String
    var body: some View {
        VStack{
            HStack{
                Text(examName)
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(.horizontal, 20)
            
            VStack(spacing: 15){
                HStack(alignment: .center, spacing: 5){
                    ExamDetailCell(dataName: "Exam Date(s)", data: "07/05/2022, 09/05/2022", amount: false)
                    ExamDetailCell(dataName: "Registration Date", data: "07-04-2022", amount: false)
                }
                
                HStack(alignment: .center, spacing: 5){
                    ExamDetailCell(dataName: "Exam Fees", data: "2000 + GST", amount: true)
                    ExamDetailCell(dataName: "Remaining seats", data: "17", amount: false)
                }
            }
            .padding(20)
            .frame(width: UIScreen.main.bounds.width - 30)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 10.0, x: 5, y: 5)
        
            NavigationLink(destination: ExamRegistrationView(examName: examName), label: {
                Text("Register")
                    .font(.subheadline)
                    .bold()
            })
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
        .padding(.top, 155)
    }
    
}

struct ExamDetailCell: View{
    
    var dataName: String
    var data: String
    var amount: Bool
    var body: some View {
        VStack(alignment: .leading){
            Text(dataName)
                .font(.subheadline)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
            if amount{
                Text("₹")
                    .foregroundColor(Color.ui.green) +
                Text(data)
                    .font(.subheadline)
            }else{
                Text(data)
                    .font(.subheadline)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        .foregroundColor(Color.ui.darkGrey)
    }
}

struct ExamDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ExamDetailView(examName: "Sanskrit")
    }
}
