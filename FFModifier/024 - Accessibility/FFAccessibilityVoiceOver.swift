//
//  FFAccessibilityVoiceOver.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/31.
//
//  如何让VoiceOver单独朗读字符
//  大多数的文本都可以作为单词阅读，但某些特殊文本（例如密码，股票代码和某些特定的数字）必须通过VoiceOver诸葛字母的阅读才能发挥作用。在SwiftUI中，可以使用speechSpellsOutCharacters()修饰符启用此功能。

import SwiftUI

struct FFAccessibilityVoiceOver: View {
    var body: some View {
        //当对整组元素启用辅助功能时，会有更好的结果
        VStack {
            Text("Your password is")
            Text("abCayer-muQai")
                .font(.title)
                .speechSpellsOutCharacters()
        }
        .accessibilityElement(children: .combine)
        //使用该代码，VoiceOver会自然的自动读出“你的密码是”，然后根据要求拼代码部分。
    }
}

#Preview {
    FFAccessibilityVoiceOver()
}
