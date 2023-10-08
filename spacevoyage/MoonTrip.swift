//
//  MoonTrip.swift
//  spacevoyage
//
//  Created by Daniyal Malik on 08.10.2023.
//

import SwiftUI

struct MoonTripView: View {
    @State private var showAlert = false
    var body: some View {
        ScrollView{
            VStack {
                ZStack {
                    Image("moon_half").resizable().frame(width: UIScreen.main.bounds.size.width, height: 300)
                    VStack{
                        Spacer()
                        HStack{
                            Text("Moonwalk on Dark Side").font(.largeTitle)
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
                        Text("Lunar Expedition to the Unseen Side").font(.headline).fontWeight(.bold).multilineTextAlignment(.center)
                        Spacer()
                    }
                    HStack{
                        Text("from").font(.body)
                        Text("$5390,98").font(.headline)
                        Spacer()
                    }
                    
                    HStack{
                        Text("Overview")
                            .font(.title)
                            .padding(.top).fontWeight(.bold)
                        Spacer()
                    }
                    HStack {
                        Text("The far side of the Moon, also known as the dark side, remains a mystery to many. On this tour, experience the thrill of walking where no human has set foot before. Marvel at the uncharted lunar landscapes, the serene tranquility, and the vastness of outer space.")
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
                        Text("2132 Reviews")
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
                            Text("Witness the hidden craters and valleys")
                            Spacer()
                        }
                        
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                            Text("Experience weightlessness in lunar gravity")
                                                        Spacer()
                        }
                        
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                            Text("Capture photos of Earthrise")
                            Spacer()
                        }
                        
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                            Text("Collect lunar rock samples")
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
                            Text("NASA Lunar Launchpad").underline()
                            Spacer()
                        }
                        HStack{
                            Text("John F. Kennedy Space Center, FL").underline()
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
                            Text("3 days (approx.)")
                            Spacer()
                        }
                        HStack {
                            Image(systemName: "calendar")
                            Text("Next available: In 2 months")
                            Spacer()
                        }
                        HStack {
                            Image(systemName: "checkmark.circle")
                            Text("Training required")
                            Spacer()
                        }
                        HStack {
                            Image(systemName: "airplane.circle.fill")
                            Text("Ride aboard the Orion Spacecraft")
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
        }.navigationTitle("Moonwalk on Dark Side")
    }
}


