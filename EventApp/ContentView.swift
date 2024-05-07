//
//  ContentView.swift
//  EventApp
//
//  Created by Abdussalam Abdurakhimov on 07.05.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            EventListView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            SearchView()
                .position(x:200, y:100)
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass.circle")
                }
            
            
            MyEventsView(events: myTestData) // Предполагается, что у вас есть список событий, на которые пользователь зарегистрирован
                .tabItem {
                    Label("My Events", systemImage: "calendar")
                }
            
            ProfileView(user: User(name: "John Doe", email: "john@example.com"))
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
            
            LoginView()
                .tabItem {
                    Label("Login", systemImage: "rectangle.portrait.and.arrow.forward.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
