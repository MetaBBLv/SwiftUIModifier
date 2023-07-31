//
//  FFPasteData.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/31.
//
//  如何让用户将数据粘贴到应用程序中
//  SwiftUI有一个专用的PasteBUtton视图，科技让我们接收任何符合Transferable协议的数据，比如String和Data
import SwiftUI

struct FFPasteData: View {
    @State private var username = "@twostraws"
    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .textFieldStyle(.roundedBorder)
            
            PasteButton(payloadType: String.self) { strings in
                guard let first = strings.first else { return }
                username = first
            }
            .buttonBorderShape(.capsule)
        }
        .padding()
    }
}

#Preview {
    FFPasteData()
}
