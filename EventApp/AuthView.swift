import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var isAuthenticating = false
    @State private var errorMessage = ""

    var body: some View {
        VStack {
            Text("Login")
                .font(.largeTitle)
                .padding()

            TextField("Username", text: $username)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)

            SecureField("Password", text: $password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)

            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }

            Button(action: {
                // Запускаем процесс аутентификации
                login()
            }) {
                Text("Login")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
            }

            Spacer()
        }
        .alert(isPresented: $isAuthenticating) {
            Alert(title: Text("Authenticating"), message: Text("Please wait..."), dismissButton: .none)
        }
    }

    private func login() {
        AuthService.login(username: username, password: password) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let token):
                    print("JWT token: \(token)")
                    // Теперь вы можете использовать этот токен для доступа к защищенным эндпоинтам
                case .failure(let error):
                    errorMessage = error.localizedDescription
                }
                isAuthenticating = false
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
