//
//  FFPresentSheets.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/17.
//
//  如何使用Sheet-Present一个新视图
//  SwiftUI的Sheets用于香油视图上present新视图，同时仍然允许用户在准备好时向下拖动以取消新视图。
//  要使用表单，给他一些东西来显示（文本、图片、自定义View等），添加一个Bool值来定义DetailView是否应该被显示，然后将其作为模态sheet附加到主视图上。

import SwiftUI

//例如，这创建一个简单的DetailView，然后在点击Button时从ContentView-present它
struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button("Press to dismiss") {
            dismiss()
        }
        .font(.title)
        .padding()
        .background(.black)
    }
}

struct FFPresentSheets: View {
    @State private var showingSheet = false
        
    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SheetView()
        }
    }
    //如果在iOS14以下，使用@environment(\.presentationMode) var presentationMode 和presentationMode.wrappedValue.dismiss()来代替
    //与导航push不同，Sheet不需要NavigationStack。
    //在iOS上，如果想关闭向下拖动关闭的操作，使用fullScreenCover()修饰符
}

#Preview {
    FFPresentSheets()
}
