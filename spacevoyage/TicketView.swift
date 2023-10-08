//
//  TicketView.swift
//  spacevoyage
//
//  Created by Daniyal Malik on 08.10.2023.
//

import SwiftUI

struct TicketView: View {
    @Binding var isShowing: Bool
    var body: some View {
        VStack {
            // Header
            ZStack {
                Image("velles2").resizable().frame(width: UIScreen.main.bounds.size.width, height: 300).onDisappear {
                    self.isShowing = false }
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
            .padding(.bottom)
            
            
            // Date and Time
            HStack {
                VStack(alignment: .leading) {
                    Text("DATE")
                        .fontWeight(.semibold)
                    Text("Mon, Sept 30, 2024")
                }.padding(.trailing, 40)
                VStack(alignment: .leading) {
                    Text("TIME")
                        .fontWeight(.semibold)
                    Text("9:00AM")
                }
                Spacer()
            }
            .padding(.horizontal)
            
            // QR Code and Name
            HStack {
                Image(systemName: "qrcode")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding()
                VStack(alignment: .leading) {
                    Text("Daniyal Malik")
                        .font(.title2)
                    Text("Ticket 1 of 1 (Adult)")
                }
                Spacer()
            }
            
            // Icons and Options
            VStack(spacing: 20) {
                HStack {
                    Image(systemName: "doc.text")
                    Text("Ticket details").foregroundColor(.blue)
                    Spacer()
                }
                HStack {
                    Image(systemName: "airplane")
                    Text("Departure details").foregroundColor(.blue)
                    Spacer()
                }
                HStack {
                    Image(systemName: "envelope")
                    Text("Email ticket").foregroundColor(.blue)
                    Spacer()
                }
            }
            .padding()
            
            // Apple Wallet Button
            Button(action: {}) {
                HStack {
                    Spacer()
                    Text("Add to Apple Wallet")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding()
                .background(Color.orange)
                .cornerRadius(12)
                .padding(.horizontal)
            }
            
            Spacer()
        }.edgesIgnoringSafeArea(.top)
        .background(Color.white)
        .padding()

    }
}

