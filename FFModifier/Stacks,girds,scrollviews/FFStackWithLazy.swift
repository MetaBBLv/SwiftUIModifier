//
//  FFStackWithLazy.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/19.
//
//  如何使用LazyVStack和LazyHStack延迟加载视图
//  默认情况下，SwiftUI的VStack和HStack会预先加载所有的内容，如果你在ScrollView使用它，可能会很慢，如果你想延迟加载内容-即今当内容滚动到视图中时，你应该考虑使用LazyVStack和LazyHStack

import SwiftUI

struct SampleRow: View {
    let id: Int
    
    var body: some View {
        Text("Row \(id)")
    }
    
    init(id: Int) {
        print("loading row \(id)")
        self.id = id
    }
}


struct FFStackWithLazy: View {
    var body: some View {
        List {
            Section {
                //创建100个垂直排列的Text，确保每个Text在滚动到视图中才创建
                ScrollView {
                    LazyVStack {
                        ForEach(1...100, id: \.self) { value in
                            Text("Row \(value)")
                        }
                    }
                }
                .frame(height: 300)
            }
            
            Section {
                //这些懒加载的stack在布局中具有自适应的首选宽度，因此它们会以与常规stack不同的方式占用空闲空间，上面的代码，你会发现可以在文本周围的空白处拖动，如果你切换到常规的垂直stack，就只能点文本本身拖动。
                //使用懒加载Stack，SwiftUI会在首次显示时自动创建视图，之后，该视图将保存在内存中，因此要注意显示内容的量。如果想了解懒加载在实践中时如何工作的，看下面事例
                ScrollView {
                    LazyVStack {
                        ForEach(1...100, id: \.self, content: SampleRow.init)
                    }
                }
                .frame(height: 300)
            }
        }
        
        
    }
}

#Preview {
    FFStackWithLazy()
}
