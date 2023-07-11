//
//  FFCustomizeLines.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/10.
//
//  当你的用户点击了SwiftUIText或Link视图中显示的URL时，默认情况下它将在Safari中打开。但是，你可以通过openURL环境密钥来自定义此行为-你可能希望自己处理链接，或者可能在自定义操作完成后将其传递回系统再打开

import SwiftUI

struct FFCustomizeLines: View {
    var body: some View {
        
        List {
            Section {
                //此代码调整Link和Text视图，以便将所有URL发送到handleURL()要执行操作的方法
                Link("Visit Apple", destination: URL(string: "https://apple.com")!)
                Text("[Visit Apple](https://apple.com)")
            }
            .environment(\.openURL, OpenURLAction(handler: handleURL))
            
            //如上所示，handleURL()返回OpenURLAction.Result的值.handle,这意味着该方法接受了链接并对其进行了操作。当然还有其他枚举值可以操作:
            // .discarded：表示无法处理该链接
            // .systemAction如果你想触发默认行为（除了你自己的逻辑之外）
            // .systemAction(someOtherURL)如果你想使用默认行为打开不同的URL（可能是最初护发的URL的修改版本）
            
            Section {
                //默认情况下链接将使用应用程序的强调色，但是可以使用主题修饰符修改tint()
                Text("[Visit Apple](https://apple.com)")
                    .tint(.indigo)
            }
        }
    }
    
    func handleURL(_ url: URL) -> OpenURLAction.Result {
        print("Handle \(url) somehow")
        return .handled
    }
}

#Preview {
    FFCustomizeLines()
}
