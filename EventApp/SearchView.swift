import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            SearchBar(text: $searchText)
            Text("Search results for: \(searchText)")
                .padding()
        }
    }
    
    struct SearchBar: View {
        @Binding var text: String
        
        var body: some View {
            HStack {
                TextField("Search", text: $text)
                                .padding(7)
                                .padding(.leading, 25) // Увеличьте внутренний отступ слева
                                .background(Color(.systemGray6))
                                .cornerRadius(8)
                                .frame(width: 300)
                            
                            
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .padding(.leading, 8) // Сделайте отступ для иконки
                                .offset(x: -310)
                
                Button(action: {
                    self.text = ""
                }) {
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(.gray)
                        .padding(.trailing, 8)
//                        .offset(x: 5)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
