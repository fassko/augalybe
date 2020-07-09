//
//  ContentView.swift
//  auGalybe
//
//  Created by Kristaps Grinbergs on 09/07/2020.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      RestaurantsMapView()
        .tabItem {
          Image(systemName: "map")
          Text("Map")
        }
      
      PlacesListView()
        .tabItem {
          Image(systemName: "list.dash")
          Text("List")
        }
    }
    
    
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
