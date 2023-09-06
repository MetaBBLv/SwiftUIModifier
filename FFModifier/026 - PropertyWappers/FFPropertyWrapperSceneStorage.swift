//
//  FFPropertyWrapperSceneStorage.swift
//  FFModifier
//
//  Created by BBLv on 2023/9/6.
//
//  什么是@SceneStorage
//如果香味每个屏幕保存独特的数据，应该使用SwiftUI的@SceneStorage属性包装器。这与@AppStorage有些相似，需要为它提供一个名称来保存数据以及一个默认值，但与使用UserDefaults不同，它用于状态恢复，而且它甚至在iPadOS中经常看到的复杂多场景设置中非常好用。

import SwiftUI

//如果有一个文本编辑器，并希望存储用户正在输入的内容
struct FFPropertyWrapperSceneStorage: View {
    @SceneStorage("text") var text = ""
    var body: some View {
        NavigationStack {
            TextEditor(text: $text)
        }
    }
    //因为使用了@SceneStorage，SwiftUI将自动确保每个场景实例都有其自己的文本，如果同时运行多个应用程序，都可以正确保存和恢复其数据。
    //现在，在使用@SceneStorage之前，有一些来自Apple的重要警告：
    //- 不要保存大量数据：只保存状态恢复的所需内容
    //- 用用不要将敏感数据存储在场景存储中，因为是不安全的。
    //- 如果用户赚到应用程序切换器并销毁应用程序，场景存储也将被销毁（iOS17上发现未销毁。）
}

#Preview {
    FFPropertyWrapperSceneStorage()
}
