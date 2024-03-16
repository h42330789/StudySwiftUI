//
//  StudyBinding.swift
//  StudySwiftUI
//
//  Created by MacBook Pro on 3/17/24.
//

import SwiftUI

struct ContentView1: View {
    @State var selection = 0

    var body: some View {
        return VStack {
            Picker("Select a number", selection: $selection) {
                ForEach(0 ..< 3) {
                    Text("Item \($0)")
                }
            }.pickerStyle(SegmentedPickerStyle())
            Text("selected: \(selection)")
        }
    }
}
struct ContentView2: View {
    @State var selection = 0

    var body: some View {
        let binding = Binding(
            get: { self.selection },
            set: { self.selection = $0 }
        )

        return VStack {
            Picker("Select a number", selection: binding) {
                ForEach(0 ..< 3) {
                    Text("Item \($0)")
                }
            }.pickerStyle(SegmentedPickerStyle())
            Text("selected: \(selection)")
        }
    }
}

struct ContentView3: View {
    @State var agreedToTerms = false
    @State var agreedToPrivacyPolicy = false
    @State var agreedToEmails = false

    var body: some View {
        let agreedToAll = Binding<Bool>(
            get: {
                self.agreedToTerms && self.agreedToPrivacyPolicy && self.agreedToEmails
            },
            set: {
                self.agreedToTerms = $0
                self.agreedToPrivacyPolicy = $0
                self.agreedToEmails = $0
            }
        )

        return VStack {
            Toggle(isOn: $agreedToTerms) {
                Text("Agree to terms")
            }

            Toggle(isOn: $agreedToPrivacyPolicy) {
                Text("Agree to privacy policy")
            }

            Toggle(isOn: $agreedToEmails) {
                Text("Agree to receive shipping emails")
            }

            Toggle(isOn: agreedToAll) {
                Text("Agree to all")
            }
            Text("terms: \(agreedToTerms ? "true" : "false")")
            Text("policy: \(agreedToPrivacyPolicy ? "true" : "false")")
            Text("emails: \(agreedToEmails ? "true" : "false")")
            Text("all: \(agreedToAll.wrappedValue ? "true" : "false")")
        }
    }
}


#Preview {
    VStack(spacing: 10) {
        ContentView1()
        ContentView2()
        ContentView3()
    }
}
