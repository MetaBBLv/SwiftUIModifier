//
//  FFImageBackgrounds.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/11.
//
// SwiftUI 没有用于显示背景颜色或图像的专用修饰符，而是让我们使用background()修饰符指定任何类型的背景视图


import SwiftUI

struct FFImageBackgrounds: View {
    var body: some View {
        
        List {
            Section {
                Text(" Hacking With Swift")
                    .foregroundStyle(.white)
                    .font(.system(size: 48))
                    .padding(50)
                    .background(
                        Image(.cornOnTheCob)
                            .resizable()
                    )
            }
            
            Section {
                //但是，它不一定是图像
                Text(" Hacking With Swift")
                    .foregroundStyle(.black)
                    .font(.system(size: 48))
                    .padding(50)
                    .background(
                        Circle()
                            .fill(.red)
                            .frame(width: 50, height: 50)
                    )
            }
            
            Section {
                // 默认情况下，背景视图会占据你所有的空间，可以用clipped()进行裁剪
                //但是，它不一定是图像
                Text("Hacking With Swift")
                    .font(.largeTitle)
                    .padding()
                    .background(
                        Circle()
                            .fill(.red)
                            .frame(width: 100, height: 100)
                    )
                    .clipped()
            }
        }
    }
}

#Preview {
    FFImageBackgrounds()
}
