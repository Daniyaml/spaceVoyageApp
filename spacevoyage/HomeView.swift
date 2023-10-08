//
//  HomeView.swift
//  spacevoyage
//
//  Created by Daniyal Malik on 07.10.2023.
//

import SwiftUI


struct HomeView: View {
    @ObservedObject var activtiesData : Activities
    @ObservedObject var selectedActivity = ActivitySelected()
    @State var isShowing: Bool = false
    @State var placeItemSelected: ActivitiesPlaces? = nil
    var body: some View {
        GeometryReader { g in
            ScrollView{
                    VStack(alignment: .leading) {
                        ZStack {
                            Image("main").resizable().frame(width: UIScreen.main.bounds.size.width, height: 300)
                            VStack{
                                Spacer()
                                HStack{
                                    Text("Explore with Space Voyage").font(.largeTitle)
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                        .padding(.leading)
                                        .padding(.bottom)
                                    Spacer()
                                }
                            }
                        }
                        SearchBarNavigationLink(destination: PlanetsView())
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack (spacing: 10){
                                ForEach(self.activtiesData.activities, id: \.id) { item in
                                    ShopPromotionBannerView(activtiesItems: item, selectedActivity: self.selectedActivity)
                                            .frame(width: 120, height: 60)
                                }
                            }.padding(.leading, 30)
                            .padding(.trailing, 30)
                            .padding(.bottom, 10)
                        }
                        .padding(.top, 20)
                        
                        Text("\(self.activtiesData.activities[self.selectedActivity.index].activityNameLabel)")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .padding(.leading, 30)
                            .padding(.top, 10)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                                    HStack (spacing: 10) {
                                        ForEach(self.activtiesData.activitiesCollection[self.selectedActivity.index].activitiesPlaces, id: \.id) { item in
                                            NavigationLink {
                                                TripView()
                                            } label: {
                                                ShopBestSellerViews(activityPlaces: item)
                                                                    .frame(width: 155, height: 225)
                                            }

                                            
                                        }
                                        
                                }.padding(.leading, 30)
                                 .padding(.trailing, 30)
                                 .padding(.bottom, 10)
                                
                        }
                        
                        VStack (spacing: 20) {
                            ForEach(self.activtiesData.activitiesCollection[self.selectedActivity.index].activityResources, id: \.id) { item in
                                ShopNewProductViews(activityResources: item)
                                         .frame(width: g.size.width - 60, height: g.size.width - 60)
                            }
                        }.padding(.leading, 30)
                        
                        
                    }
            }
        }.edgesIgnoringSafeArea(.top)
    }
}


struct SearchBarNavigationLink<Destination: View>: View {
    var destination: Destination

    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.gray)
                Text("Search...")
                    .foregroundColor(Color.gray)
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(
                Capsule()
                    .fill(Color(UIColor.systemGray5))
            )
            .padding()
        }
        .buttonStyle(PlainButtonStyle())
    }
}
