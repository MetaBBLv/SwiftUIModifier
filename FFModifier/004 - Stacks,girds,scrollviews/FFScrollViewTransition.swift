//
//  FFScrollViewTransition.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/19.
//
//  如何使用自定义transition创建ScrollView
//  SwiftUI的ScrollView将其所有子视图放置在平滑滚动的垂直或水平容器中，但如果我们将scrollTransition()修饰符附加到子视图，那么我们就可以在屏幕上切换自定义视图

import SwiftUI

struct FFScrollViewTransition: View {
    var body: some View {
        List {
            Section {
                /**该修饰符比许传递一个至少带有两个参数的必要：一些要控制内容（滚动其余内的一个子视图），加上滚动过度阶段。阶段有三个枚举值：
                    .identity阶段：，视图在屏幕上可见
                    .topLeading阶段：根据滚动视图方向，视图即将从顶部或前缘变得可见（即将出现）
                    .bottomTrailing阶段：他是.topLeading的递补对影像
                 */
                //例子，垂直滚动视图中方式一些理圆觉矩形，使他们在靠近屏幕边缘是淡入和淡出
                ScrollView {
                    ForEach(0..<10) {i in
                        RoundedRectangle(cornerRadius: 25.0)
                            .fill(.blue)
                            .frame(height: 80)
                            .scrollTransition { content, phase in
                                content
                                    .opacity(phase.isIdentity ? 1 : 0)
                                    .scaleEffect(phase.isIdentity ? 1 : 0.75)
                                    .blur(radius: phase.isIdentity ? 0 : 10)
                            }
                            .padding(.horizontal)
                    }
                }
                .frame(height: 300)
            }
            
            Section {
                ScrollView {
                    ForEach(0..<10) {i in
                        RoundedRectangle(cornerRadius: 25.0)
                            .fill(.blue)
                            .frame(height: 80)
                            .scrollTransition(.animated.threshold(.visible(0.9)), transition: { content, phase in
                                content
                                    .opacity(phase.isIdentity ? 1 : 0)
                                    .scaleEffect(phase.isIdentity ? 1 : 0.75)
                                    .blur(radius: phase.isIdentity ? 0 : 10)
                            })
                            .padding(.horizontal)
                    }
                }
                .frame(height: 300)
            }
            
            Section {
                //如果你需要非常精确的控制所有应用的效果，请读取过度段的值。对于顶部前导阶段中的视图，该值为-1，对于底部尾随阶段中的视图，该值为1，杜宇所有其他视图，该值为0
                //例如，通过phase.value与hueRotation()修饰符结合起来，轻轻松松的修改每个滚动形状的色调
                ScrollView {
                    ForEach(0..<10) { i in
                        RoundedRectangle(cornerRadius: 25.0)
                            .fill(.blue)
                            .frame(height: 80)
                            .shadow(radius: 3)
                            .scrollTransition { content, phase in
                                content.hueRotation(.degrees(45 * phase.value))
                            }
                            .padding(.horizontal)
                    }
                }
                .frame(height: 400)
            }
        
        }
        
        //对于附加控制，你可以指定在显示或删除视图之前需要显示多少视图。例如，我们可以说我们希望只有当滚动视图至少90%可见时才将其插入到视图数组中
    }
}

#Preview {
    FFScrollViewTransition()
}
