//
//  FFObjectWillChange.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/5.
//
//  如何使用ObjectWillChange手动发送状态更新
//  @虽然使用@published是控制状态更新最简单的方法，但如果需要某些特定的东西，也可以手动操作，例如，你可能希望仅当你对给定值感到满意才刷新视图。
//  所有可观察对象会自动访问ObjectWillChange属性时，该属性本身有一个send（）方法，可以在想要刷新观察视图时调用他。

import SwiftUI

class UserAuthentication: ObservableObject {
    var username = "meta BBLv" {
        willSet {
            objectWillChange.send()
        }
    }
}

struct FFObjectWillChange: View {
    @StateObject var user = UserAuthentication()
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Enter your name", text: $user.username)
            Text("Your username is: \(user.username)")
        }
    }
    //如何将willSet属性观察者附加到UserAuthencation的username属性上的，在该值发生变化时运行代码。在实例代码中，只要username发生变化时，就调用objectWillChange.send()，这将告诉objectWillChange发布者发布数据发生变化的消息。以便任何订阅的视图都可以刷新。
    //这个示例在属性上使用@Published没有什么不同，但是现在又了对objectWillChange.send()的自定义调用，可以添加额外的功能，例如，将值保存到磁盘上。
}

#Preview {
    FFObjectWillChange()
}
