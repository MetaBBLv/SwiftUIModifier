//
//  FFProgressView.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/25.
//
//  如何通过ProgressView显示任务进度

import SwiftUI

struct FFProgressView: View {
    @State private var downloadAmount = 0.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    var body: some View {
        //创建一个正在下载的进度条
        VStack {
            ProgressView("Downloading...", value: downloadAmount, total: 100)
        }
        .padding()
        
        ProgressView("Downloading...", value: downloadAmount, total: 100)
            .onReceive(timer, perform: { _ in
                if downloadAmount < 100 {
                    downloadAmount += 2
                }
            })
            .padding()
        
        //动态填满进度条
        
    }
}

#Preview {
    FFProgressView()
}
