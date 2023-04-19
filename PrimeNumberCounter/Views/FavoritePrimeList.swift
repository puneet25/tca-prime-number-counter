//
//  FavoritePrimeList.swift
//  PrimeNumberCounter
//
//  Created by Puneet Sharma on 01.01.23.
//

import SwiftUI

struct FavoritePrimeList: View {
    @EnvironmentObject var favoritePrimeManager: FavoritePrimeManager

    var body: some View {
        List {
            ForEach(favoritePrimeManager.favoriteList, id: \.self) {
                favoritePrime in
                    Text("\(favoritePrime)")
            }
            .onDelete { indexSet in
                for index in indexSet {
                    favoritePrimeManager.removeAt(index)
                }
            }
        }
        .navigationTitle("Favorite Primes")
    }
}

struct FavoritePrimeList_Previews: PreviewProvider {
    static var previews: some View {
        FavoritePrimeList()
    }
}
