//
//  FFLazyGridPosition.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/19.
//
//  如何使用LazyVGrid和LazyHGrid在网格中定位视图
//  SwiftUI的LazyVGrid和LazyHGrid为我们提供了具有相当灵活性的网格布局。最简单的网格由三部分组成：原始数据、描述所需布局的GridItem数组，以及将数据和布局组合在一起的LazyVGrid或LazyHGrid

import SwiftUI

struct FFLazyGridPosition: View {
    
    let data = (1...100).map {
        "Item \($0)"
    }
    
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    let columns1 = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let columns2 = [
        GridItem(.fixed(50)),
        GridItem(.flexible())
    ]

    let items = 1...50
    
    let rows = [
        GridItem(.fixed(50)),
        GridItem(.fixed(50))
    ]
    var body: some View {
        List {
            Section {
                // 使用GridItem(.adaptive(minimum:80))意味着我希望网格可以容纳尽可能多的数量，每行最小为80
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20, content: {
                        ForEach(data, id: \.self) { item in
                            Text(item)
                        }
                    })
                    .padding()
                }
                .frame(maxHeight: 300)
            }
            
            Section {
                //如果你想控制列数，可以使用.flexible（）代替，它还可以指定每个item的大小
                ScrollView {
                    LazyVGrid(columns: columns1, spacing: 20, content: {
                        ForEach(data, id: \.self) { item in
                            Text(item)
                        }
                    })
                    .padding(.horizontal)
                }
                .frame(height: 300)
            }
            
            Section {
                //第三种选择使用固定尺寸，例如，设置第一列宽度为50，让第二列填充所有剩余的空间
                ScrollView {
                    LazyVGrid(columns: columns2, spacing: 20, content: {
                        ForEach(data, id: \.self) { item in
                            Text(item)
                        }
                    })
                    .padding()
                }
                .frame(maxHeight: 300)
            }
            
            Section {
                //还可以使用LazyHGrid制作水平滚动网格，原理大致相同，只是需要在初始化时提供行数。创建10个并排的水平广东标题图像
                ScrollView(.horizontal) {
                    LazyHGrid(rows: rows, alignment: .center, content: {
                        ForEach(items, id: \.self) { item in
                            Image(systemName: "\(item).circle.fill")
                                .font(.largeTitle)
                        }
                    })
                    .frame(height: 150)
                }
                //创建水平和垂直Grid所需的代码几乎相同，只是将行改成列
            }
        }
    }
}

#Preview {
    FFLazyGridPosition()
}
