//
//  FFFormAlign.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/10.
//
//  如何对齐Form文本和控件整齐的标签内容
//  SwiftUI的表单做的很好，让许多视图看起来很好，但有时你需要一点额外的控制来获得正确的结果--正确的对齐文本，标记自定义视图，或者对齐没有带标签的空间，比如Slider

import SwiftUI

struct FFFormAlign: View {
    @State private var brightness = 0.5
    var body: some View {
        Form {
            //使用LabeledContent，类似于badge()修饰符
            LabeledContent("This is important", value: "Value goes here")
            
            //这把标题放在屏幕的前面，而值放在屏幕的后面，对齐方式将根据平台自动调整，iOS左对齐标题，右对齐值，而macOS右对齐标题左对齐值，对于macOS上的Form尤其重要，因为其他视图类型（如TextField和Toggle）会自动对齐标题和值，而slider不会
            //在iOS上，使用LabeledContent会得到与使用Text相同的结果，但LabeledContent真正强大之处在于它可以接受任何视图，而badge只接受文本和数字
            
            //使用LabeledContent来创建一个包含Image的视图
            LabeledContent("This is Imaged") {
                Image(systemName: "exclamationmark.triangle")
            }
            //但更重要的是，我们也可以在任何通常没有标签的视图使用它，比如slider
            LabeledContent {
                Slider(value: $brightness)
            } label: {
                Text("Brightness")
            }
            //重要提示：在撰写文本是，一些SwiftUI视图（如Stepper）将不会使用您的LabeledContent的标题作为VoiceOver。这使得它们可以在访问性支持方面相当不透明，因此要谨慎使用。
            //如果你的labeledContent的标题包含两段文本，iOS会自动以更小、更亮的字体呈现第二段文本，使其看起来像副标题
            LabeledContent {
                Text("Value")
            } label: {
                Text("Title")
                Text("Subtitle")
            }
            //事实上，使用这种方法，最多支持四段文本，每一段都会变得更小更轻
            LabeledContent {
                Text("Value")
            } label: {
                Text("Title")
                Text("Subtitle")
                Text("Subsubtitle")
                Text("Subsubsubtitle")
            }
            //将labelHidden()修饰符应用于任何LabeledContent，则标签标题将被隐藏，而内容将保持可见。
            LabeledContent {
                Text("Value")
            } label: {
                Text("Title")
                Text("Subtitle")
            }
            .labelsHidden()
        }
    }
}

#Preview {
    FFFormAlign()
}
