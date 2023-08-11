//
//  FFGroupBox.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/11.
//
//  如何使用GroupBox可视化的对视图进行分组
//  SwiftUI的GroupBox视图将视图组合在一起，并在他后面放置浅色背景，以便它们突出。如果需要的话，还可以选择包含一个标题来制作组标题。
//  默认情况下，GroupBox将其视图垂直对齐。

import SwiftUI

struct FFGroupBox: View {
    var body: some View {
        GroupBox {
            Text("Your account")
                .font(.headline)
            Text("Username: metabblv@163.com")
            Text("City: Shanghai")
        }
        //通过Stack修改对齐方式
        GroupBox {
            VStack(alignment:.leading) {
                Text("Your account")
                    .font(.headline)
                Text("Username: metabblv@163.com")
                Text("City: Shanghai")
            }
        }
        //GroupBox的真正强大的功能，如果你嵌套它们，它们会自动调整颜色，以便清晰的区分。
        GroupBox {
            Text("Outer Content")
            GroupBox {
                Text("Middle Content")
                GroupBox {
                    Text("Inner Content")
                }
            }
        }
    }
}

#Preview {
    FFGroupBox()
}
