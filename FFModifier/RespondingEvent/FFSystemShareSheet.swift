//
//  FFSystemShareSheet.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/31.
//
//  如何让用户使用系统共享表共享内容
//  SwiftUI的ShareLink视图可以很容易的从你的app共享任何类型的数据，只要它符合Transferable协议
//

import SwiftUI

struct FFSystemShareSheet: View {
    let link = URL(string: "https://www.hackingwithswift.com")!
    let link1 = URL(string: "https://www.admin.ch")!
    
    var body: some View {
        
        List {
            Section {
                // 默认情况下，你会得到一个简单的带有响应图标的“分享”标签，但你可以提供你自己的标题文本，或者一个完全自定义的标签。
                VStack(spacing: 20, content: {
                    ShareLink(item: link)
                    ShareLink("Learn Swift here", item: link)
                    ShareLink(item: link) {
                        Label("Learn Swift here", image: "swift")
                    }
                })
            }
            
            Section {
                //如果你想在你分享的内容中附加一些额外的文本，通过message参数
                ShareLink(item: link, message: Text("Learn Swift here!"))
            }
            
            Section {
                //对于一些简单Url，系统能够替我们生成预览，但你也可以提供一些文本和你选择的图像自定义预览
                ShareLink(
                    item: link,
                    preview: SharePreview("Swizerland's flag: it's a big plus.", image: Image(systemName: "plus"))
                )
            }
        }
        
    }
}

#Preview {
    FFSystemShareSheet()
}
