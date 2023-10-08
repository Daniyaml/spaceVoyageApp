//
//  BaseTabView.swift
//  spacevoyage
//
//  Created by Daniyal Malik on 07.10.2023.
//

import SwiftUI

struct BaseTabView: View {
    var body: some View {
        TabView {
            
            HomeView(activtiesData: Activities(data: ActivitiesMockStore.activityData, items: ActivitiesMockStore.activities))
            .tag(0)
            .tabItem {
                Image(systemName: "house")
                Text("Explore")
            }
            
            
            BookingsView().navigationTitle("My Bookings").navigationBarTitleDisplayMode(.large)
            
            .tag(1)
            .tabItem {
                Image(systemName: "ticket.fill")
                Text("My Bookings")
            }
            
            NavigationView {
                TripPlannerView()
                  }
                   .tag(2)
                    .tabItem {
                    Image(systemName: "waveform")
                    Text("AI Trip Planner")
                }
            
            NavigationView {
                     AccountView()
                  }
                   .tag(2)
                    .tabItem {
                    Image(systemName: "person.fill")
                    Text("Account")
                }
        }
    }
}
