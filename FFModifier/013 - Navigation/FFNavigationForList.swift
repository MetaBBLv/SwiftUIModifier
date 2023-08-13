//
//  FFNavigationForList.swift
//  FFModifier
//
//  Created by 小B同学 on 2023/8/13.
//
//  如何在点击列表行是push新的视图
//  SwiftUI的NavigationLink可在List-cell中使用，以便在点击cell是显示新的视图。如果NavigationLink环绕整个行，系统会自动理解为整个行可点击，以显示新视图。
//  有两种方法可以指定导航目的地，通过明确你的链接提供，或者如果你的目标是iOS16以及更高版本，可以使用navigationDestination()
//  重要信息--如果不需要高度自定义的导航，并且你可以在iOS16以及更高的版本运行，强烈建议使用navigationDestination()，因为他们允许SwiftUI懒加载你的目标视图

import SwiftUI

struct PlayerView_013: View {
    let name: String
    
    var body: some View {
        Text("Select player: \(name)")
            .font(.largeTitle)
    }
}

struct FFNavigationForList: View {
    let players = [
        "Roy Kent",
        "Richard Montlaur",
        "Dani Rojas",
        "Jamie Tartt"
    ]
    var body: some View {
        //创建一个包含List的NavigationStack，允许用户选择播放器
        NavigationStack {
            List(players, id: \.self) { player in
                NavigationLink(player, value: player)
            }
            .navigationDestination(for: String.self, destination: PlayerView_013.init)
            .navigationTitle("Select a Player")
            Divider()
            //可以通过附加navigationDestination()来监视多种不同的数据类型
            List {
                NavigationLink("Show an integer", value: 29)
                NavigationLink("show a String", value: "Meta BBLv")
                NavigationLink("Show a Double", value: Double.pi)
            }
            .navigationDestination(for: Int.self) { Text("Received Int: \($0)") }
            .navigationDestination(for: String.self) { Text("Received String \($0)") }
            .navigationDestination(for: Double.self) { Text("Receicved Double \($0)") }
        }
        
    }
}

#Preview {
    FFNavigationForList()
}
