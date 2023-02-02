//
//  ProfileDetailsView.swift
//  GeotheLearningClone
//
//  Created by Palnar on 25/01/23.
//

import SwiftUI

struct ProfileDetailsView: View {
    //Data
    let userManager = UserManager()
    
    //Common Subviews
    @State var buttonSelected: Bool = false
    @State var centreButtonSelected: Bool = false
    @State var selectedCity = Utilities.shared.selectedCity
    @State var selectedGender: gender?
    
    //Profile Top Subviews
    @State var editing: Bool = false
    
    //Profile Text Details
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var mobile = ""
    @State var additionalNumber = ""
    @State var qualification = ""
    @State var nationality = ""
    @State var state = ""
    @State var purpose = ""
    @State var address = ""
    @State var city = ""
    @State var pinCode = ""
    @State var motherTongue = ""
    @State var placeOfBirth = ""
    @State var otherLanguages = ""
    @State var iDProof = ""
    @State var iDProofNumber = ""
    @State var validFrom = ""
    @State var validTo = ""
    @State var detailsCorrect: Bool = false
    @State var termsAndConditionsAgree = false
    @State var finalTermsandConditions = false
    
    var body: some View {
        ZStack(alignment: .trailing) {
            MainView(buttonSelected: $buttonSelected, centerButtonSelected: $centreButtonSelected, bottomView: false, selectedCity: selectedCity, backButton: true)
            
            ZStack(alignment: .top){
                Rectangle()
                    .fill(Color.ui.grey)
                    .padding(.top, 20)
                
                Rectangle()
                    .fill(Color.ui.green)
                    .frame(height: 70)
                    .padding(.top, 20)
                    .cornerRadius(30, corners: [.bottomLeft, .bottomRight])
                
                ScrollView{
                    VStack {
                        ZStack{
                            VStack{
                                HStack{
                                    Spacer()
                                    Button(action: {
                                        editing.toggle()
                                    }) {
                                        Image(systemName: "square.and.pencil")
                                            .font(.title3.weight(.bold))
                                            .foregroundColor(.black)
                                    }
                                }
                                .padding(.horizontal, 20)
                                .padding(.top, 40)
                                .frame(height: 25)
                                
                                Text(firstName + " " + lastName)
                                    .padding(.top, 20)
                                Text(email)
                                    .accentColor(.gray)
                                Text(selectedGender?.rawValue ?? "" + ", " + mobile)
                                    .foregroundColor(.gray)
                                Text("Subscribe Newsletter")
                                    .foregroundColor(Color.ui.green)
                                Spacer()
                            }
//                            .onAppear{
//                                firstName = (userManager.userProfileData?.firstName)!
//                                lastName = (userManager.userProfileData?.lastName)!
//                                email = (userManager.userProfileData?.email)!
//                                selectedGender = (userManager.userProfileData?.gender)!
//                                mobile = (userManager.userProfileData?.mobile)!
//                            }
                            .frame(width: UIScreen.main.bounds.width - 50, height: 165)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 10.0, x: 0, y: 0)
                            
                            Circle()
                                .frame(width: 80, height: 80)
                                .offset(x: 0, y: -80)
                                .padding(.top, 5)
                        }
                        .padding()
                        .padding(.top,80)
                        .padding(.bottom, -60)
                        .offset(x: 0, y: -60)
                        
                        HStack{
                            Text("Update Information")
                                .font(.subheadline.weight(.bold))
                                .padding(.horizontal, 30)
                            Spacer()
                        }
                        
                        VStack(spacing: 15){
                            HStack(spacing: 20){
                                ProfileTextFieldView(text: $firstName, editing: $editing, heading: "First Name", placeHolder: "Enter First Name")
                                
                                ProfileTextFieldView(text: $lastName, editing: $editing, heading: "Last Name", placeHolder: "Enter Last Name")
                            }
                            .padding(.horizontal, 15)
                            .padding(.top, 10)
                            
                            HStack(spacing: 20){
                                ProfileTextFieldView(text: $email, editing: $editing, heading: "Email", placeHolder: "Enter Email ID")
                                
                                ProfileTextFieldView(text: $mobile, editing: $editing, heading: "Mobile Number", placeHolder: "Enter Mobile Number")
                            }
                            .padding(.horizontal, 15)
                            
                            
                            VStack{
                                
                                HStack{
                                    Text("Gender")
                                        .modifier(HeadingTextModifier())
                                    Spacer()
                                }
                                
                                HStack(spacing: 30){
                                    Button(action: {
                                        selectedGender = .male
                                    }) {
                                        HStack{
                                            RadioButton(selected: selectedGender == .male)
                                            Text("Male")
                                        }
                                    }
                                    
                                    Button(action: {
                                        selectedGender = .female
                                    }) {
                                        HStack{
                                            RadioButton(selected: selectedGender == .female)
                                            Text("Female")
                                        }
                                    }
                                    
                                    Button(action: {
                                        selectedGender = .others
                                    }) {
                                        HStack{
                                            RadioButton(selected: selectedGender == .others)
                                            Text("Others")
                                        }
                                    }
                                    
                                    Spacer()
                                }
                                .foregroundColor(.black)
                                //                                .padding(.bottom, 40)
                            }
                            .padding(.horizontal, 15)
                            .padding(.bottom, 10)
                            
//                            VStack{
                                HStack(spacing: 20){
                                    ProfileTextFieldView(text: $additionalNumber, editing: $editing, heading: "Additional Number", placeHolder: "Enter Mobile Number")
                                    
                                    
                                    ProfileTextFieldView(text: $qualification, editing: $editing, heading: "Qualification", placeHolder: "Enter Highest Degree")
                                }
                                .padding(.horizontal, 15)
                                .padding(.top, 10)
//                            }
                            
//                            VStack{
                                HStack(spacing: 20){
                                    ProfileTextFieldView(text: $nationality, editing: $editing, heading: "Nationality", placeHolder: "Select Country")
                                    
                                    ProfileTextFieldView(text: $state, editing: $editing, heading: "State", placeHolder: "Select State")
                                }
                                .padding(.horizontal, 15)
//                            }
//                            .padding(.bottom, 10)
                            
                            VStack{
                                HStack{
                                    Text("Purpose of learning german")
                                        .modifier(HeadingTextModifier())
                                    Spacer()
                                }
                                
                                TextField("", text: $firstName)
                                    .frame(height: 70)
                                    .font(.system(size: 14))
                                    .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                    .background(Color.ui.grey)
                                    .cornerRadius(8)
                                    .shadow(color: .gray.opacity(0.3),radius: 10.0, x: 0, y: 0)
                            }
                            .padding(.horizontal, 15)
                            .padding(.bottom, 10)
                            
                            VStack{
                                HStack{
                                    Text("Address")
                                        .modifier(HeadingTextModifier())
                                    Spacer()
                                }
                                
                                TextField("", text: $firstName)
                                    .frame(height: 70)
                                    .font(.system(size: 14))
                                    .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                    .background(Color.ui.grey)
                                    .cornerRadius(8)
                                    .shadow(color: .gray.opacity(0.3),radius: 10.0, x: 0, y: 0)
                            }
                            .padding(.horizontal, 15)
                            .padding(.bottom, 10)
                            
                            
                            VStack{
                                HStack(spacing: 20){
                                    ProfileTextFieldView(text: $city, editing: $editing, heading: "City", placeHolder: "Enter City")
                                    
                                    ProfileTextFieldView(text: $pinCode, editing: $editing, heading: "Pincode", placeHolder: "Enter Pincode")
                                }
                                .padding(.horizontal, 15)
                            }
                            
                            Group {
                                VStack{
                                    HStack(spacing: 20){
                                        ProfileTextFieldView(text: $motherTongue, editing: $editing, heading: "Mother tongue", placeHolder: "Select Language")
                                        
                                        ProfileTextFieldView(text: $placeOfBirth, editing: $editing, heading: "Place of birth", placeHolder: "Enter Place of birth")
                                    }
                                    .padding(.horizontal, 15)
                                }
                                
                                VStack{
                                    HStack(spacing: 20){
                                        
                                        ProfileTextFieldView(text: $otherLanguages, editing: $editing, heading: "Other Languages", placeHolder: "Select Languages")
                                        
                                        
                                        ProfileTextFieldView(text: $iDProof, editing: $editing, heading: "Select ID Proof", placeHolder: "ID Proof")
                                    }
                                    .padding(.horizontal, 15)
                                }
                                
                                VStack{
                                    HStack(spacing: 20){
                                        ProfileTextFieldView(text: $iDProofNumber, editing: $editing, heading: "ID Proof Number", placeHolder: "Enter Number")
                                        
                                        VStack(alignment: .leading, spacing: 5){
                                            Text("ID Proof ")
                                                .modifier(HeadingTextModifier())
                                            Button(action: {}){
                                                HStack{
                                                    Image(systemName: "icloud.and.arrow.up.fill")
                                                    Text("Upload")
                                                }
                                                .foregroundColor(.white)
                                            }
                                            .frame(height: 30)
                                            .frame(minWidth: 0, maxWidth: .infinity)
                                            .background(Color.ui.green)
                                            .cornerRadius(8)
                                        }
                                    }
                                    .padding(.horizontal, 15)
                                }
                                
                                HStack(spacing: 20){
                                    ProfileTextFieldView(text: $validFrom, editing: $editing, heading: "Valid From", placeHolder: "Pick Date")
                                    
                                    ProfileTextFieldView(text: $validTo, editing: $editing, heading: "Valid To", placeHolder: "Pick Date")
                                }
                                .padding(.horizontal, 15)
                                
                                Button(action: {
                                    detailsCorrect.toggle()
                                }) {
                                    HStack(spacing: 5){
                                        SquareRadioButton(selected: detailsCorrect)
                                            .frame(width: 30)
                                        Text("The details given by you in your profile will reflect on the certificate")
                                            .frame(width: UIScreen.main.bounds.width - 100)
                                            .lineLimit(.none)
                                            .font(.subheadline)
                                    }
                                }
                                .foregroundColor(.black)
                                .padding(.horizontal, 15)
                                
                                Button(action: {
                                    termsAndConditionsAgree.toggle()
                                }) {
                                    HStack(spacing: 5){
                                        SquareRadioButton(selected: termsAndConditionsAgree)
                                            .frame(width: 30)
                                        Text("Terms and conditions. Please scroll down the below content to agree to terms")
                                            .frame(width: UIScreen.main.bounds.width - 100)
                                            .lineLimit(.none)
                                            .font(.subheadline)
                                    }
                                }
                                .foregroundColor(.black)
                                .padding(.horizontal, 15)
                                
                                Divider()
                                    .padding(.horizontal, 15)
                                
                                Button(action: {
                                    finalTermsandConditions.toggle()
                                }) {
                                    HStack(spacing: 5){
                                    SquareRadioButton(selected: finalTermsandConditions)
                                        .frame(width: 30)
                                    Text("I do herebey agree with the Terms and Conditions of Geothe-Zentrum Trivandrum.")
                                        .frame(width: UIScreen.main.bounds.width - 100)
                                        .lineLimit(.none)
                                        .font(.subheadline.weight(.bold))
                                }
                                }
                                .foregroundColor(.black)
                                .padding(.horizontal, 15)
                                
                                Button(action: {}){
                                    HStack{
                                        Text("Proceed")
                                            .font(.subheadline)
                                            .bold()
                                    }
                                }
                                .frame(width: UIScreen.main.bounds.width * 0.4, height: 30)
                                .foregroundColor(Color.ui.green)
                                .background(Color.white)
                                .cornerRadius(25)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color.ui.green, lineWidth: 2))
                                .padding(20)
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width - 50)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 10.0, x: 0, y: 0)
                    }
                    .padding(.bottom, 30)
                }
            }
            .padding(.top, 130)
        }
        .ignoresSafeArea(.container, edges: .bottom)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct ProfileTextFieldsModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14))
            .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
            .frame(height: 30)
            .background(Color.ui.grey)
            .cornerRadius(8)
            .shadow(color: .gray.opacity(0.3),radius: 10.0, x: 0, y: 0)
    }
}

struct SquareRadioButton: View {
    var selected: Bool
    var body: some View{
        ZStack{
            Rectangle()
                .fill(Color.ui.green)
                .frame(width: 18, height: 18)
            
            Rectangle()
                .fill(.white)
                .frame(width: 14, height: 14)
            
            if selected{
                Rectangle()
                .fill(Color.ui.green)
                .frame(width: 10, height: 10)
            }
        }
    }
}

struct ProfileTextFieldView: View {
    @Binding var text: String
    @Binding var editing: Bool
    var heading: String
    var placeHolder: String
    var body: some View{
        VStack(alignment: .leading, spacing: 5){
            Text(heading)
                .modifier(HeadingTextModifier())
            TextField(placeHolder, text: $text)
                .disabled(!editing)
                .modifier(ProfileTextFieldsModifier())
        }
    }
}

struct HeadingTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.gray)
            .font(.subheadline.weight(.bold))
    }
}

struct ProfileDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetailsView()
    }
}


