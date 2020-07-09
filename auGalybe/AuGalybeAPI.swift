//
//  AuGalybeAPI.swift
//  auGalybe
//
//  Created by Kristaps Grinbergs on 06/09/2019.
//  Copyright © 2019 fassko. All rights reserved.
//

import Combine
import Foundation

struct AuGalybeAPI {
  
  private var dataURL: URL {
    guard CommandLine.arguments.contains("-localData") else {
      return URL(string: "https://box.tustinarvai.lt/tools/augalybe-app/api/restaurants")!
    }
    
    return Bundle.main.url(forResource: "restaurants", withExtension: "json")!
  }
  
  func getRestaurants() -> AnyPublisher<[Restaurant], Never> {
    let request = URLRequest(url: dataURL, cachePolicy: .reloadIgnoringLocalCacheData)
    
    return URLSession.shared
      .dataTaskPublisher(for: request)
      .map { $0.data }
      .decode(type: Restaurants.self, decoder: JSONDecoder())
      .map { $0.restaurants.map { $0.restaurant } }
      .map { $0.filter { $0.latitude != nil && $0.longitude != nil } }
      .print()
      .replaceError(with: [])
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }
}
