//
//  FFVideoPlayer.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/11.
//
// SwiftUI的VideoPlayer视图允许我们从任何URL播放视频，

import SwiftUI
import AVKit

struct FFVideoPlayer: View {
    var body: some View {
        List {
            // 本地视频
            VideoPlayer(player: AVPlayer(url: Bundle.main.url(forResource: "Video", withExtension: ".mp4")!))
                .frame(height: 400)
            // 远程视频
            VideoPlayer(player: AVPlayer(url: URL(string: "https://bit.ly/swswift")!))
                .frame(height: 400)
            
            //添加水印
            VideoPlayer(player: AVPlayer(url: Bundle.main.url(forResource: "Video", withExtension: ".mp4")!)) {
                VStack {
                    Text("Watermark")
                        .foregroundStyle(.black)
                        .background(
                            .white.opacity(0.7)
                        )
                }
            }
            .frame(width: 400, height: 300)
        }
    }
}

#Preview {
    FFVideoPlayer()
}
