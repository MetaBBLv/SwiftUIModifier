//
//  FFObservedObjectManageState.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/5.
//
//  如何使用@ObservedObject从外部对象管理状态
//  当使用观察对象时，需要处理三件关键事情：ObservableObject协议与一些可以存储数据的累一起使用。@ObservedObject属性包装器在视图中用于存储可观察对象实例，@Published属性包装器被添加到观察对象中的任何属性，当视图发生变化时，这些属性会导致视图刷新。
//  对于从其他地方传入的视图，只使用@ObservedObject时非常重要的，你不应该使用这个属性包装器来创建一个可观察对象的初始实例--这就是@StateObject的作用。

import SwiftUI

class UserProgress: ObservableObject {
    @Published var score = 0
}

struct InnerView: View {
    @ObservedObject var progress: UserProgress
    var body: some View {
        Button("Increase Score") {
            progress.score += 1
        }
    }
}

struct FFObservedObjectManageState: View {
    @StateObject var progress = UserProgress()
    
    var body: some View {
        //ObservableObject的一致性允许在视图中使用这个累的实例，这样当发生变化时，视图就会重新加载。
        //@Published属性包装器告诉SwiftUI，对score的更改应触发视图重载。
        VStack {
            Text("Your score is \(progress.score)")
            InnerView(progress: progress)
        }
        //除了在progress中使用@ObservedObject属性包装器之外，其他的一切看起来都差不多--SwiftUI为我们处理了所有的细节。
        //但是，有一个重要的区别，progress没有声明为私有，这是因为绑定对象可以被多个视图使用，因此公开共享它时很常见的。
        //请不要使用@ObservedObject来创建对象的实例，如果想要创建实例，使用@StateObject。
    }
}

#Preview {
    FFObservedObjectManageState()
}
