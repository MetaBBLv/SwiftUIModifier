//
//  FFStateObjectMonitorExternal.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/5.
//
//  如何使用@StateObject来创建和监控外部对象。
//  SwiftUI的@StateObject属性包装器是@observedObject的一种特殊形式，具有相同的功能，但有一个重要的补充，他应该犹豫创建被观察对象，而不仅仅是存储外部传递的对象。
//  当用@StateObject给视图添加属性时，SwiftUI会认为这个视图是这个可观察对象的持有者，所有其他你传递对象的视图都应该使用@observedObject。
//  所以，如果在某个地方使用@StateObject创建了可观察对象，在你传递该对象的所有后续地方，都必须使用@ObservedObject。

import SwiftUI

class Player: ObservableObject {
    @Published var name = "meta BBlv"
    @Published var age = 29
}

struct FFStateObjectMonitorExternal: View {
    @StateObject var player = Player()
    
    var body: some View {
        NavigationStack {
            NavigationLink {
                PlayerNameView(player: player)
            } label: {
                Text("Show Detail View")
            }
        }
    }
    //如果很难记住区别，每当在属性包装器中看到State，比如@State、@StateObject、@GestureState等，就意味着当前视图是这个数据的拥有者。
}

struct PlayerNameView: View {
    @ObservedObject var player: Player
    
    var body: some View {
        Text("Hello, \(player.name)")
    }
}

#Preview {
    FFStateObjectMonitorExternal()
}
