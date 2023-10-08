//
//  TripView.swift
//  SwiftUIStarterKitApp
//
//  Created by Daniyal Malik on 08.10.2023.
//  Copyright © 2023 NexThings. All rights reserved.
//

import SwiftUI

struct TripView: View {
    @State private var showAlert = false
    var body: some View {
        ScrollView{
            VStack {
                ZStack {
                    Image("velles2").resizable().frame(width: UIScreen.main.bounds.size.width, height: 300)
                    VStack{
                        Spacer()
                        HStack{
                            Text("Velles Canyon Tour").font(.largeTitle)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .padding(.leading)
                                .padding(.bottom)
                            Spacer()
                        }
                    }
                }
                
                // Status Badge
                
                VStack(spacing: 15) {
                    // Title and Price
                    HStack {
                        Text("Martian Grand Canyon Adventure").font(.headline).fontWeight(.bold).multilineTextAlignment(.center)
                        Spacer()
                    }
                    HStack{
                        Text("from").font(.body)
                        Text("$2290,98").font(.headline)
                        Spacer()
                    }
                    
                    HStack{
                        Text("Overview")
                            .font(.title)
                            .padding(.top).fontWeight(.bold)
                        Spacer()
                    }
                    HStack {
                        Text("Valles Marineris, often referred to as Valles Canyon, is the largest canyon in the solar system, located on Mars. Stretching over 4,000 km long and reaching depths of up to 7 km, it's a wonder that truly showcases the unique geological history of Mars. A tour to Valles Marineris offers breathtaking panoramic views and a once-in-a-lifetime opportunity to explore this Martian marvel.")
                            .font(.body)
                            .padding(.vertical, 10)
                        Spacer()
                    }
                    
                    // Rating
                    HStack {
                        ForEach(0..<5) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                        Text("1656 Reviews")
                            .font(.footnote)
                        Spacer()
                    }.padding(.bottom)
                    
                    HStack{
                        Text("Itinerary")
                            .font(.title)
                            .padding(.top).fontWeight(.bold)
                        Spacer()
                    }
                    
                    
                    // Items we will explore in the canyons on Mars
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                            Text("Explore the depth of Valles Marineris")
                            Spacer()
                        }
                        
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                            Text("Witness the Martian sunset from the canyon rim")
                            Spacer()
                        }
                        
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                            Text("Walk along ancient riverbeds")
                            Spacer()
                        }
                        
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                            Text("Discover potential signs of ancient life")
                            Spacer()
                        }
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 20)
                    
                    
                    
                    VStack{
                        
                        // Meeting Point section
                        HStack{
                            Text("Meeting Point")
                                .font(.title)
                                .padding(.top)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        
                        HStack{
                            Text("NASA Headquarters").underline()
                            Spacer()
                        }
                        HStack{
                            Text("300 E St SW, Washington, DC 20546").underline()
                            Spacer()
                        }
                        
                        HStack{
                            Text("United States").underline()
                            Spacer()
                        }
                    }
                    // Overview Section
                    VStack(alignment: .leading, spacing: 20) {
                        HStack {
                            Image(systemName: "clock")
                            Text("8 hour 45 minutes (approx.)")
                            Spacer()
                        }
                        HStack {
                            Image(systemName: "calendar")
                            Text("Next available: Today")
                            Spacer()
                        }
                        HStack {
                            Image(systemName: "checkmark.circle")
                            Text("Instant confirmation")
                            Spacer()
                        }
                        HStack {
                            Image(systemName: "airplane.circle.fill")
                            Text("Crew Dragon Endeavour")
                            Spacer()
                        }
                    }
                    .padding()
                    .background(Color.white) // Set the background color of the card
                    .cornerRadius(10) // Add a corner radius
                    .shadow(radius: 4)
                    
                    
                    // Booking Button
                    VStack(spacing: 0) {
                                
                                // Apple Pay Button
                                Button(action: {}) {
                                    HStack {
                                        Spacer()
                                        Image(systemName: "applelogo")
                                            .font(.title)
                                        Text("Book with Apple Pay")
                                            .padding()
                                            .frame(maxWidth: .infinity)
                                        Spacer()
                                    }
                                    .background(Color.black)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                }
                                .padding()

                                // Card Button
                                Button(action: {}) {
                                    HStack {
                                        Spacer()
                                        Image(systemName: "creditcard")
                                            .font(.title)
                                        Text("Book with Card")
                                            .padding()
                                            .frame(maxWidth: .infinity)
                                        Spacer()
                                    }
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                }
                                .padding()

                                // Bitcoin Button
                        Button(action: {showAlert = true}) {
                                    HStack {
                                        Spacer()
                                        Image(systemName: "bitcoinsign.circle.fill") // Note: SwiftUI might not have a Bitcoin symbol by default. You might need to use an alternative or custom image.
                                            .font(.title)
                                        Text("Book with Bitcoin")
                                            .padding()
                                            .frame(maxWidth: .infinity)
                                        Spacer()
                                    }
                                    .background(Color.orange)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                }
                                .padding()
                            }
                    .alert(isPresented: $showAlert) {
                                    Alert(title: Text("Success!"),
                                          message: Text("Your trip is booked. Please check your bookings page."),
                                          dismissButton: .default(Text("Got it!"), action: {
                                        showAlert = false
                                    }))
                                }
                }.padding(.horizontal)
                
            }.edgesIgnoringSafeArea(.top)
        }.navigationTitle("Velles Canyon Tour")
    }
}

struct TripView_Previews: PreviewProvider {
    static var previews: some View {
        TripView()
    }
}
