//
//  FFStackSpacer.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/18.
//
// 如何使用 Spacer 将视图强制到stack内的一侧
//  SwiftUI默认情况下将视图居中，着意味着如果你将三个Text放入Vstack内，则所有的Text都将在屏幕中垂直居中。如果你想更改，比如你想让强制视图炒香屏幕顶部、底部、左侧或右侧，那么你就要使用Spacer视图
import SwiftUI

struct FFStackSpacer: View {
    var body: some View {
        List {
            Section {
                VStack {
                    Text("Hello, World!")
                }
            }
            .frame(height: 300)
            
            //要讲文本视图推到父级的顶部，在下方放一个间隔符spacer
            Section {
                VStack {
                    Text("Hello, World!")
                    Spacer()
                }
            }
            .frame(height: 300)
            
            //在横向Stack中，如果你要是视图放置在两侧，在中间添加spacer
            Section {
                HStack {
                    Text("Hello")
                    Spacer()
                    Text("World")
                }
            }
            
            //如果想要将文本放置在其父视图1/3中的位置，那么就在Text之前放置1个spacer，在之后放置2个spacer
            Section {
                VStack {
                    Spacer()
                    Text("Hello, World!")
                    Spacer()
                    Spacer()
                }
            }
            .frame(height: 300)
        }
        
    }
}

#Preview {
    FFStackSpacer()
}
