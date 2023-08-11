//
//  FFScrollViewReader.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/18.
//
//  如何使用ScrollViewReader使scrollView移动到某个位置
//  如果你想以编程方式使SwiftUI的ScrollView移动到特定位置，你应该在其中嵌入ScrollViewReader。它提供了一个scrollTo()方法，只需要提供其锚点即可移动到父ScrollView内的任何视图

import SwiftUI

struct FFScrollViewReader: View {
    let colors: [Color] = [.red, .green, .blue]
    
    var body: some View {
        List {
            Section {
                //下面的例子，在ScrollView中创建100个彩色框，当按下按钮，他会直接滚动到ID为8的框
                ScrollViewReader(content: { value in
                    ScrollView {
                        Button("Jump to #8") {
                            value.scrollTo(8)
                        }
                        .padding()
                        
                        ForEach(0..<100) { i in
                            Text("Example \(i)")
                                .font(.title)
                                .frame(width: 200, height: 200)
                                .background( colors[i % colors.count])
                                .id(i)
                        }
                    }
                })
                .frame(height: 350)
            }
            
            Section {
                //为了更好的控制滚动，你可以指定成为锚点的第二个参数，以控制滚动完成后目标视图的位置
                ScrollViewReader(content: { proxy in
                    ScrollView {
                        Button("Jump to #8") {
                            proxy.scrollTo(8, anchor: .top)
                        }
                        .padding()
                        
                        ForEach(0..<100) { i in
                            Text("Example \(i)")
                                .font(.title)
                                .frame(width: 200, height: 200)
                                .background( colors[i % colors.count])
                                .id(i)
                        }
                    }
                })
                .frame(height: 350)
            }
            //如果你在withAnimation中调用scrollTo()，会有动画效果
            Section {
                //为了更好的控制滚动，你可以指定成为锚点的第二个参数，以控制滚动完成后目标视图的位置
                ScrollViewReader(content: { proxy in
                    ScrollView {
                        Button("Jump to #88") {
                            withAnimation {
                                proxy.scrollTo(88, anchor: .top)
                            }
                        }
                        .padding()
                        
                        ForEach(0..<100) { i in
                            Text("Example \(i)")
                                .font(.title)
                                .frame(width: 200, height: 200)
                                .background( colors[i % colors.count])
                                .id(i)
                        }
                    }
                })
                .frame(height: 350)
            }
        }
    }
}

#Preview {
    FFScrollViewReader()
}
