//
//  FFImageVideo.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/12.
//
// 如何使用PhotosPicker导入视频
// SwiftUI-PhotosPicker允许用户选择视频并导入应用程序

import SwiftUI
import AVKit
import PhotosUI

struct Movie: Transferable {
    let url: URL
    
    static var transferRepresentation: some TransferRepresentation {
        FileRepresentation(contentType: .movie) { movie in
            SentTransferredFile(movie.url)
        } importing: { received in
            let copy = URL.documentsDirectory.appending(path: "movie.mp4")
            
            if FileManager.default.fileExists(atPath: copy.path()) {
                try FileManager.default.removeItem(at: copy)
            }
            
            try FileManager.default.copyItem(at: received.file, to: copy)
            return self.init(url: copy)
        }


    }
}

/**
 如何使用PhotosPicker导入视频
 1、导入AVKit以访问VideoPlayer视图，导入PhotosUI访问PhotosPicker视图
 2、自定义Movie结构体是告诉程序导入movie数据的方式，Transferable可以通过URL使用SentTransferredFile来发送数据，这意味着我可以讲Movie实例拖出应用程序，它还可以使用必报接受数据，它将movie的URL转换成movie.mp4的方式复制到我的文档目录，并删除任何现有的文件
 3、导入movie可能需要一些时间，因此我需要确认用户在后台应用程序运行时后了解我们的导入状态，通过4种状态来处理的：
 unknown当应用程序启动时，
 loading显示进度旋转器
 loaded当movie导入完成
 failed导入失败
 4、在onchange修饰符种，要求系统为我们提供一个Movie实例，以便我们接受URL并将其转移到正确的位置提供给app，这还负责设置loadState属性，保持UI同步
 */

struct FFImageVideo: View {
    enum LoadState {
        case unknown, loading, loaded(Movie), failed
    }
    
    @State private var selectedItem: PhotosPickerItem?
    @State private var loadState = LoadState.unknown
    
    var body: some View {
        
        List {
            PhotosPicker("Select movie", selection: $selectedItem, matching: .videos)
                .onChange(of: selectedItem) {
                    Task {
                        do {
                            loadState = .loading
                            
                            if let movie = try await selectedItem?.loadTransferable(type: Movie.self) {
                                loadState = .loaded(movie)
                            } else {
                                loadState = .failed
                            }
                        } catch {
                            loadState = .failed
                        }
                    }
                }
            
            switch loadState {
            case .unknown:
                EmptyView()
            case .loading:
                ProgressView()
            case .loaded(let movie):
                VideoPlayer(player: AVPlayer(url: movie.url))
                    .scaledToFit()
                    .frame(width: 300, height: 300)
            case .failed:
                Text("Import failed")
            }
        }
    }
}

#Preview {
    FFImageVideo()
}
