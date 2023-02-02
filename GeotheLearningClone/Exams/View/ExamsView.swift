//
//  ExamsView.swift
//  GeotheLearningClone
//
//  Created by Palnar on 13/01/23.
//

import SwiftUI
import UIKit

struct ExamsView: View {
//    func removeRows(at offsets: IndexSet) {
//        examNames.remove(atOffsets: offsets)
//    }
    @State var centreButtonSelected: Bool = false
    @State var buttonSelected: Bool = false
    @State var selectedCity = Utilities.shared.selectedCity
    var body: some View {
        ZStack(alignment: .trailing){
            MainView(buttonSelected: $buttonSelected, centerButtonSelected: $centreButtonSelected, selectedCity: selectedCity, backButton: true)
            
            ExamsListView()
            
            if buttonSelected{
                ProfileBalloonView()
            }
            
            if centreButtonSelected{
                CitySelectionView(selectedCity: $selectedCity)
            }
            
        }
        .ignoresSafeArea(.container, edges: .bottom)
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct ExamsListView: View {
    @State var examNames = ["A1 Goethe-Zertifikat International Examination", "A2 Goethe-Zertifikat International Examination", "A3 Goethe-Zertifikat International Examination", "A4 Goethe-Zertifikat International Examination", "A5 Goethe-Zertifikat International Examination", "A6 Goethe-Zertifikat International Examination"]
    @State var isActive = true
    
    var body: some View{
        VStack{
            HStack{
                Text("All Exams")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
                
                EditButton()
                    .foregroundColor(.red)
            }
            .padding(.horizontal, 20)
            
            List{
                ForEach(examNames, id: \.self){examName in
                    NavigationLink(destination: ExamDetailView(examName: examName), label: {
                        ExamRow(examDetails: examName)
                    })
                }
                .onDelete(perform: delete)
                .onMove(perform: move)
            }
        }
        .padding(.top, 155)
    }
    
    func delete(indexSet: IndexSet){
        examNames.remove(atOffsets: indexSet)
    }
    
    func move(indices: IndexSet, offset: Int){
        examNames.move(fromOffsets: indices, toOffset: offset)
    }
}

struct ExamsView_Previews: PreviewProvider {
    static var previews: some View {
        ExamsView()
    }
}
