//
//  FFTextPrivasySensitive.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/10.
//
// SwiftUI 允许我们将视图的某些部分标记为包含敏感信息，这实际上是我们可以使用密文更轻松的隐藏或显示它。要在代码中使用此功能，请首先将privacySensitive()修饰符添加到想要隐藏的任何视图，然后将.redacted(reason: .privacy)修饰符应用到视图层次中更高的位置

import SwiftUI

struct FFTextPrivasySensitive: View {
    @Environment(\.redactionReasons) var redactionReasons
    var body: some View {
        
        List {
            Section {
                //如果视图在非私有上下文中显示，则会隐藏用户的信用卡号
                Text("Card number")
                    .font(.headline)
                Text("1234 5678 9012 3456")
                    .privacySensitive()
            }
            
            Section {
                //默认情况下，因此敏感上下文被灰色框屏蔽，但你也可以通过从环境中读取密文来提供自定义布局
                Text("Card number")
                    .font(.headline)
                
                if redactionReasons.contains(.privacy) {
                    Text("[Hidden]")
                } else {
                    Text("1234 5678 9012 3456")
                }
                
            }
        }
    }
}

#Preview {
    FFTextPrivasySensitive()
}
