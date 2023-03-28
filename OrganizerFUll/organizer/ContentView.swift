//
//  ContentView.swift
//  organizer
//
//  Created by Hisham Abboud on 28/02/2023.
//

import SwiftUI
import MapKit
import UIKit



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Organizer")
                    .font(.largeTitle.weight(.bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .clipped()
                    .padding(.leading)
                    .padding(.bottom, 8)
                ForEach(0..<1) { _ in
                    VStack(alignment: .leading) {
                        Text("Trips")
                            .padding(.leading)
                            .font(.title3.weight(.bold))
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0..<1) { _ in
                                    VStack(alignment: .leading) {
                                        Image("Image")
                                            .renderingMode(.original)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 250, height: 141)
                                            .clipped()
                                            .mask { RoundedRectangle(cornerRadius: 10, style: .continuous) }
                                            .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 3)
                                        Text("Home")
                                            .font(.headline.weight(.medium))
                                        Text("")
                                            .font(.footnote.weight(.medium))
                                            .foregroundColor(.secondary)
                                    }
                                    .frame(width: 250)
                                    .clipped()
                                }
                            }
                            .padding(.horizontal)
                        }
                        ZStack {
                            Image("")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 392, height: 450)
                                .clipped()
                            
                            .foregroundColor(.white)
                        }
                        .padding(.top, 16)
                    }
                    .padding(.vertical)
                }
            }
         
            .frame(maxWidth: .infinity)
            .clipped()
            .padding(.top, 98)
            .padding(.bottom, 150)
        }
        .overlay(alignment: .top) {
            HStack {
                Spacer()
                
                .frame(width: 109)
                .clipped()
                .font(.body.weight(.semibold))
            }
            .padding(.horizontal)
            .padding(.top, 5)
            .frame(maxWidth: .infinity)
            .clipped()
            .frame(height: 53)
            .clipped()
       
        }
        .overlay(alignment: .bottom) {
            VStack(spacing: 0) {
                Divider()
                HStack(spacing: 10) {
                    ForEach(0..<1) { _ in
                        VStack(spacing: 4) {
                            Image(systemName: "play.circle.fill")
                                .imageScale(.large)
                                .frame(height: 26)
                                .clipped()
                            Text("Trips")
                                .font(.caption)
                        }
                        .frame(maxWidth: .infinity)
                        .clipped()
                        .frame(height: 45)
                        .clipped()
                        .foregroundColor(.secondary)
                    }
                }
                .padding(.horizontal, 15)
                .padding(.top, 5)
            }
            .frame(height: 84, alignment: .top)
            .clipped()
            .background {
                Rectangle()
                    .fill(.clear)
                    .background(Material.bar)
            }
        }
    }
}


struct PlacePin: Identifiable {
    let id: String
    let location: CLLocationCoordinate2D
    
    init(id: String = UUID().uuidString, latitude: Double, longitude: Double) {
        self.id = id
        self.location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

public extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 1000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}

extension UIImage {
  convenience init?(url: URL?) {
    guard let url = url else { return nil }
            
    do {
      self.init(data: try Data(contentsOf: url))
    } catch {
      print("Cannot load image from url: \(url) with error: \(error)")
      return nil
    }
  }
}
