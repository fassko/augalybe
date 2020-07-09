//
//  RestaurantDetailsView.swift
//  auGalybe
//
//  Created by Kristaps Grinbergs on 09/07/2020.
//

import SwiftUI

class RestaurantDetailsViewModel: ObservableObject {
  @Published var restaurant: Restaurant
  
  init(restaurant: Restaurant) {
    self.restaurant = restaurant
  }
}

struct RestaurantDetailsView: View {
  @ObservedObject var viewModel: RestaurantDetailsViewModel
  
  var body: some View {
    VStack {
      Text(viewModel.restaurant.title)
      Text(viewModel.restaurant.facebook)
    }
  }
}


//struct RestaurantDetailsView_Previews: PreviewProvider {
//  static var previews: some View {
//    RestaurantDetailsView(restaurant: )
//  }
//}
