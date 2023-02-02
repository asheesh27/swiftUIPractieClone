//
//  ProfileView.swift
//  GeotheLearningClone
//
//  Created by Palnar on 24/01/23.
//

import SwiftUI

struct ProfileDropDown: Shape{
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//
//        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
//        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
//        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
//
//        return path
//    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.width - 20, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.width - 10, y: rect.minY + 20))
        path.addLine(to: CGPoint(x: rect.width, y: rect.minY + 20))
        path.addLine(to: CGPoint(x: rect.width, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + 20))
        path.addLine(to: CGPoint(x: rect.width - 30, y: rect.minY + 20))
        path.addLine(to: CGPoint(x: rect.width - 20, y: rect.minY))
        return path
    }
}
