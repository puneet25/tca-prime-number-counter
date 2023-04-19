//
//  File.swift
//  PrimeNumberCounter
//
//  Created by Puneet Sharma on 18.04.23.
//

import Foundation

class PrimeNumberProvider {

    func nthPrime(_ n: Int, callback: @escaping (Int?) -> Void) -> Void {
      wolframAlpha(query: "prime \(n)") { result in
        callback(
          result
            .flatMap {
              $0.queryresult
                .pods
                .first(where: { $0.primary == .some(true) })?
                .subpods
                .first?
                .plaintext
            }
            .flatMap(Int.init)
        )
      }
    }

    private func wolframAlpha(query: String, callback: @escaping (WolframAlphaResult?) -> Void) -> Void {
        var components = URLComponents(string: "https://api.wolframalpha.com/v2/query")!
        components.queryItems = [
          URLQueryItem(name: "input", value: query),
          URLQueryItem(name: "format", value: "plaintext"),
          URLQueryItem(name: "output", value: "JSON"),
          URLQueryItem(name: "appid", value: "K86W79-X2Q3XK9JE7"),
        ]

        URLSession.shared.dataTask(with: components.url(relativeTo: nil)!) { data, response, error in
          callback(
            data
              .flatMap { try? JSONDecoder().decode(WolframAlphaResult.self, from: $0) }
          )
          }
          .resume()
      }
}
