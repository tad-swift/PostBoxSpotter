//
//  ContentView.swift
//  PostBoxSpotter
//
//  Created by Jake Maidment on 15/05/2023.
//

//THIS IS THE MAP VIEW, WHERE USERS WILL ADD LOCATIONS TO THE MAP
//TEST

import MapKit
import SwiftUI
import CoreLocation

struct ExpandableButtonItem: Identifiable {
    let id = UUID()
    let label: Image
    let accessibilityLabel: String
    private(set) var action: (() -> Void)? = nil
}

struct ExpandableButtonPanel: View {
    let primaryItem: ExpandableButtonItem
    let secondaryItems: [ExpandableButtonItem]

    private let noop: () -> Void = {}
    private let size: CGFloat = 70
    private var cornerRadius: CGFloat {
        get { size / 2 }
    }
    private let shadowColor = Color.black.opacity(0.6)
    private let shadowPosition: (x: CGFloat, y: CGFloat) = (x: 2, y: 2)
    private let shadowRadius: CGFloat = 3

    @State private var isExpanded = false

    var body: some View {
        VStack {
            ForEach(secondaryItems) { item in
                Button(action: item.action ?? self.noop) {
                    Text(item.label)
                        .frame(
                            width: self.isExpanded ? self.size : 0,
                            height: self.isExpanded ? self.size : 0
                        )
                }
            }

            Button(action: {
                withAnimation {
                    self.isExpanded.toggle()
                }
                self.primaryItem.action?()
            }) {
                Text(primaryItem.label)
                    .frame(width: size, height: size)
                    .foregroundColor(.blue)
            }
        }
        .background(Color(UIColor.white).opacity(0.7))
        .foregroundColor(.blue)
        .cornerRadius(cornerRadius)
        .font(.title)
        .shadow(
            color: shadowColor,
            radius: shadowRadius,
            x: shadowPosition.x,
            y: shadowPosition.y
        )
    }
}

struct ContentView: View {
    @ObservedObject private var viewModel = ViewModel()
    @State private var alertLabel: String = ""
    @State private var navigateToHome = false
    @State private var navigateToCypherView = false

    var body: some View {
        NavigationView {
            ZStack {
                Map(coordinateRegion: $viewModel.mapRegion, showsUserLocation: true, annotationItems: viewModel.locations) { location in
                    MapAnnotation(coordinate: location.coordinate) {
                        VStack {
                            Image("PBMark")
                                .resizable()
                                .frame(width: 54, height: 54)
                            
                            Text(location.name)
                                .fixedSize()
                        }
                        .onTapGesture {
                            viewModel.selectedPlace = location
                        }
                    }
                }
                .ignoresSafeArea()
                
                Image(systemName: "target")
                    .opacity(0.8)
                    .frame(width: 28, height: 28)
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        VStack{
                            Spacer()
                            NavigationLink(destination: HomeView().navigationBarBackButtonHidden(true), isActive: $navigateToHome) {
                                Image(systemName: "plus")
                                    .opacity(0.0)
                            }
                            .padding()
                            .background(Color.black.opacity(0.0))
                            .foregroundColor(.white)
                            .font(.title)
                            .clipShape(Circle())
                            .padding(.trailing)
                            
                            NavigationLink(destination: CypherView(), isActive: $navigateToCypherView) {
                                ExpandableButtonPanel(
                                    primaryItem: ExpandableButtonItem(label: Image(systemName: "arrow.up.arrow.down.circle.fill"), accessibilityLabel: "Expand"),
                                    secondaryItems: [
                                        ExpandableButtonItem(label: Image(systemName: "plus"), accessibilityLabel: "Add Location") {
                                            viewModel.addLocation()
                                        },
                                        ExpandableButtonItem(label: Image(systemName: "questionmark.circle.fill"), accessibilityLabel: "Cypher View") {
                                            navigateToCypherView = true
                                        },
                                        ExpandableButtonItem(label: Image(systemName: "house.fill"), accessibilityLabel: "Go Home") {
                                            navigateToHome = true
                                        }
                                    ]
                                )
                            }
                            .foregroundColor(.black)
                            .padding()
                            
                            Button(action: {
                                viewModel.centerOnUserLocation()
                            }) {
                                Image(systemName: "location.circle.fill")
                                    .font(.title)
                                    .padding()
                                    .background(Color.white.opacity(0.7))
                                    .clipShape(Circle())
                                    .shadow(radius: 5)
                            }
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .sheet(item: $viewModel.selectedPlace) { place in
            NewEditView(location: place) {
                viewModel.update(location: $0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



