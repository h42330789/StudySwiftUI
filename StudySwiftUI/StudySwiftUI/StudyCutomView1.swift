//
//  StudyCutomView1.swift
//  StudySwiftUI
//
//  Created by MacBook Pro on 3/17/24.
//

import SwiftUI
// MARK: - 自定义View进行组合
struct CapsuleText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(Capsule())
    }
}
struct CapsuleText2: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(Color.blue)
            .clipShape(Capsule())
    }
}
// MARK: - 使用Modifier进行组合
struct MyCapsule: ViewModifier {
    var foregroundColor: Color
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .padding()
            .foregroundColor(foregroundColor)
            .background(Color.blue)
            .clipShape(Capsule())
    }
}

extension View {
    func myCapsuleStyle(_ foregroundColor: Color = .white) -> some View {
        self.modifier(MyCapsule(foregroundColor: foregroundColor))
    }
}


#Preview {
    VStack(spacing: 10) {
        // 使用moidifer的调用的调用demo
        Text("First1").myCapsuleStyle()
        Text("Second1").myCapsuleStyle()
        Text("Third1").myCapsuleStyle(.red)
        Text("Fouth1").myCapsuleStyle(.green)
        // 使用自定义View的demo
        CapsuleText(text: "First2")
        CapsuleText(text: "Second2")
        CapsuleText2(text: "Third2")
                .foregroundColor(.white)
            CapsuleText2(text: "Fouth2")
                .foregroundColor(.yellow)
    }
    
}
