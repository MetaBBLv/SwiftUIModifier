//
//  FFNavigationCodable.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/15.
//
//  如何使用Codable协议保存和加载NavigationStach Paths
//  当使用NavigationPath对象管理SwiftUI的NavigationStack路径时，使用Codable协议保存和加载整个路径--可以存储完整的NavigationStack并在需要的时间恢复它，这样用户就能准确的回到离开的地方。
//  最好的处理方法时将存储封装在一个单独的ObservableObject类中，这个类可以负责从视图中加载和保存路径数据。例如，这个类在创建时加载一个保存的路径，并在他的NavigationPath属性改变时保存路径

import SwiftUI

class PathStore: ObservableObject {
    @Published var path = NavigationPath() {
        didSet {
            save()
        }
    }
    
    private let savePath = URL.documentsDirectory.appending(path: "SavedPathStore")
    
    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                path = NavigationPath(decoded)
            }
        }
    }
    
    func save() {
        guard let representation = path.codable else { return }
        
        do {
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
    //这是一个整洁的可重用类，可以立即投入使用一只要写入NavigationPath的数据的Codable类型，他就可以工作。
}

//创建一个简单的Detail视图，能够显示用户选择的数字，同时允许它们通过选择另一个数字进行更深的导航，然后将其与PathStore类一起使用，以便自动加载和保存导航
struct DetailViewCodable_013: View {
    var id: Int
    
    var body: some View {
        VStack {
            Text("View \(id)")
                .font(.largeTitle)
            NavigationLink("Junp to random", value: Int.random(in: 1...100))
        }
    }
}

struct FFNavigationCodable: View {
    @StateObject private var pathStore = PathStore()
    
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            DetailViewCodable_013(id: 0)
                .navigationDestination(for: Int.self, destination: DetailViewCodable_013.init)
                .navigationTitle("Navigation")
        }
    }
    //如果你运行哪个代码，你会看到你可以浏览任意多的DetailView级别，你的数据会自动被存储--你可以推出引用程序并返回，你的导航历史将保持完整。
}

#Preview {
    FFNavigationCodable()
}
