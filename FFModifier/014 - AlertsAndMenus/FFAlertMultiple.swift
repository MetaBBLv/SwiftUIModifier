//
//  FFAlertMultiple.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/16.
//
//  如何在一个视图中显示多个alert
//
//  SwiftUI使得显示单个alert相对容易，但是如果试图从一个视图中显示两个或更多的alert，就变得很困难，会出现一个alert好用，另外一个不好用。
//  要解决这个问题，你需要确保为每个视图附加不超过一个alert修饰符。这听起来可能有一些限制，但请记住，你不需要将alert附加到同一个视图，你可以将他们附加到任何地方。事实上，你可能会发现将他们直接附加到显示他们的东西上最适合你。
//  例如，我们可以编写一些代码来定义两个@State属性，每个属性控制显示的alert，不是将两个alert修饰符附加到同一个VStack上，而是将他们分别附加到负责显示该alert的按钮上。

import SwiftUI

struct FFAlertMultiple: View {
    @State private var showingAlert1 = false
    @State private var showingAlert2 = false
    
    var body: some View {
        VStack {
            Button("Show 1") {
                showingAlert1 = true
            }
            .alert(isPresented: $showingAlert1) {
                Alert(title: Text("One"), message: nil, dismissButton: .cancel())
            }
            
            Button("Show 2") {
                showingAlert2 = true
            }
            .alert(isPresented: $showingAlert2, content: {
                Alert(title: Text("Two"), message: nil, dismissButton: .cancel())
            })
        }
        //如果你尝试将alert()修饰符都移动到VStack中，你就会发现只有一个有效。
    }
}

#Preview {
    FFAlertMultiple()
}
