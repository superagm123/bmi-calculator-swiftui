//
//  ContentView.swift
//  BMICalculator
//
//  Created by Alfonso Gonzalez Miramontes on 04/09/24.
//

import SwiftUI

enum Units: String, Identifiable, CaseIterable{
    case metric
    case imperial
    
    var id: Self {
        self
    }
}

struct ContentView: View{
    
    @State private var selectedUnit: Units = .metric
    @State private var isPresented: Bool = false
    @State private var weight: String = ""
    @State private var height: String = ""
    @State private var result: Double = 0
    
    private var areNumericValues: Bool{
        return weight.isNumber && height.isNumber
    }
    
    private var areNotEmptyValues: Bool{
        return !weight.isEmpty && !height.isEmpty
    }
    
    private var bmiInfo: String{
        switch result{
        case ..<18.5:
            return "Underweight"
        case 18.5...25:
            return "Normal Weight"
        case 25...30:
            return "Overweight"
        case 30..<41:
            return "Obese"
            default:
            return "Invalid value, please try again."
        }
    }
    
    var body: some View{
        VStack(spacing: 50){
            Text("BMI CALCULATOR")
                .font(.largeTitle)
            Picker("", selection: $selectedUnit){
                ForEach(Units.allCases, id: \.rawValue){unit in
                    Text(unit.rawValue).tag(unit)
                        .accessibilityIdentifier("selectedUnit")
                }
            }
            .accessibilityIdentifier("picker")
            .pickerStyle(.segmented)
            HStack{
                TextField("Weight", text:$weight)
                    .accessibilityIdentifier("weight")
                Text(selectedUnit.rawValue == "metric" ? "kg" : "lb")
               
            }
            Text("Weight needs to be a number").show(!weight.isNumber && !weight.isEmpty)
                .font(.caption)
                .foregroundStyle(.red)
            HStack{
                TextField("Height", text: $height)
                    .accessibilityIdentifier("height")
                Text(selectedUnit.rawValue == "metric" ? "cm" : "ft/in")
            }
            Text("Height needs to be a number").show(!height.isNumber && !height.isEmpty)
                .font(.caption)
                .foregroundStyle(.red)
            Button("Calculate"){
                if areNumericValues && areNotEmptyValues{
                    result = calculateBMI(with: selectedUnit)
                    isPresented = true
                }
            }
            .accessibilityIdentifier("calculateButton")
            .alert("Result", isPresented: $isPresented){
                Text("Your bmi is: \(String(format: "%.2f", result))")
                Button("Close"){
                    weight = ""
                    height = ""
                }.accessibilityIdentifier("closeAlertButton")
            }message: {
                Text(bmiInfo)
            }.font(.title)
            .foregroundStyle(.cyan)
            .font(.title2)
        }
        .textFieldStyle(.roundedBorder)
        .padding()
    }
    
    private func calculateBMI(with selection: Units) -> Double{
        if selection.rawValue == "metric"{
            return Double(weight)! / pow((Double(height)! / 100), 2)
        }else{
            let heightValue = height.split(separator:".")
            let foot = Double(heightValue[0])!
            let inches = Double(heightValue[1])!
            return 703 * (Double(weight)! / pow((foot * 12) + inches, 2))
        }
    }
}


#Preview{
    ContentView()
}
