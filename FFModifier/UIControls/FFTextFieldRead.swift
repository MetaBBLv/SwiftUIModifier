//
//  FFTextFieldRead.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/24.
//
//  如何读取TextField的text
//  SwiftUI的TextField与UIKit中的UITextField类似，尽管默认情况下看起来有些不同，并且非常依赖状态绑定
//  要创建一个TextField，传入一个文本字段内使用占位符，以及它应绑定的状态值。

import SwiftUI

struct FFTextFieldRead: View {
    @State private var name:String = "Tim"
    var body: some View {
        List {
            //例如，创建一个TextField到本地字符串绑定，然后下方创建一个Text。
            VStack(alignment: .leading, content: {
                TextField("输入你的名字", text: $name)
                Text("Hello, \(name)!")
            })
            //运行后，结果时TextField中输入什么，直接在下方的Text中显示了。
            //使用文本字段时有两个重要限制条件。首先，默认情况下它们没有边框，因此你可能看不到任何内容，你需要在其内部大致位置点击才能激活键盘。
        }
    }
}

#Preview {
    FFTextFieldRead()
}
