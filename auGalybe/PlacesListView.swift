//
//  PlacesListView.swift
//  auGalybe
//
//  Created by Kristaps Grinbergs on 09/07/2020.
//

import Combine
import SwiftUI

typealias DisposeBag = Set<AnyCancellable>

class PlacesListViewModel: ObservableObject {
  let api = AuGalybeAPI()
  
  @Published var restaurants = [Restaurant]()
  
  private var disposeBag = DisposeBag()
  
  func getRestaurants() {
    api.getRestaurants()
      .assign(to: \.restaurants, on: self)
      .store(in: &disposeBag)
  }
}

struct PlacesListView: View {
  
  @ObservedObject var viewModel = PlacesListViewModel()
  
  var body: some View {
    NavigationView {
      List(viewModel.restaurants) { restaurant in
        NavigationLink(destination: RestaurantDetailsView(viewModel: RestaurantDetailsViewModel(restaurant: restaurant))) {
          Text(restaurant.title)
        }
      }.onAppear {
        viewModel.getRestaurants()
      }
      .listStyle(PlainListStyle())
      .navigationTitle("Restaurants")
      .navigationBarItems(
        trailing:
          Button(action: {
            viewModel.getRestaurants()
          }, label: {
            Image(systemName: "arrow.clockwise")
          })
      )
    }
  }
}

struct PlacesListView_Previews: PreviewProvider {
  static var previews: some View {
    PlacesListView()
  }
}
