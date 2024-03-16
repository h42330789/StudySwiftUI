//
//  StudyList.swift
//  StudySwiftUI
//
//  Created by MacBook Pro on 3/17/24.
//

import SwiftUI

struct StudyList: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    VStack(spacing: 10) {
        // 固定数据
        List {
            Text("Hello World")
            Text("Hello World")
            Text("Hello World")
        }
        // 使用foreach
        List {
            ForEach(0..<5) {
                Text("Dynamic row \($0)")
            }
        }
        // 使用foreach
        List(0..<5) {
            Text("Dynamic row \($0)")
        }
        List(["Finn", "Leia", "Luke", "Rey"], id: \.self) {
                    Text($0)
        }
        // 多种类型嵌套
        List {
            Text("Static row 1")
            Text("Static row 2")

            ForEach(0..<5) {
                Text("Dynamic row \($0)")
            }

            Text("Static row 3")
            Text("Static row 4")
        }
        // 配合section
        List {
            Section(header: Text("Section 1")) {
                Text("Static row 1")
                Text("Static row 2")
            }

            Section(header: Text("Section 2")) {
                ForEach(0..<5) {
                    Text("Dynamic row \($0)")
                }
            }

            Section(header: Text("Section 3")) {
                Text("Static row 3")
                Text("Static row 4")
            }
        }

    }
}
