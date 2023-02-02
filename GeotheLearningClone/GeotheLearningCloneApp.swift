//
//  GeotheLearningCloneApp.swift
//  GeotheLearningClone
//
//  Created by Palnar on 05/01/23.
//

import SwiftUI

@main
struct GeotheLearningCloneApp: App {
    var body: some Scene {
        WindowGroup {
            if UserManager().isUserLogin{
                ProfileDetailsView()
            }else{
                ContentView()
            }
        }
    }
}
