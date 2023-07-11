//
//  FFTextPlaceholder.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/10.
//
// SwiftUI 允许我们将温标标记为视图中的占位符，这就意味着它会被渲染，但会被灰色遮盖以表明它不是最终的内容。这是通过redacted(reason:)修改器提供的，以及unredacted()可根据需要用于覆盖密文的修改器

import SwiftUI

struct FFTextPlaceholder: View {
    @Environment(\.redactionReasons) var redactionReasons
    
    let bio = "The rain in Span falls mainly on the Spaniards"
    
    var body: some View {
        
        List {
            Section {
                Text("This is Placehoder text")
                    .font(.title)
                    .redacted(reason: .placeholder)
            }
            
            //并且可以一次编辑视图中的多个内容
            Section {
                Text("This is Placehoder text")
                Text("And so is thid")
            }
            .font(.title)
            .redacted(reason: .placeholder)
            
            //苹果表示，这是一个附加的过程，这意味着如果你向父集和子集添加编辑原因，那么他们就会合并。现在只有.placeholder,但也许我们将来会看到像素化火类似的，你还可以查询从环境软儒的任何编辑原因
            Section {
                
                if redactionReasons == .placeholder {
                    Text("Loading...")
                } else {
                    Text(bio)
                        .redacted(reason: redactionReasons)
                }

            }
        }
    }
}

#Preview {
    FFTextPlaceholder()
}
