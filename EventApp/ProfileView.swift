import SwiftUI

struct ProfileView: View {
    let user: User
    
    var body: some View {
        VStack {
            Text("Profile")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .padding()
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 10) {
                ProfileInfoView(title: "Name", value: user.name)
                Divider() // Add a divider between sections
                ProfileInfoView(title: "Email", value: user.email)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1) // Add border around the VStack
            )
            
            Spacer()
        }
    }
}

struct ProfileInfoView: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
                .fontWeight(.medium)
                .foregroundColor(.gray)
            Spacer()
            Text(value)
        }
        .padding(.vertical, 5) // Add vertical padding to each ProfileInfoView
    }
}

struct User {
    let name: String
    let email: String
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(name: "John Doe", email: "john@example.com"))
    }
}
