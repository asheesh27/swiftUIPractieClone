//
//  StringExtensions.swift
//  GeotheLearningClone
//
//  Created by Palnar on 11/01/23.
//

import Foundation

extension String{
    var containsDigits: Bool {
        return self.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil
    }
    
    var containsWhitespaceAndNewlines: Bool {
        return self.rangeOfCharacter(from: .whitespacesAndNewlines) != nil
    }
    
    var isValidPassword: Bool {
        let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: self)
    }
    
    var isValidEmail:  Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    var isNumeric: Bool {
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        return Set(self).isSubset(of: nums)
    }
}
