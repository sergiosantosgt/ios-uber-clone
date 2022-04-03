//
//  SharedFunctions.swift
//  Uber
//
//  Created by Sergio Santos on 03/04/22.
//

import Foundation
import UIKit

class SharedFunctions {
    
    public func fieldValidate(field: UITextField) -> Bool {
        var isEmpty: Bool = false
        if (field.text?.isEmpty)! {
            isEmpty = true
        }
        return isEmpty
    }
    
    public func checkPasswordConfirmation(password: String, passwordConfirmation: String) -> Bool {
        var confirmation: Bool = true
        if password != passwordConfirmation {
            confirmation = false
        }
        return confirmation
    }
}
