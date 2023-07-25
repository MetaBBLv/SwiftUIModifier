//
//  FFTextFieldVerticalEx.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/25.
//
//  如何使TextField随着输入的内容增多而垂直扩展
//  SwiftUI的TextField默认是单行，并且TextEditor根据你要分配的空间大小提供多行替代方案。但有一个中间立场：如果我们将axis参数传递给TextField，我们可以要求它以单行开始并随着用户输入而向上增长，并且可以选择文本超过一定长度后切换到滚动。

import SwiftUI

struct FFTextFieldVerticalEx: View {
    
    @State private var bio = "About me"
    @State private var bio2 = "About me"
    @State private var bio3 = "About me"
    @State private var bio4 = "About me"
    
    var body: some View {
        VStack(alignment:.leading) {
            
            Text("行数无限延伸")
                .font(.system(size: 13))
                .foregroundStyle(.gray)
            
            TextField("Describe yourself", text: $bio, axis: .vertical)
                .textFieldStyle(.roundedBorder)
            
            Divider()
                .frame(height: 20)
            Text("lineLimit添加行数限制")
                .font(.system(size: 13))
                .foregroundStyle(.gray)
            // 添加lineLimit()修饰符来控制最大几行,一旦TextField超出限制，将切换到滚动模式
            TextField("Describe yourself", text: $bio2, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .lineLimit(3)
            
            Divider()
                .frame(height: 20)
            //lineLimit(2...5),最少2行，最多5行
            Text("lineLimit设置行数区间")
                .font(.system(size: 13))
                .foregroundStyle(.gray)
            TextField("Describe yourself", text: $bio3, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .lineLimit(2...5)
        }
        .padding()

        VStack(alignment: .leading) {
            Divider()
            //添加reservesSpace参数，lineLimit()是TextField可以自动分配空间
            Text("lineLimit设置reservesSpace")
                .font(.system(size: 13))
                .foregroundStyle(.gray)
                .background()
            TextField("Describe yourself", text: $bio4, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .lineLimit(5, reservesSpace: true)
        }
        .padding()
        Spacer()
        
        
        
    }
}

#Preview {
    FFTextFieldVerticalEx()
}
