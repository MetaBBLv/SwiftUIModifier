//
//  FFEnvironmentShare.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/5.
//
//  如何使用@EnvironmentObject来共享视图之间的数据
//  对于应该与应用程序中的许多视图共享数据，SwiftUI提供了@EnvironmentObject属性包装器，这可以在任何需要的地方共享模型数据，同时还确保当数据发生变化时，视图自动保持更新。
//  把@EnvironmentObject看作是在许多视图上使用@ObservedObject的一种更智能更简单的方式。与其他在视图A中创建数据，然后将其传递给视图B，然后传递给视图C，再传递给视图D，不如在视图A中穿件它并将其放入环境中，以便视图B、C和D将自动访问它。
//  就像@ObservedObject一样，你永远不会给@EnvironmentObject属性赋值。相反，它应该在其他地方传入，最终可能虚妄在某处使用@StateObject来创建它。

//  然而，与@ObservedObject不同，不需要手动将对象传递给其他视图，相反，使用send数据到一个叫environmentObject（）修饰符中，这使得该对象在SwiftUI的环境中对该视图以及其内部的任何其他视图可用。
//  环境对象必须有根视图提供，如果SwiftUI找不到正确类型的环境对象，就会crash。
//对于环境对象，定义三样东西：
//一个gameessettings类，包含一个名为score的发布属性
//一个ScoreView视图，期望在环境中接受一个gameessettings对象，并显示它的score属性。
//一个ContentView视图，创建一个gameessetting对象，有一饿按钮，添加到他的score属性，和一个NavigationLink来跳转Detail视图

import SwiftUI

class GameSettings: ObservableObject {
    @Published var score = 0
}

struct ScoreView: View {
    @EnvironmentObject var settings: GameSettings
    
    var body: some View {
        Text("Score: \(settings.score)")
    }
}

struct FFEnvironmentShare: View {
    @StateObject var settings = GameSettings()
    
    var body: some View {
        NavigationStack {
            VStack {
                Button("Increase Score") {
                    settings.score += 1
                }
                
                NavigationLink {
                    ScoreView()
                } label: {
                    Text("Show Detail View")
                }
            }
            .frame(height: 200)
        }
        .environmentObject(settings)
    }
    //这段代码中有一些重要的内容：
    //就像#StateObject与@ObservedObject一样，与@EnvironmentObject一起使用的所有类都必须遵守ObservableObject协议。
    //将GameesSettings放入导航Stack环境中，这意味着navigationStack中所有的视图都可以读取该对象，以及navigationStack显示的任何视图。
    //当使用@EnvironmentObject属性包装器是，声明了期望接受的对象类型，而不是创建它--毕竟，期望在环境中获取它。
    //因为Detail视图显示在NavigationStack中，它将访问相同的环境，这反过来意味着它可以读取创建的gamesSetting对象。
    //不需要显示的将环境中的gamesettings实例与scoreView的settings属性关联起来--SwiftUI会自动计算它在环境中有一个gamesSetting实例，所以那就是它使用的。
    //既然视图依赖于当前的环境对象，那么更新与来代码以提供一些示例设置是很重要的。例如，使用ScoreView().environmentObject(gamesetting())之类的预览应该可以做到这一点。
    //如果需要向环境中添加多个对象，则应该添加多个environmentObject（）修饰符--只需一个接一个调用。
}

#Preview {
    FFEnvironmentShare()
}
