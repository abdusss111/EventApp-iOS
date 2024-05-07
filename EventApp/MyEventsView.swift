//
//  MyEventsView.swift
//  EventApp
//
//  Created by Abdussalam Abdurakhimov on 07.05.2024.
//

import SwiftUI

import SwiftUI

struct MyEventsView: View {
    let events: [Event]
    
    var body: some View {
        VStack {
            Text("My Events")
                .font(.title)
                .padding()
            
            List(events) { event in
                EventRowView(event: event)
            }
        }
    }
}

let myTestData = [
    Event(id:1, title: "Выставка современного искусства", date: "25 мая 2024"),

]

struct MyEventsView_Previews: PreviewProvider {
    static var previews: some View {
        MyEventsView(events: myTestData)
    }
}

