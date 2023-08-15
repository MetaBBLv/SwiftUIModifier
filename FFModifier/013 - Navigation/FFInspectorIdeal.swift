//
//  FFInspectorIdeal.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/15.
//

import SwiftUI

struct FFInspectorIdeal: View {
    @State private var isShowingInspector1 = false
    
    var body: some View {
        //在支持他的平台上，你可以通过提供一个 (.inspectorColumnWidth(500)) 固定的大小来占用康健，或者通过提供一个(.inspectorColumnWidth(min: 50, ideal: 150, max: 200))范围来调整检查器的占用空间。
        
        Button("Hi, metaBBLv") {
            isShowingInspector1.toggle()
        }
        .font(.largeTitle)
        .inspector(isPresented: $isShowingInspector1) {
            Text("Insepctor View BBlv")
                .inspectorColumnWidth(min:50, ideal: 150, max: 200)
        }
    }
}

#Preview {
    FFInspectorIdeal()
}
