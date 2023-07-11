//
//  FFTextMarkdown.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/10.
//
// SwiftUI 内置了对Markdown渲染的支持，包括粗体、斜体、链接等。它实际上内置SwiftUI的Text视图中

import SwiftUI

struct FFTextMarkdown: View {
    var body: some View {
        
        List {
            Section {
                Text("This is regular text.")
                Text("* This is **bold** text,this is *italic* text, and this is ***bold, italic*** text.")
                Text("~~A strikethrough example~~")
                Text("`Monospaced works too`")
                Text("Visit Apple: [click here](https://apple.com)")
            }
            
            Section {
                //该链接是可以点击的，默认情况下，Markdown链接将使用应用程序的强调色，但你可以使用tint()主题修饰符来更改它
                Text("Visit Apple: [Click here](https://Apple.com)")
                    .tint(.indigo)
                
                //发生这种自动Markdown转换是因为SwiftUI将这些字符串解释为LocallizedStringKey可以由我们的应用陈旭本地化的字符串实例。这意味着如果你想从属性或者变量创建Markdown文本，你应该将其显示标记为LocallizedStringKey来获取Markdown的渲染
                let markdownText: LocalizedStringKey = "* This is **bold** text,this is *italic* text, and this is ***bold, italic*** text."
                Text(markdownText)
            }
            
            Section {
                // 如果你希望原始的文本保持不变，只需要删除类型LocallizedStringKey。或者，你也可以使用初始化程序完全禁止Markdown和本地化Text(verbatim:)
                let markdownText1 = "* This is **bold** text,this is *italic* text, and this is ***bold, italic*** text."
                Text(markdownText1)
                
                let markdownText2 = "* This is **bold** text,this is *italic* text, and this is ***bold, italic*** text."
                Text(verbatim: markdownText2)
            }
        }
    }
}

#Preview {
    FFTextMarkdown()
}
