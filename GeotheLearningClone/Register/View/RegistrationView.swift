//
//  RegistrationView.swift
//  GeotheLearningClone
//
//  Created by Palnar on 06/01/23.
//

import SwiftUI

enum gender: String, Codable{
    case male = "Male"
    case female = "Female"
    case others = "Others"
}

struct RegistrationView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var mobile: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var selectedGender: gender?
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @State var isShowingImagePicker: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView{
            ZStack{
                ProfileView()
                
                Button(action: {
                    isShowingImagePicker.toggle()
                }){
                    Circle()
                        .fill(.clear)
                }
                    .sheet(isPresented: $isShowingImagePicker, content: {
                        ImagePickerView()
                    })
                .frame(width: 90, height: 90)
                .cornerRadius(50)
            }
            .padding(.top, 80)
            .padding(.bottom, 30)
            
            Text("Create a new account")
                .modifier(ProfileTitleModifier())
            
            RegistrationTextFieldsView(firstName: $firstName, lastName: $lastName, email: $email, mobile: $mobile, password: $password, confirmPassword: $confirmPassword)
                .padding(.horizontal, 40)
                .padding(.bottom, 10)
            
            GenderRadioButtonView(selectedGender: $selectedGender)
                .padding(.horizontal, 40)
            
            Button(action: {
                validateEverything()
            }) {
                Text("Sign Up")
                    .bold()
            }
            .alert(isPresented: $showingAlert, content: {
                showingAlert = false
                return Alert(title: Text(alertMessage))
            })
            .frame(width: UIScreen.main.bounds.width * 0.8, height: 50)
            .foregroundColor(Color.white)
            .background(Color.ui.green)
            .cornerRadius(25)
            .padding(.bottom, 10)
            
            HStack{
                Text("Already have an account?")
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Login")
                        .bold()
                        .foregroundColor(.orange)
                }
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    func validateEverything(){
        if firstName.isEmpty{
            alertMessage = "Please enter First Name"
        }else if firstName.containsWhitespaceAndNewlines{
            alertMessage = "First Name must be a single name"
        }
        
        else if lastName.isEmpty{
            alertMessage = "Please enter Last Name"
        }else if lastName.containsWhitespaceAndNewlines{
            alertMessage = "Last Name must be a single name"
        }
        
        else if email.isEmpty{
            alertMessage = "Please enter your Email ID"
        }else if !email.isValidEmail{
            alertMessage = "Email ID is not valid"
        }
        
        else if mobile.isEmpty || mobile.count != 10 || !mobile.isNumeric{
            alertMessage = "Please enter a valid Mobile number"
        }
        
        else if password.isEmpty || confirmPassword.isEmpty{
            alertMessage = "Please fill the password fields"
        }else if password != confirmPassword{
            alertMessage = "The passwords you have entered don't match"
        }else if !password.isValidPassword || !confirmPassword.isValidPassword{
            alertMessage = "Please follow the hint for the passwords"
        }
        
        else if selectedGender == nil{
            alertMessage = "Please select a gender"
        }
        
        else{
            //This means all the data entered is correct and we can go ahead and create
            UserManager().userProfileData = UserDetails(firstName: firstName, lastName: lastName, email: email, mobile: mobile, password: password, gender: selectedGender)
            UserManager().isUserLogin = true
            alertMessage = "Successfully created user! Please Login"
            presentationMode.wrappedValue.dismiss()
        }
        showingAlert = true
    }
}

struct RegistrationTextFieldsView: View{
    @Binding var firstName: String
    @Binding var lastName: String
    @Binding var email: String
    @Binding var mobile: String
    @Binding var password: String
    @Binding var confirmPassword: String
    
    var body: some View {
        VStack{
            Group{
            TextField("First Name", text: $firstName)
            Divider()
                .modifier(SeparatingDividerModifier())
            
            TextField("Last Name", text: $lastName)
            Divider()
                .modifier(SeparatingDividerModifier())
            
            TextField("Email", text: $email)
            Divider()
                .modifier(SeparatingDividerModifier())
            
            TextField("Mobile", text: $mobile)
            Divider()
                .modifier(SeparatingDividerModifier())
            
            TextField("Password", text: $password)
            Divider()
                .modifier(SeparatingDividerModifier())
            }
            
            TextField("Confirm Password", text: $confirmPassword)
            Divider()
                .modifier(SeparatingDividerModifier())
        }
    }
}

struct GenderRadioButtonView: View{
    @Binding var selectedGender: gender?
    
    var body: some View{
        HStack(spacing: 30){
//        ForEach(0..<3){_ in
//            RadioButton(selected: true)
//        }
            Button(action: {
                selectedGender = .male
                    }) {
                        HStack{
                            RadioButton(selected: selectedGender == .male)
                            Text("Male")
                        }
                    }
            
//            Spacer()
            
            Button(action: {
                selectedGender = .female
                    }) {
                        HStack{
                            RadioButton(selected: selectedGender == .female)
                            Text("Female")
                        }
                    }
            
//            Spacer()
            
            Button(action: {
                selectedGender = .others
                    }) {
                        HStack{
                            RadioButton(selected: selectedGender == .others)
                            Text("Others")
                        }
                    }
        }
        .foregroundColor(.black)
        .padding(.bottom, 40)
    }
}

struct RadioButton: View {
    var selected: Bool
    var body: some View{
        ZStack{
            Circle()
                .fill(Color.ui.green)
                .frame(width: 18, height: 18)
            
            Circle()
                .fill(.white)
                .frame(width: 14, height: 14)
            
            if selected{
            Circle()
                .fill(Color.ui.green)
                .frame(width: 10, height: 10)
            }
        }
    }
}

struct ImagePickerView: UIViewControllerRepresentable{
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>) -> UIImagePickerController {
        let controller = UIImagePickerController()
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<ImagePickerView>){
        
    }
    
    typealias UIViewControllerType = UIImagePickerController
    
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
