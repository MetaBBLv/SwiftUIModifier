//
//  FFViewThatFIts.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/17.
//
//  如何使用ViewThatFits创建自适应布局
//  SwiftUI使ViewThatFits可以根据可用屏幕空间的大小从几种可能的布局中选择一种。这时期成为确保你的app从最大的tvOS到最小的watchOS所有的屏幕都可以以最佳的方式显示

import SwiftUI

// 创建一个具有四个不同按钮的button，然后可以根据空间大小决定水平还是垂直排列它们，这是非常有效的自定义布局的一种方式。
struct OptionsView: View {
    var body: some View {
        Button("Log in") { }
            .buttonStyle(.borderedProminent)
        Button("Create Account") { }
            .buttonStyle(.bordered)
        Button("Settings") { }
            .buttonStyle(.bordered)
        Spacer().frame(width: 50, height: 50)
        
        Button("Need Help?") {}
    }
}

struct FFViewThatFIts: View {
    
    let terms = String(repeating: "abcde", count: 100)
    
    var body: some View {
        List {
            Section {
                //感觉屏幕找到最适合的Label并显示
                //选择顺序为：大文本长标题，大文本短标题，小文本短标题
                ViewThatFits {
                    Label("Wecome to AwsoemApp", systemImage: "bolt.shield")
                        .font(.largeTitle)
                    Label("Wecome", systemImage: "bolt.shield")
                        .font(.largeTitle)
                    Label("Wecome", systemImage: "bolt.shield")
                }
            }
            
            Section {
                ViewThatFits {
                    HStack {
                        OptionsView()
                    }
                    VStack {
                        OptionsView()
                    }
                }
            }
            
            Section {
                //ViewThatFits处理文本布局的方式：在SwiftUI中，文本更喜欢放在一行上，默认情况下ViewTahtFits更喜欢避免布局导致文本换行。因此，当空间有限时，像这样的代码会默认为VStack，而不是使用带有换行文本的HStack
                ViewThatFits {
                    HStack {
                        Text("The rain")
                        Text("in Spain")
                        Text("falls mainly")
                        Text("on the Spaniards")
                    }
                    
                    VStack {
                        Text("The rain")
                        Text("in Spain")
                        Text("falls mainly")
                        Text("on the Spaniards")
                    }
                }
                .font(.title)
                //这里发生的事ViewThatFits正在水平和垂直测量我们的文本，并视图找到适合这两个维度的文本的情况--文本适合一行的情况，而不被截断垂直。这有时会导致问题，但幸运的事，我可以告诉ViewThatFits只关心一个维度，这样就可以获得更多的控制。
            }
            
            //假设你想要像用户显示一些条款和条件，如果可以在有限的空间内展示，那么将其作为固定文本，否者将其显示为滚动文本
            //下面着两个例子不应该放在List中，产生了干扰，永远都是全部文本展示，不会cell内滚动，可以将其逐一放在body中查看结果
            Section {
                ViewThatFits() {
                    Text(terms)
                    ScrollView {
                        Text(terms)
                    }
                }
            }
            
            // 除非有一个巨大的屏幕，否则将始终选择滚动版本，因为我们要求ViewThatFits关心文本的水平轴和垂直轴，这意味着一旦文本超过一行就是这个结果。SwiftUI更倾向于这种布局，为了解决这个问题，我们需要限制ViewThatFits为仅测量垂直轴（.vertical）
            Section {
                ViewThatFits(in: .vertical) {
                    Text(terms)
                    ScrollView {
                        Text(terms)
                    }
                }
            }
        }
    }
}

#Preview {
    FFViewThatFIts()
}
