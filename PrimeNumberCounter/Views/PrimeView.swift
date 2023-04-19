//
//  IsPrimeView.swift
//  PrimeNumberCounter
//
//  Created by Puneet Sharma on 01.01.23.
//

import SwiftUI

struct PrimeView: View {
    let number: Int

    @EnvironmentObject var favoritePrimeManager: FavoritePrimeManager

    var body: some View {
        VStack {
            if isPrime(number) {
                Text("\(number) is prime 🎉")

                if favoritePrimeManager.favoriteList.contains(number) {
                    Button {
                        favoritePrimeManager.removePrime(number)
                    } label: {
                        Text("Remove from favorite prime")
                    }
                } else {
                    Button {
                        favoritePrimeManager.insertPrime(number)
                    } label: {
                        Text("Save to favorite primes")
                    }
                }
            }
            else {
                Text("\(number) is not prime")
            }
        }
    }

    func isPrime(_ n: Int) -> Bool {
        guard n >= 2     else { return false }
        guard n != 2     else { return true  }
        guard n % 2 != 0 else { return false }
        return !stride(from: 3, through: Int(sqrt(Double(n))), by: 2).contains { n % $0 == 0 }
    }
}

struct PrimeView_Previews: PreviewProvider {
    static var previews: some View {
        PrimeView(number: 3).environmentObject(FavoritePrimeManager())
    }
}
