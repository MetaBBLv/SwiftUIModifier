//
//  FFSFAminate.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/12.
//
//  入会绘制SF Symbols动画
// SwiftUI提供了symbolEffect()修饰符来为SF Symbol添加内置动画效果，

import SwiftUI

struct FFSFAminate: View {
    @State private var petCount = 0
    @State private var isFavorite = false
    @State private var animationsRunning = false
    
    var body: some View {
        List {
            Section {
                Button {
                    petCount += 1
                } label: {
                    Label("Pet the Dog", systemImage: "dog")
                }
                .symbolEffect(.bounce, value: petCount)
                .font(.largeTitle)
            }
            
            Section {
                //通过.pulse对透明度惊醒动画处理，但是如果你使用具有多个图层的SF Symbols时，效果也是很好的
                Button {
                    isFavorite.toggle()
                } label: {
                    Label("Activate Inbox Zero", systemImage: "mail.stack")
                }
                .symbolEffect(.bounce.down, value: isFavorite)
                .font(.largeTitle)
            }
            
            Section {
                //添加额外的选项来获得重复计数和自定义速度
                Button {
                    isFavorite.toggle()
                } label: {
                    Label("Activate Inbox Zero", systemImage: "mail.stack")
                }
                .symbolEffect(.bounce.down, options: .speed(3).repeat(3),value: isFavorite)
                .font(.largeTitle)
            }
            
            Section {
                //可变颜色动画特别强大，以为SF Symbols可以让你控制每个图层的动画
                // .variableColor.iterative：一次为一个图层做色，.variableColor.cumulative将每个新图层添加到先前的着色图层中，并且可以使用reversing到其中任何一个来制作动画是向前播放还是向后播放
                Button("Start Animations") {
                    withAnimation {
                        animationsRunning.toggle()
                    }
                }
                
                HStack {
                    Image(systemName: "square.stack.3d.up")
                        .symbolEffect(.variableColor.iterative, value: animationsRunning)
                        
                    Image(systemName: "square.stack.3d.up")
                        .symbolEffect(.variableColor.cumulative, value: animationsRunning)
                        
                    Image(systemName: "square.stack.3d.up")
                        .symbolEffect(.variableColor.reversing.iterative, value: animationsRunning)
                        
                    Image(systemName: "square.stack.3d.up")
                        .symbolEffect(.variableColor.reversing.cumulative, value: animationsRunning)
                        
                }
                .font(.largeTitle)
                
                HStack {
                    Image(systemName: "square.stack.3d.up")
                        .symbolEffect(.variableColor.iterative,options: .repeating, value: animationsRunning)
                        
                    Image(systemName: "square.stack.3d.up")
                        .symbolEffect(.variableColor.cumulative,options: .repeat(3), value: animationsRunning)
                        
                    Image(systemName: "square.stack.3d.up")
                        .symbolEffect(.variableColor.reversing.iterative, options: .speed(3), value: animationsRunning)
                        
                    Image(systemName: "square.stack.3d.up")
                        .symbolEffect(.variableColor.reversing.cumulative, options: .repeat(3).speed(3), value: animationsRunning)
                        
                }
                .font(.largeTitle)
            }
            
            Section {
                //如果通过点击与用户交互，切换图标，使用修饰符contentTransition()
                Button{
                    withAnimation {
                        isFavorite.toggle()
                    }
                } label: {
                    Label("Toggle Favorite", systemImage: isFavorite ? "checkmark" : "heart")
                }
                .contentTransition(.symbolEffect(.replace))
                .font(.largeTitle)
            }
            
        }
    }
}

#Preview {
    FFSFAminate()
}
