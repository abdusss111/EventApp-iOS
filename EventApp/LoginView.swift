//import SwiftUI
//
//struct LoginView: View {
//    @State private var username = ""
//    @State private var password = ""
//    @State private var isAuthenticating = false
//    @State private var errorMessage = ""
//
//    var body: some View {
//        VStack {
//            Text("Login")
//                .font(.largeTitle)
//                .padding()
//
//            TextField("Username", text: $username)
//                .padding()
//                .background(Color(.systemGray6))
//                .cornerRadius(8)
//                .padding(.horizontal)
//
//            SecureField("Password", text: $password)
//                .padding()
//                .background(Color(.systemGray6))
//                .cornerRadius(8)
//                .padding(.horizontal)
//
//            if !errorMessage.isEmpty {
//                Text(errorMessage)
//                    .foregroundColor(.red)
//                    .padding()
//            }
//
//            Button(action: {
//                // Запускаем процесс аутентификации
//                login()
//            }) {
//                Text("Login")
//                    .padding()
//                    .foregroundColor(.white)
//                    .background(Color.blue)
//                    .cornerRadius(8)
//            }
//
//            Spacer()
//        }
//        .alert(isPresented: $isAuthenticating) {
//            Alert(title: Text("Authenticating"), message: Text("Please wait..."), dismissButton: .none)
//        }
//    }
//
//    private func login() {
//        AuthService.login(username: username, password: password) { result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let token):
//                    print("JWT token: \(token)")
//                    DispatchQueue.main.async {
//                                // Отобразить сообщение об успешной регистрации
//                                showAlert(message: "Вы успешно зарегистрированы!")
//                            }
//                case .failure(let error):
//                    errorMessage = error.localizedDescription
//                    DispatchQueue.main.async {
//                        
//                                // Отобразить сообщение об ошибке
//                                showAlert(message: "Ошибка регистрации: \(error.localizedDescription)")
//                            }
//                }
//                isAuthenticating = false
//            }
//        }
//    }
//    func showAlert(message: String) {
//        let alertController = UIAlertController(title: "Регистрация", message: message, preferredStyle: .alert)
//        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        UIApplication.shared.windows.first?.rootViewController?.present(alertController, animated: true, completion: nil)
//    }
//}
//
//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var isAuthenticating = false
    @State private var errorMessage = ""
    @State private var isLoggedIn = false

    var body: some View {
        VStack {
            if isLoggedIn {
                Text("Поздравляем! Теперь вы можете пользоваться всеми функциями данного приложения")
                    .padding()
                
                Button(action: {
                    logout()
                }) {
                    Text("Logout")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(8)
                }
            } else {
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
                case .success:
                    print("User logged in successfully")
                    isLoggedIn = true // Set isLoggedIn to true upon successful login
                case .failure(let error):
                    print("Failed to log in:", error)
                    errorMessage = error.localizedDescription
                }
                isAuthenticating = false
            }
        }
    }
    
    private func logout() {
        // Implement your logout logic here
        isLoggedIn = false
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
