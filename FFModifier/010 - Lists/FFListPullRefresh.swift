//
//  FFListPullRefresh.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/8.
//
//  如何启用下拉刷新
//  SwiftUIderefreshable()修饰符可以附加到list上，当发生拖拽且有一段距离时触发。只要的你的代码完成运行，iOS会自动显示一个菊花。

import SwiftUI

struct NewsItem: Decodable, Identifiable {
    let id: Int
    let title: String
    let strap: String
}

struct FFListPullRefresh: View {
    @State private var news = [
        NewsItem(id: 0, title: "Want the latest news?", strap: "Pull to refresh!")
    ]
    
    var body: some View {
        NavigationStack {
            List(news) { item in
                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.headline)
                    Text(item.strap)
                        .foregroundStyle(.secondary)
                }
            }
            .refreshable {
                do {
                    let url = URL(string: "https://www.hackingwithswift.com/samples/news-1.json")!
                    let (data, _) = try await URLSession.shared.data(from: url)
                    news = try JSONDecoder().decode([NewsItem].self, from: data)
                } catch {
                    news = []
                }
            }
        }
    }
}

#Preview {
    FFListPullRefresh()
}
