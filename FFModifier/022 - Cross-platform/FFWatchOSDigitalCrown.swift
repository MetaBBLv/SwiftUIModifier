//
//  FFWatchOSDigitalCrown.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/29.
//
//  使用digitalCrownRotation()在watchOS上读取数字表冠
//  SwiftUI通过两个修饰符可以控制数字表冠，必须使用这两个修饰符才能使用表冠作为输入。第一个是focusable()，当想让相关视图能够接受Digital Crown更新时使用。还有一个digitalCrownRotation()

import SwiftUI

#if (watchOS)
struct FFWatchOSDigitalCrown: View {
    @State var scrollAmount = 0.0
    
    var body: some View {
        Text("Scroll: \(scrollAmount)")
            .focusable(true)
            .digitalCrownAccessory($scrollAmount)
        //在文本中显示的滚动值的范围是：负无穷大到正无穷大
        //digitalCrownRotation()修饰符还有其他几种形式，可以更好的控制她的行为方式：
        //- from和through设置滚动范围
        //- by设置步长，控制表冠每次转动时改变的两
        //- sensitivity确定表冠需要移动多少才能出发变化
        //- isContinuous确定值达到最小值或最大值是是否回绕，后者是否尽在这些边界值是停止更改。
        //- isHapticFeedbackEnabled确定转弯时是否出发触觉反馈。
        
        //设置一个以0.1为步长从1到5，从开始到结束环绕，并带有触觉反馈。
        Text("Scroll: \(scrollAmount)")
            .focusable(true)
            .digitalCrownRotation($scrollAmount, from: 1, through: 5, by: 0.1, sensitivity: .low, isContinuous: true, isHapticFeedbackEnabled: true)
    }
}

#Preview {
    FFWatchOSDigitalCrown()
}
#endif
