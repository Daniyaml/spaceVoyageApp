//
//  BookingsView.swift
//  spacevoyage
//
//  Created by Arlan Kalin on 08.10.2023.
//

import SwiftUI

struct BookingsView: View {
    @State var selectedTabIndex = 0
    var body: some View {
        VStack(alignment: .leading) {
                    SlidingTabView(selection: self.$selectedTabIndex, tabs: ["Upcoming", "All Tickets"])
            (selectedTabIndex == 0 ? AnyView(MyListView(items: MyListView.sharedItems1).navigationTitle("Upcoming").offset(x: 0, y: -15)) : AnyView(MyListView(items: MyListView.sharedItems2).navigationTitle("All Items").offset(x: 0, y: -15)))
                    Spacer()
        }.padding(.bottom)
        .background(.clear)
        .animation(.none)
    }
}

struct BookingsView_Previews: PreviewProvider {
    static var previews: some View {
        BookingsView()
    }
}

struct ItemData: Identifiable {
    var id: Int
    var photo: String
    var title: String
    var status: String
    var address: String
    var date: String
    var color: UIColor
}

struct ItemView: View {
    var data: ItemData
    @State var isShowing: Bool = false
    var body: some View {
        HStack {
            HStack {
                Image(data.photo)
                    .frame(width: 50, height: 50)
                    .background(Rectangle().fill(Color.gray).cornerRadius(8))
                    .clipShape(Rectangle())
                    .cornerRadius(8)
                    .padding(.trailing, 10)
                VStack(spacing: 5) {
                    HStack {
                        Text(data.title)
                            .font(.callout)
                            .lineLimit(2)
                        Spacer()
                        Text(data.status)
                            .foregroundColor(Color(data.color))
                            .font(.caption)
                            .lineLimit(1)
                    }
                    HStack {
                        Text(data.address)
                            .font(.caption2)
                            .lineLimit(1)
                        Spacer()
                        Text(data.date)
                            .font(.caption)
                            .lineLimit(1)
                    }
                }
                Image(systemName: "info")
                    .frame(width: 25, height: 25)
                    .background(Circle().fill(Color.gray))
                    .padding(.leading, 10).onTapGesture {
                        self.isShowing = true
                    }
            }
            .padding()
            .background(Rectangle().fill(Color.clear))
            .cornerRadius(10)
            
        }
        .sheet(isPresented: self.$isShowing) { TicketView(isShowing: $isShowing) }
    }
}

struct MyListView: View {
    var items: [ItemData]
    var body: some View {
        List(items) { item in
            ItemView(data: item)
        }.onAppear {
            UITableView.appearance().tableFooterView = UIView()
            UITableView.appearance().separatorStyle = .none
        }
    }
}

extension MyListView {
    static var sharedItems1 = [
        ItemData(id: 1, photo: "velles2", title: "Velles Canyon", status: "Booked", address: "Mars, Solar System", date: "25 Aug", color: .green),
        ItemData(id: 2, photo: "moon_half", title: "MoonWalk on Dark Side", status: "Booked", address: "Moon, Earth Orbit", date: "27 Aug", color: .green),
    ]
    
    static var sharedItems2 = [
        ItemData(id: 3, photo: "venus", title: "Hot Date near Venus", status: "Completed", address: "Ahmedabad, Gujarat", date: "28 Jul", color: .green),
        ItemData(id: 4, photo: "saturn", title: "Rings of Saturn", status: "Canceled", address: "Vizag", date: "21 Jul", color: .red)
    ]
}
