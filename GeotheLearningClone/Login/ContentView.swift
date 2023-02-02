//
//  ContentView.swift
//  GeotheLearningClone
//
//  Created by Palnar on 05/01/23.
//

import SwiftUI

struct ContentView: View {
    @State private var usernameText: String = ""
    @State private var passwordText: String = ""
    @State private var isActive: Bool = false
    @State private var showingAlert = false
    @State var alertMessage: String = ""
    
    var body: some View {
        NavigationView{
            ScrollView{
                ProfileView()
                    .padding(.top, 100)
                    .padding(.bottom, 30)
                
                Text("Login")
                    .modifier(ProfileTitleModifier())
                
                TextFieldView(usernameText: $usernameText, passwordText: $passwordText)
                    .padding(.horizontal, 40)
                    .padding(.bottom, 10)
                //            .background(Color.red)
                
                HStack{
                    Button("Forgot Password?") {
                        
                    }
                    .foregroundColor(Color.black)
                    
                    Spacer()
                }
                .padding(.leading, 40)
                .padding(.bottom, 40)
                
                Button(action: {
                    
                    if usernameText.isEmpty{
                        alertMessage = "Please enter Email ID"
                    }else if passwordText.isEmpty{
                        alertMessage = "Please enter the password"
                    }else{
                        if usernameText == UserManager().userProfileData?.email && passwordText == UserManager().userProfileData?.password{
                            UserManager().isUserLogin = true
                            alertMessage = "Successfully logged in"
                        }else{
                            alertMessage = "Email or password is wrong"
                        }
                    }
                    showingAlert = true
                }) {
                    Text("Login")
                        .bold()
                }
                .alert(isPresented: $showingAlert, content: {
                    showingAlert = false
                    return Alert(title: Text(alertMessage))
                })
                .frame(width: UIScreen.main.bounds.width * 0.6, height: 50)
                .foregroundColor(Color.white)
                .background(Color.ui.green)
                .cornerRadius(25)
                .padding(.bottom, 40)
                
                NavigationLink(isActive: $isActive, destination: {
                    RegistrationView()
                }, label: {
                    Text("Create a new account")
                        .foregroundColor(Color.black)
                })
                
//                NavigationLink(isActive: $isActive, "Create a new account", destination: RegistrationView())
//                    .foregroundColor(Color.black)
                
                Text("or")
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                
                HStack{
                    Image(uiImage: UIImage(named: "logo")!)
                        .resizable()
                        .scaledToFit()
                    
                    Button("Google Sign in") {
                        isActive = true
                    }
                    .foregroundColor(Color.black)
                }
                .frame(height: 30)
                
                Spacer()
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
//            .navigationBarTitle("")
//            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ProfileView: View {
    var body: some View{
        ZStack{
            Circle()
                .frame(width: 90, height: 90)
                .background(Color.black)
                .cornerRadius(50)
            
            Image(systemName: "person.fill")
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.white)
                .frame(width: 65, height: 65)
                .cornerRadius(32.5)
        }
    }
}

struct TextFieldView: View{
    @Binding var usernameText: String
    @Binding var passwordText: String
    
    var body: some View{
        VStack{
            TextField("User ID or Email", text: $usernameText)
            Divider()
                .modifier(SeparatingDividerModifier())
            
            SecureField("Password", text: $passwordText)
            Divider()
                .frame(height: 1)
                .overlay(Color.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ProfileTitleModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.title2.weight(.bold))
            .foregroundColor(Color.ui.green)
            .padding(.bottom, 50)
      }
}

struct SeparatingDividerModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .frame(height: 1)
            .overlay(Color.black)
            .padding(.bottom, 20)
    }
}

