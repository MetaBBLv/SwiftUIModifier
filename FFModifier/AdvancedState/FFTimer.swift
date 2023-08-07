//
//  FFTimer.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/5.
//
//  在SwiftUI中如何使用Timer
//  如果想要定期运行一些代码，也许需要制作一个倒计时计时器，应该使用timer和onReceive（）修饰符

import SwiftUI

struct FFTimer: View {
    @State var currentDate = Date.now
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var timeRemaining = 10
    let timer1 = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Text("\(currentDate)")
            .onReceive(timer, perform: { input in
                currentDate = input
            })
        
        //对于Runloop选项使用.main很重要，因为计时器将更新用户界面，至于.common模式，它允许计时器与其他常见事件一起运行，例如，文本在视图中滚动。
        //onReceive（）闭包被传入一些包含当前日期的输入。在上面的代码中，将其直接赋值给currentDate，但是你可以使用它来计算从上一个日期到现在已经过去了多少时间。
        //如果你特别希望创建一个倒计时器或者秒表，则应该创建一些状态来跟踪剩余的时间，然后在计时器触发时减去剩余时间。
        //创建倒计时器，在label上显示剩余时间。
        Text("倒计时： \(timeRemaining)")
            .onReceive(timer1) { input in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                }
            }
    }
}

#Preview {
    FFTimer()
}
