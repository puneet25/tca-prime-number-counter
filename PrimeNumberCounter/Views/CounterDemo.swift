//
//  StateManagementView.swift
//  PrimeNumberCounter
//
//  Created by Puneet Sharma on 09.12.22.
//

import SwiftUI

struct CounterDemo: View {
    @Binding var counter: Int
    @State private var presentModal = false
    @State private var presentAlert = false
    @State private var nthPrime: Int?
    @State private var disableButton = false

    let primeNumberProvider = PrimeNumberProvider()

    let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .ordinal
        return numberFormatter
    }()

    var counterText: String {
        numberFormatter.string(from: NSNumber(integerLiteral: counter))!
    }

    var body: some View {
        VStack {
            HStack {
                Button("-") {
                    counter = counter - 1
                }.disabled(counter < 1 || disableButton)
                Text(String(counter))
                Button("+") {
                    counter = counter + 1
                }.disabled(disableButton)
            }
            Button("Is this prime?") {
                presentModal = true
            }
            .sheet(isPresented: $presentModal) {
                PrimeView(number: counter)
            }
            .alert(
                "The \(counterText) prime is \(2)",
                isPresented: $presentAlert,
                actions: {
                    Button("OK", role: .cancel) {
                        presentAlert = false
                        disableButton = false
                    }
                }
            )

            Button("What's the \(counterText) prime?") {
                disableButton = true
                primeNumberProvider.nthPrime(counter) { result in
                    nthPrime = result
                    presentAlert = true
                }
            }.disabled(disableButton)
        }
    }
}

struct CounterDemo_Previews: PreviewProvider {
    static var previews: some View {
        @State var counter = 0
        CounterDemo(counter: $counter)
    }
}
