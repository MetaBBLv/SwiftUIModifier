//
//  FFAlertShow.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/16.
//
//  关于alert的弹出
//  SwiftUI允许我们通过alert()修饰符想用户显示警报，但如何工作取决于你是针对iOS15或更高的版本，还是你也需要支持iOS13和14.我将在这里展示两种方法，但更新的iOS15方法更可取，因为它建立在标准的SwiftUI按钮上。
//  在iOS15，要显示alert，请创建一些bool状态来确定alert是否应该可见，然后将其与希望在alert中显示的所有按钮一起附加到alert()修饰符。所有按钮在点击时都会关闭alert，因此你可以认为关闭时一个空操作。

import SwiftUI

struct TVShow: Identifiable {
    var id: String { name }
    let name: String
}

struct FFAlertShow: View {
    @State private var showingAlert = false
    @State private var showingAlert2 = false
    @State private var showingAlert3 = false
    @State private var selectedShow: TVShow?
    var body: some View {
        //创建一个带有“OK”的alert
        Button("Show alert") {
            showingAlert = true
        }
        .alert("Important message", isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        }
        //像这样显示alert会在点击按钮时自动将showingAlert设置为false。
        //你可以根据需求提供尽可能多的按钮，如果你没有提供按钮，那么你会自动得到一个默认的“OK”来关闭alert。因为这些都是SwiftUI按钮，你可以分配其他的role，比如，.destructive来让系统对他们进行适当的样式化。
        
        //创建带有多个Button的alert
        Button("Show Alert For Buttons") {
            showingAlert2 = true
        }
        .alert("Important message", isPresented: $showingAlert2) {
            Button("First", role: .destructive) { }
            Button("Second", role: .destructive) { }
            Button("Third", role: .destructive) { }
            Button("Cancel", role: .cancel) { }
        }
        
        //要显示alert，第一种方法时定义某种可绑定条件。以确定alert是否应该可见。然后将其附加到主视图上，一旦其条件未真，主视图就会显示alert。
        //例如，这段代码创建了一个showingAlert的bool值，它跟踪防晒信息是否应该被显示，当按钮被点击时将Bool值设置为true，然后使用该bool值创建并附加一个alert视图，一边在按钮被点击时使用。
        Button("Show Alert") {
            showingAlert3 = true
        }
        .alert(isPresented: $showingAlert3) {
            Alert(title: Text("metabblv"), message: Text("Wear sunscreen"), dismissButton: .default(Text("Got it!")))
        }
        
        //创建警报的第二种方法时绑定到一些符号Identifiable的可选状态，这将导致在对象的值发生变化时弹出alert。
        //这种方法有两个有优点：
        //1、你可以在运行时附加任何你喜欢的对象，因此你的alert可以显示任意数量的不同数据块。
        //2、SwiftUI会在可选值有值的时候自动展开，这样你就可以在你想要显示alert的时候确定他的存在。不需要自己检查和展开值。
        //例如，这显示了一个alert，根据选择的TV show you两个不同的值。
        Divider()
        VStack(spacing:20) {
            Text("What is your favorite TV Show?")
                .font(.largeTitle)
            Button("Select Ted Lasso") {
                selectedShow = TVShow(name: "Ted Lasso")
            }
            Button("Select Bridgerton") {
                selectedShow = TVShow(name: "Bridgerton")
            }
        }
        .alert(item: $selectedShow) { show in
            Alert(title: Text(show.name), message: Text("Great choice!"), dismissButton: .cancel())
        }
    }
}

#Preview {
    FFAlertShow()
}
