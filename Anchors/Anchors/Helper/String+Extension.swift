//
//  String+Extension.swift
//  Anchors
//
//  Created by Rahul on 08/05/21.
//

import Foundation

extension String {
    func isEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        let isValid = emailTest.evaluate(with: self)
        return isValid
    }
}
