//
//  FFToolingInstruments.swift
//  FFModifier
//
//  Created by BBLv on 2023/9/4.
//
//  如何使用Instrument分析SwiftUI代码并识别缓慢布局
//  Xcode的Instruments工具附带了一组出色的SwiftUI分析功能，使我们能够确定视图重回的频率、计算视图主体缓慢的次数，甚至状态在实时变化的情况。

import SwiftUI

//首先，创建一个每0.01秒触发一次的计时器，并有一个显示随机值UUID的视图和一个button
class FrequentUdater: ObservableObject {
    var timer: Timer?
    
    init() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { _ in
            self.objectWillChange.send()
        })
    }
}

struct FFToolingInstruments: View {
    @StateObject private var updater = FrequentUdater()
    @State private var tapCount = 0
    
    var body: some View {
        VStack {
            Text("\(UUID().uuidString)")
            Button("Tap count: \(tapCount)") {
                tapCount += 1
            }
        }
    }
}

#Preview {
    FFToolingInstruments()
}
