//
//  FFAccessibilityVoiceControl.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/31.
//
//  如何添加语音控制的自定义激活命令
//  SwiftUI的accessibilityInputLabels()修饰符可以提供一系列的字符串，当用户在其他设备上激活语音控制或完整键盘访问时，系统应监听这些字符串。accessibilityLabel()与accessibilityHint()不同。

import SwiftUI

struct FFAccessibilityVoiceControl: View {
    var body: some View {
        NavigationStack {
            Text("Your Content Here")
                .toolbar {
                    Button {
                        // remove this user
                    } label: {
                        Label("Remove User", systemImage: "trash")
                    }
                    .accessibilityHint("Removes this user form your account")
                    .accessibilityInputLabels(["Remove User", "Remove", "Delete User", "Delete"])
                }
        }
    }
}

#Preview {
    FFAccessibilityVoiceControl()
}
