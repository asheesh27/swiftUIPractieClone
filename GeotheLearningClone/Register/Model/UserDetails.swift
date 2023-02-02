//
//  UserDetails.swift
//  GeotheLearningClone
//
//  Created by Palnar on 11/01/23.
//

import Foundation

struct UserDetails: Codable{
    let firstName: String?
    let lastName: String?
    let email: String?
    let mobile: String?
    let password: String?
    let gender: gender?
    
    enum CodingKeys: String, CodingKey{
        case firstName = "firstName"
        case lastName = "lastName"
        case email = "email"
        case mobile = "mobile"
        case password = "password"
        case gender = "gender"
    }
}

struct UserDetailedDetails: Codable{
    let additionalMobile: String?
    let qualification: String?
    let nationality: String?
    let state: String?
    let purpose: String?
    let address: String?
    let city: String?
    let pinCode: String?
    let motherTongue: String?
    let placeOfBirth: String?
    let otherLanguages: [String]?
    let idProof: String?
    let validFrom: Date?
    let validTo: Date?
    
    enum CodingKeys: String, CodingKey{
        case additionalMobile = "additionalMobile"
        case qualification = "qualification"
        case nationality = "nationality"
        case state = "state"
        case purpose = "purpose"
        case address = "address"
        case city = "city"
        case pinCode = "pinCode"
        case motherTongue = "motherTongue"
        case placeOfBirth = "placeOfBirth"
        case otherLanguages = "otherLanguages"
        case idProof = "idProof"
        case validFrom = "validFrom"
        case validTo = "validTo"
    }
}
