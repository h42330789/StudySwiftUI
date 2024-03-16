//
//  StudyState.swift
//  StudySwiftUI
//
//  Created by MacBook Pro on 3/17/24.
//

import SwiftUI
struct User1 {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}
struct StudyState1: View {
    @State private var user = User1()

    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")

            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
    }
}
class User2: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

#Preview {
    VStack(spacing: 10) {
        StudyState1()
    }
}
