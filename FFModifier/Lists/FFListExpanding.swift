//
//  FFListExpanding.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/7.
//
//  如何创建可折叠的列表
//  SwiftUI的List视图有一个增强初始化器，可以创建带有子节点的扩展--以可以点击的箭头的方式呈现，当点击时，箭头转动，显示子节点。
//  要使用这种形式的List，你需要以精确的形式拥有数据，你的数据模型应该鱼油相同类型的可选子节点，这样可以创建树。通常情况下，你可能会从JSON或类似的地方加载这类数据。
//一旦数据就绪，就可以通过传入数据数组和子节点。

import SwiftUI

struct Bookmark: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    let items: [Bookmark]?
    
    static let apple = Bookmark(name: "Apple", icon: "1.circle", items: nil)
    static let bbc = Bookmark(name: "BBC", icon: "square.and.pencil", items: nil)
    static let swift = Bookmark(name: "Swift", icon: "bolt.fill", items: nil)
    static let twitter = Bookmark(name: "Twitter", icon: "mic", items: nil)
    
    static let example1 = Bookmark(name: "Favorites", icon: "star", items: [Bookmark.swift, Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
    static let example2 = Bookmark(name: "Recent", icon: "timer", items: [Bookmark.apple, Bookmark.bbc, Bookmark.twitter])
    static let example3 = Bookmark(name: "Recommended", icon: "hand.thumbsup", items: [Bookmark.apple, Bookmark.swift, Bookmark.bbc,  Bookmark.twitter])
}

struct FFListExpanding: View {
    let items: [Bookmark] = [.example1, .example2, .example3]
    var body: some View {
        List(items, children: \.items) { row in
            HStack {
                Image(systemName: row.icon)
                Text(row.name)
            }
        }
        
    }
}

#Preview {
    FFListExpanding()
}
