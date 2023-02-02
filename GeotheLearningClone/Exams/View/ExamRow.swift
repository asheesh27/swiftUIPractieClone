//
//  ExamRow.swift
//  GeotheLearningClone
//
//  Created by Palnar on 16/01/23.
//

import SwiftUI

struct ExamRow: View {
    
    var examDetails: String
    var body: some View {
        ZStack{
        Rectangle()
            .fill(Color.white)
            .frame(height: 45)
            .cornerRadius(10)
        
            HStack{
                Circle()
                    .fill(Color.ui.green)
                    .frame(width: 10, height: 10)
//                    .padding(.leading, 40)
                
                Text(examDetails)
                    .font(.footnote)
                
                Spacer()
            }
            .frame(height: 40)
        }
    }
}

struct ExamRow_Previews: PreviewProvider {
    static var previews: some View {
        ExamRow(examDetails: "The most important exam evva")
    }
}
