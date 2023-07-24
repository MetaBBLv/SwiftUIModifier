//
//  FFTappableButton.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/24.
//
//  如何创建可点击的Button
//  SwiftUI的按钮和UIButton类似，但显示内容方面更佳灵活，并且它的操作使用闭包而不是原来的target-action
import SwiftUI

struct FFTappableButton: View {
    @State private var showDetails = false
    var body: some View {
        List {
            //创建带有字符串标题的Button
            Button("Button title") {
                print("Button tapped!")
            }
            
            // 创建一个Button，点击时显示/隐藏一些详细文本
            VStack(alignment: .leading, content: {
                Button("Show details") {
                    showDetails.toggle()
                }
                
                if showDetails {
                    Text("You should follow me on Twitter: @twostraws")
                        .font(.largeTitle)
                }
            })
            
            //按钮内的标题可以时任何类型的视图，因此可以创建一个图像Button
            Button(action: {
                print("Image tapped!")
            }, label: {
                Image("virgin-mojito")
            })
            
            //当你想要增加按钮的可点击区域时，使用自定义标签确实很有帮助，因为你可以对标签应用填充，然后使用contentShape(rectangle())类似方法使整个区域可点。例如向按钮的标签添加20个padding，来让它获得更大的点击空间
            Button {
                print("Button pressed")
            } label: {
                Text("Press Me")
                    .padding(20)
            }
            .contentShape(Rectangle())
            
            //在iOS15以及更高的版本，你还可以为button附加一个角色，以帮助SwiftUI了解应该为按钮附加那种样式。例如，如果创建一个删除按钮，用.destructive角色来标记它，以便SwiftUI可以在有意义时以红色突出显示它。
            Button("Delete", role: .destructive) {
                print("Perform delete")
            }
            
            //将role设定为.cancle，它再次为SwiftUI提供了额外的上下文来适当的呈现它
            Button("Detail", role: .cancel) {
                print("Perform cancel")
            }
        }
    }
}

#Preview {
    FFTappableButton()
}
