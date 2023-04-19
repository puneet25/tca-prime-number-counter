//
//  StateManagementView.swift
//  PrimeNumberCounter
//
//  Created by Puneet Sharma on 09.12.22.
//

import SwiftUI

struct StateManagementView: View {

    @StateObject var favoriteManagerPrime = FavoritePrimeManager()

    @State var counter = 0

    var body: some View {
        NavigationView {
            List {
                NavigationLink("Counter Demo") {
                    CounterDemo(counter: $counter)
                        .environmentObject(favoriteManagerPrime)
                }
                NavigationLink("Favorite primes") {
                    FavoritePrimeList()
                        .environmentObject(favoriteManagerPrime)
                }

            }
            .listStyle(.plain)
            .navigationTitle("State Management")
        }
    }
}

struct StateManagementView_Previews: PreviewProvider {
    static var previews: some View {
        StateManagementView()
    }
}
