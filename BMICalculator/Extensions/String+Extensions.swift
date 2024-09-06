//
//  String+Extensions.swift
//  BMICalculator
//
//  Created by Alfonso Gonzalez Miramontes on 04/09/24.
//

import Foundation

extension String{
    var isNumber: Bool{
        Double(self) != nil
    }
}
