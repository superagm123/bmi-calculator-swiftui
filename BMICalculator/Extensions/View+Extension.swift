//
//  View+Extension.swift
//  BMICalculator
//
//  Created by Alfonso Gonzalez Miramontes on 04/09/24.
//

import Foundation
import SwiftUI


extension View{
    @ViewBuilder
    func show(_ condition: Bool) -> some View{
        if condition{
            self
        }else{
            EmptyView()
        }
    }
}
