//
//  RestaurantsMapView.swift
//  auGalybe
//
//  Created by Kristaps Grinbergs on 09/07/2020.
//

import MapKit
import SwiftUI

struct RestaurantsMapView: View {
  @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
  
  
  var body: some View {
    NavigationView {
      Map(coordinateRegion: $region)
        .navigationBarTitle("Map", displayMode: .inline)
        .navigationBarItems(
                            trailing:
                              Button(action: {
                                print("refresh")
                              }, label: {
                                Image(systemName: "arrow.clockwise")
                              })
                        )
    }
  }
}

struct RestaurantsMapView_Previews: PreviewProvider {
  static var previews: some View {
    RestaurantsMapView()
  }
}
