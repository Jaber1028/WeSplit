//
//  ContentView.swift
//  WeSplit
//
//  Created by jacob aberasturi on 1/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    // Used to reduce duplicate code and compute total cost
    var peopleCount: Double {
        return Double (numberOfPeople + 1)
    }
    
    // Used to reduce duplicate code
    var currencyFormat: FloatingPointFormatStyle<Double>.Currency {
        return .currency(code: Locale.current.currency?.identifier ?? "USD")
    }
    
    // Used to add a Done button, hiding the keyboard`
    @FocusState private var amountIsFocused: Bool
    
    var totalPerPerson: Double {
        // Calculates Tip and splits it per person
        let tipSelection = Double (tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    // Insert Check Inital Cost
                    TextField("Amount", value: $checkAmount, format: currencyFormat)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(1..<100) {
                            $0 == 1 ? Text("\($0) Person") : Text("\($0) People")

                        }
                    }
                }
                
                Section {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                } header: {
                    Text("How much do you want to tip")
                }
                
                Section {
                    Text(totalPerPerson, format: currencyFormat)
                } header: {
                    Text("Amount per person")
                }
                
                Section {
                    Text(totalPerPerson * peopleCount, format: currencyFormat)
                } header: {
                    Text("Total amount for check")
                }
            } .navigationTitle("WeSplit")
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        // Moves button to the right
                        // Convential IOS placement
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
