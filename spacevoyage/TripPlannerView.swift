//
//  SwiftUIView.swift
//  spacevoyage
//
//  Created by Daniyal Malik on 08.10.2023.
//

import SwiftUI


struct TripPlannerView: View {
    @State private var userInput: String = ""
    @State private var counter: Int = 0
    
    let destinations = [
            Destination(image: "neptuneBay", name: "Neptune Bay", properties: "642 properties", averagePrice: "$2400/night"),
            Destination(image: "mistral", name: "Mistral Heights", properties: "318 properties", averagePrice: "$2200/night")
        ]
    var body: some View {
        ZStack {
                ScrollViewReader{ proxy in
                    ScrollView {
                        VStack(spacing: 20) {
                            // Title
                            VStack(alignment: .center){
                                
                                Text("Space Voyage AI")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text("Trip Planner")
                                    .font(.title)
                                    .fontWeight(.bold)
                                // Disclaimer
                                Text("Responses in this chat include machine-generated content and may contain errors.")
                                    .foregroundColor(.gray)
                                Text("Please read the AI Trip Planner disclaimer")
                                    .foregroundColor(.blue)
                                Text("before chatting.")
                                    .foregroundColor(.gray)
                            }.padding(.top, 40)
                            
                            Spacer().frame(height: 20)
                            
                            // AI Trip Planner Chat 1
                            VStack(alignment: .leading){
                                HStack{
                                    VStack(alignment: .leading) {
                                        Text("AI Trip Planner")
                                            .fontWeight(.bold)
                                            .padding(.top)
                                        
                                        Text("Greetings space traveler! I'm the AI Trip Planner. I'm continually updating my cosmic knowledge. How can I assist with your interstellar journey?")
                                    }
                                    .padding()
                                    .background(Color(.systemGray5))
                                    .cornerRadius(10)
                                    Spacer()
                                }
                                
                                
                                // User Chat
                                if counter >= 1 {
                                    HStack{
                                        Spacer()
                                        VStack(alignment: .leading) {
                                            Text("I'm considering a family trip to Neptune. What should we expect?")
                                        }
                                        .padding()
                                        .background(Color(.systemBlue))
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                    }
                                    .id(1)
                                }
                                
                                // AI Trip Planner Chat 2
                                if counter >= 2 {
                                    VStack(alignment: .leading) {
                                        Text("AI Trip Planner")
                                            .fontWeight(.bold)
                                            .padding(.top)
                                        
                                        Text("Neptune is a mesmerizing gas giant, known for its intense blue hues. You'll experience extremely high winds, magnificent storms, and a chance to witness its dark vortex up close. Please remember, it's vital to remain in your spacecraft or suited up due to harsh conditions. Attractions include flying over the Great Dark Spot and surfing the supersonic winds. It's a trip like no other!")
                                    }
                                    .padding()
                                    .background(Color(.systemGray5))
                                    .cornerRadius(10)
                                    .id(2)
                                }
                                
                                if counter >= 3 {
                                    HStack{
                                        Spacer()
                                        VStack(alignment: .leading) {
                                            Text("Can you provide me some options?")
                                        }
                                        .padding()
                                        .background(Color(.systemBlue))
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                    }.id(3)
                                }
                                
                                if counter>=4 {
                                    
                                    VStack(alignment: .leading) {
                                        Text("AI Trip Planner")
                                            .fontWeight(.bold)
                                            .padding(.top)
                                        
                                        Text("Sure! he have some options for your trip!")
                                    }
                                    .padding()
                                    .background(Color(.systemGray5))
                                    .cornerRadius(10).padding(.bottom)
                                    
                                    VStack {
                                        ScrollView(.horizontal, showsIndicators: false) {
                                            HStack(spacing: 20) {
                                                ForEach(destinations) { destination in
                                                    TripOptionView(destination: destination)
                                                }
                                            }
                                            .padding()
                                        }
                                    }
                                    .id(4)
                                }
                                Spacer().frame(height: 20).id(5)
                            }
                        }
                        .padding(.bottom, 70)
                        .padding()
                    }
                    .onChange(of: counter) { value in
                        if (value != 0) {
                            withAnimation {
                                proxy.scrollTo(counter, anchor: .bottom)
                            }
                        }
                    }
                    
                    
                }
            VStack {
                Spacer()
                HStack {
                    TextField("Type your message...", text: $userInput)
                        .padding(10)
                        .background(Color(.systemGray5))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    Button(action: {
                        // Action to send the message
                        counter+=1
                        userInput = ""
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            counter+=1
                        }
                        print("Sending message: \(userInput)")
                    }) {
                        Text("Send")
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.trailing)
                }
                .padding(.vertical)
                .background(.white)
            }
        }
    }
}



struct Destination: Identifiable {
    var id = UUID()
    var image: String
    var name: String
    var properties: String
    var averagePrice: String
}

struct TripOptionView: View {
    let destination: Destination
    
    var body: some View {
        VStack {
            Image(destination.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipped()
            Text(destination.name)
                .font(.title2)
                .fontWeight(.bold)
            Text(destination.properties)
                .foregroundColor(.gray)
            Text(destination.averagePrice)
                .fontWeight(.bold)
                .foregroundColor(.blue)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
