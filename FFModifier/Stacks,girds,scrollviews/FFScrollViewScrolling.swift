//
//  FFScrollViewScrolling.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/18.
//
//  如何使用ScrollView添加水平和垂直滚动
//  SwiftUI的ScrollView允许我们相对轻松的创建视图的滚动容器，因为它会自动调整自身大小以适合我们放置在其中的内容，并且还会自动添加额外的插图以避免安全区域
import SwiftUI

struct FFScrollViewScrolling: View {
    var body: some View {
        List {
            Section() {
                //创建一个包含10个文本的滚动列表
                ScrollView {
                    VStack(spacing: 20, content: {
                        ForEach(0..<10) {
                            Text("Item \($0)")
                                .foregroundStyle(.white)
                                .font(.largeTitle)
                                .frame(width: 200, height: 200)
                                .background(.red)
                        }
                    })
                }
                .frame(height: 350)
            }
            
            Section {
                //ScrollView默认是垂直的，但你可以通过传入.horizontal参数作为第一个参数来控制轴
                ScrollView(.horizontal) {
                    HStack(spacing: 20, content: {
                        ForEach(0..<10) {
                            Text("Item \($0)")
                                .foregroundStyle(.white)
                                .font(.largeTitle)
                                .frame(width: 200, height: 200)
                                .background(.red)
                        }
                    })
                }
            }
            
            Section {
                //是否在滚动发生时显示滚动显示器 showsIndicators
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20, content: {
                        ForEach(0..<10) {
                            Text("Item \($0)")
                                .foregroundStyle(.white)
                                .font(.largeTitle)
                                .frame(width: 200, height: 200)
                                .background(.red)
                        }
                    })
                }
            }
        }
    }
}

#Preview {
    FFScrollViewScrolling()
}
