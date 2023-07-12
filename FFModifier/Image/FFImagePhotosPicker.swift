//
//  FFImagePhotosPicker.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/12.
//
// 如何使用PhotosPicker选择图片
// SwiftUIPhitisPicker可以使用系统标准图片导入界面，允许用户选择一张或多张图片以及视频导入你的应用程序
// 如果使用它来应用图像，你需要导入PhotosUI，然后创建存储PhotosPickerItem来保存用户选择的内容，并创建一个Image属性来存储加载的资源

import SwiftUI
import PhotosUI

struct FFImagePhotosPicker: View {
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?
    
    @State private var selectedItems = [PhotosPickerItem]()
    @State private var selectedImages = [Image]()
    
    var body: some View {
        /**
         如果您想更好地控制所选数据，请matching根据您要查找的内容调整参数：
         
         matching: .screenshots如果您只需要屏幕截图，请使用。
         matching: .any(of: [.panoramas, .screenshots])如果您想要其中任何一种类型，请使用。
         matching: .not(.videos)如果您想要非视频的任何媒体，请使用。
         matching: .any(of: [.images, .not(.screenshots)]))如果您想要除屏幕截图之外的所有类型的图像，请使用。
         */
        List {
            Section {
                PhotosPicker("Select acatar", selection: $avatarItem, matching: .images)
                
                if let avatarImage {
                    avatarImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                }
            }
            .onChange(of: avatarItem) {
                Task {
                    if let data = try? await avatarItem?.loadTransferable(type: Data.self) {
                        if let uiImage = UIImage(data: data) {
                            avatarImage = Image(uiImage: uiImage)
                            return
                        }
                    }
                }
            }
            
            Section {
                
                PhotosPicker("Select Images", selection: $selectedItems, matching: .images)
                    .onChange(of: selectedItems) {
                        Task {
                            selectedImages.removeAll()
                            
                            for item in selectedItems {
                                if let data = try? await item.loadTransferable(type: Data.self) {
                                    if let uiImage = UIImage(data: data) {
                                        let image = Image(uiImage: uiImage)
                                        selectedImages.append(image)
                                    }
                                }
                            }
                        }
                    }
                ForEach(0..<selectedImages.count, id: \.self) { i in
                    selectedImages[i]
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300 ,height: 300)
                }
            }
        }
    }
}

#Preview {
    FFImagePhotosPicker()
}
