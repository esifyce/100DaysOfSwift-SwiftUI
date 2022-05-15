//
//  ContentView.swift
//  Converter
//
//  Created by Sabir Myrzaev on 14/5/22.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var tipSelectedTemperature = "Celsius"
    @State private var tipConverterTemperature = "Celsius"
    @FocusState private var amountIsFocused: Bool
    
    let tipTemperatures = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var totalPerTemperature: Double {
        switch tipSelectedTemperature {
        case "Celsius":
            switch tipConverterTemperature {
            case "Fahrenheit": return (checkAmount * 9/5) + 32
            case "Kelvin": return checkAmount + 273.15
            default: return checkAmount
            }
        case "Fahrenheit":
            switch tipConverterTemperature {
            case "Celsius": return (checkAmount - 32) * 5/9
            case "Kelvin": return (checkAmount - 32) * 5/9 + 273.15
            default: return checkAmount
            }
        case "Kelvin":
            switch tipConverterTemperature {
            case "Celsius": return 40 - 273.15
            case "Fahrenheit": return (checkAmount - 273.15) * 9/5 + 32
            default: return checkAmount
            }
        default: return checkAmount
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                } header: {
                    Text("Input temperature")
                }
                
                Section {
                    Picker("Selected temperature", selection: $tipSelectedTemperature) {
                        ForEach(tipTemperatures, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                    
                    Picker("Converter temperature", selection: $tipConverterTemperature) {
                        ForEach(tipTemperatures, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                }
                
                Section {
                    Text(totalPerTemperature, format: .number)
                } header: {
                    Text("Converter result")
                }
            }.navigationTitle("Converter")
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            amountIsFocused = false
                        }
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
