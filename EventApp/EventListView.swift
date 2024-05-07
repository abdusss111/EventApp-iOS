import SwiftUI

struct Event: Identifiable, Decodable {
    let id: Int
    let title: String
    let date: String
    // Добавьте другие свойства, если они присутствуют в вашем JSON
}

struct EventListView: View {
    @State private var events: [Event] = []
    
    var body: some View {
        NavigationView {
            List(events) { event in
                EventRowView(event: event)
            }
            .navigationTitle("Мероприятия")
        }
        .onAppear {
            fetchData()
        }
    }
    
    func fetchData() {
        guard let url = URL(string: "http://localhost:8000/api/events") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let decodedEvents = try? JSONDecoder().decode([Event].self, from: data) {
                DispatchQueue.main.async {
                    self.events = decodedEvents
                }
            } else {
                print("Failed to decode JSON")
            }
        }.resume()
    }
}

struct EventRowView: View {
    let event: Event
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(event.title)
                .font(.headline)
            Text(event.date)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}

struct EventListView_Previews: PreviewProvider {
    static var previews: some View {
        EventListView()
    }
}
