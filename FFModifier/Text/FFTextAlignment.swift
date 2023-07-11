//
//  FFTextAlignment.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/10.
//

import SwiftUI

struct FFTextAlignment: View {
    //使用选择器并排比较所有三个文本的对其方式
    let alignments: [TextAlignment] = [.leading, .center, .trailing]
    @State private var alignment = TextAlignment.leading
    var body: some View {
        List {
            Section("Alignment") {
                //当swiftUI的Text视图跨多行换行时，他们默认与其左端对其，如果想要更改，请使用multilineTextAlignment()
                Text("蜀道之难，难于上青天！蚕丛及鱼凫，开国何茫然！尔来四万八千岁，不与秦塞通人烟。")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .frame(width: 300)
            }
            
            Section() {
                Picker("Text alignment", selection: $alignment) {
                    ForEach(alignments, id: \.self) { alignment in
                        Text(String(describing: alignment))
                    }
                }
                
                Text("蜀道之难，难于上青天！蚕丛及鱼凫，开国何茫然！尔来四万八千岁，不与秦塞通人烟。")
                    .font(.largeTitle)
                    .multilineTextAlignment(alignment)
                    .frame(width: 300)
            }
        }
    }
}

#Preview {
    FFTextAlignment()
}
