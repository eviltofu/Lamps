//
//  PassCodeModel.swift
//  Lamps
//
//  Created by Jerome Chan on 13/6/23.
//

import Foundation

struct PassCodeModel {
    let passCodeString: String
    func validate(passCodeString: String) -> Bool {
        return self.passCodeString == passCodeString
    }
}
