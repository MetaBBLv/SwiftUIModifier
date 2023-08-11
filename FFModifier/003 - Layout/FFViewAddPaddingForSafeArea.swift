//
//  FFViewAddPaddingForSafeArea.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/17.
//
//  如何向安全区域添加额外的填充
//  SwiftUI的safeAreaPadding修饰符通过你选择的数量插入安全区域，要么在所有边上，要么在一个子集上。在处理滚动内容时，他的行为与使用普通padding修饰符不同，因为它将插入滚动视图的内容，而不是滚动视图本身。

import SwiftUI

struct FFViewAddPaddingForSafeArea: View {
    var body: some View {
        List {
            Section {
                //绘制一个红色圆，安全区域设置为50
                Circle()
                    .fill(.red)
                    .safeAreaPadding(50)
                
                //只控制横向 50
                Circle()
                    .fill(.red)
                    .safeAreaPadding(.horizontal, 50)
                
                // Edgeinsets，四边分别控制
                Circle()
                    .fill(.red)
                    .safeAreaPadding(.init(top: 20, leading: 50, bottom: 20, trailing: 50))
                
            }
            
            //当我对ScrollView应用safeAreaPadding时，事情就变得有趣了，因为它确保我们的内容从屏幕的边缘开始。
            Section {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(0..<10) {i in
                            Circle()
                                .frame(width: 50, height: 50)
                        }
                    }
                }
                .safeAreaPadding(50)
            }
        }
    }
}

#Preview {
    FFViewAddPaddingForSafeArea()
}
