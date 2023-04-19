//
//  FavoritePrimeManager.swift
//  PrimeNumberCounter
//
//  Created by Puneet Sharma on 17.04.23.
//

import Foundation

class FavoritePrimeManager: ObservableObject {
    @Published var favoriteList: Array<Int> = []

    func insertPrime(_ prime: Int) {
        favoriteList.append(prime)
    }

    func removePrime(_ prime: Int) {
        favoriteList.removeAll { value in
            value == prime
        }
    }

    func removeAt(_ index: Int) {
        favoriteList.remove(at: index)
    }

    func isFavorite(_ prime: Int) -> Bool {
        favoriteList.contains { value in
            value == prime
        }
    }
}
