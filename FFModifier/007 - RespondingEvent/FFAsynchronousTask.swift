//
//  FFAsynchronousTask.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/31.
//
//  如何在显示视图时运行异步任务
//  SwiftUI的task()修饰符是onAppear()的一个更强大的版本，它可以让我们在显示视图时立即启动一步任务。更好的是，当视图呗销毁时，如果任务没有完成，任务将自动取消。由于任务是异步执行的，淫才这是为视图获取一些初始网络数据的好地方。例如，如果我们想从服务器获取消息列表，将其解码为message结构数组，让后将其显示在列表中。

import SwiftUI

struct Message: Decodable, Identifiable {
    let id: Int
    let from: String
    let text: String
}

struct FFAsynchronousTask: View {
    @State private var messages = [Message]()
    let sites = ["Apple.com", "Swift.org", "HackingWithSwift.com"]
    
    var body: some View {
        NavigationStack {
            List(messages) { message in
                VStack(alignment:.leading) {
                    Text(message.from)
                        .font(.headline)
                    Text(message.text)
                }
            }
            .navigationTitle("Inbox")
        }
        .task {
            do {
                let url = URL(string: "https://www.hackingwithswift.com/samples/messages.json")!
                let (data, _) = try await URLSession.shared.data(from: url)
                messages = try JSONDecoder().decode([Message].self, from: data)
            } catch {
                messages = []
            }
        }
        
        //task()修饰符可以附加到层次结构中的任何视图，甚至是作为导航推送的结果呈现的视图--它只会在显示视图才真正的开始工作。
        
        //创建一个简单的网站源代码查看器，用户可以选择查看网站：
        NavigationStack {
            List(sites, id: \.self) { site in
                NavigationLink(site) {
                    SourceViewer(site: site)
                }
            }
            .navigationTitle("View Source")
        }
    }
}

struct SourceViewer: View {
    let site: String
    @State private var sourceCode = "Loading...."
    
    var body: some View {
        ScrollView {
            Text(sourceCode)
                .font(.system(.body, design: .monospaced))
        }
        .task {
            guard let url = URL(string: "https://\(site)") else {
                return
            }
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                sourceCode = String(decoding: data, as: UTF8.self).trimmingCharacters(in: .whitespacesAndNewlines)
            } catch {
                sourceCode = "Faild to fetch site"
            }
        }
    }
}

#Preview {
    FFAsynchronousTask()
}
