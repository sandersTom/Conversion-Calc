//
//  converter.swift
//  Conversion Calculator
//
//  Created by t s on 5/2/18.
//  Copyright © 2018 Shuper. All rights reserved.
//

import Foundation

struct converter {
    var label: String
    var inputType: String
    var outputType: String
    
    init(label: String, inputType: String, outputType: String) {
        self.label = label
        self.inputType = inputType
        self.outputType = outputType
    }
}
