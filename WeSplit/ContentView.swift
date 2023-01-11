//
//  ContentView.swift
//  WeSplit
//
//  Created by jacob aberasturi on 1/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 1
    @State private var tipPercentage = 20
    
    let tipPercentages = [10, 15, 20, 25, 0]
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(1..<100) {
                            if $0 == 1 {
                                Text("\($0) Person")
                            }
                            else {
                                Text("\($0) People")
                            }
                        }
                    }
                }
                
                Section {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much do you want to tip")
                }
                
                Section {
                    Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
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
