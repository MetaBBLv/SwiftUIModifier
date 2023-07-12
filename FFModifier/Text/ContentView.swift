//
//  ContentView.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            Section("...") {
                
            }
            
            Section("AttributedString") {
                // AttributedString: SwiftUI的Textg视图可以渲染使用Foundation的AttributedString结构创建更高阶的字符串，包括添加下划线、时出现、网页链接、背景颜色等。
                var message: AttributedString {
                    var result = AttributedString("蜀道之难，难于上青天！")
                    result.font = .largeTitle
                    result.foregroundColor = .blue
                    result.backgroundColor = .red
                    return result
                }
                
                Text(message)
                
                // 由于部分修饰是使用AttributedString自定义完成的，而不是Text，这意味着北京颜色是字符串本身的一部分，如果有需求，可以使用不同的背景颜色将多个字符串合并在一起。
                
                var message1: AttributedString {
                    var result = AttributedString("蜀道之难")
                    result.font = .largeTitle
                    result.foregroundColor = .white
                    result.backgroundColor = .red
                    return result
                }
                
                var message2: AttributedString {
                    var result = AttributedString("难于上青天")
                    result.font = .largeTitle
                    result.foregroundColor = .white
                    result.backgroundColor = .blue
                    return result
                }
                
                Text(message1 + message2)
                
                // 当使用AttributedString修饰自定义字符串的时候，Text.background()修饰符是不起总用的
                Text(message)
                    .background(.pink)
                
                //自定义下划线颜色和图案
                var message3: AttributedString {
                    var result = AttributedString("蜀道之难，难于上青天！")
                    result.font = .largeTitle
                    result.foregroundColor = .white
                    result.backgroundColor = .blue
                    result.underlineColor = .white
                    result.underlineStyle = .single
                    return result
                }
                
                Text(message3)
                    
                // 将单个字符上下偏移
                var message4: AttributedString {
                    let string = "蜀道之难，难于上青天！"
                    var result = AttributedString()
                    
                    for (index, letter) in string.enumerated() {
                        var letterString = AttributedString(String(letter))
                        letterString.baselineOffset = sin(Double(index)) * 5
                        result += letterString
                    }
                    
                    result.font = .largeTitle
                    return result
                }
                
                Text(message4)
                
                // Link属性
                var message5: AttributedString {
                    var result = AttributedString("蜀道之难，难于上青天！")
                    result.font = .largeTitle
                    result.link = URL(string: "https://hanyu.baidu.com/shici/detail?from=kg1&highlight=&pid=6fbfb8ec1039475d9d4051021e19e661&srcid=51369")
                    return result
                }
                
                Text(message5)
                
                // AttributedString: 不会丢弃我们提供有关字符串的所有原数据，例如（处于可访问性原因，我们可以将字符串的一部分标记为需要拼写，以便在使用VoiceOver时正确读出密码等内容）
                var message6: AttributedString {
                    var password = AttributedString("abcdefg")
                    password.accessibilitySpeechSpellsOutCharacters = true
                    return "你的密码是：" + password
                }
                
                Text(message6)
                
                // 处理结构化信息的方式，例如：如果我们将Date实例格式化为属性字符串，它会保留每个组件代表的内容的知识 - 例如，它会记住“November”是字符串的月份部分。                这意味着我们可以在语义上设置字符串的样式：我们可以说“除了工作日部分之外，使整体具有次要颜色 - 应该具有主要颜色”
                var message7: AttributedString {
                    var result = Date.now.formatted(.dateTime.weekday(.wide).day().month(.wide).attributed)
                    result.foregroundColor = .secondary
                    
                    let weekday = AttributeContainer.dateField(.weekday)
                    let weekdayStyling = AttributeContainer.foregroundColor(.primary)
                    result.replaceAttributes(weekday, with: weekdayStyling)
                    
                    return result
                }
                
                Text(message7)
                
                //处理人名时也是如此PersonNameComponents——这就是一个AttributedString例子，某人的姓氏是粗体的：
                var message8: AttributedString {
                    var components = PersonNameComponents()
                    components.givenName = "Taylor"
                    components.familyName = "Swift"
                    
                    var result = components.formatted(.name(style: .long).attributed)
                    
                    let familyNameStyling = AttributeContainer.font(.headline)
                    let familyName = AttributeContainer.personNameComponent(.familyName)
                    result.replaceAttributes(familyName, with: familyNameStyling)
                    
                    return result
                }
                
                Text(message8)
                
                // 您甚至可以将其用于测量。例如，以下代码创建 200 公里的测量值，然后对其进行格式化，以便显示的值远大于单位：
                var message9: AttributedString {
                    let amount = Measurement(value: 200, unit: UnitLength.kilometers)
                    var result = amount.formatted(.measurement(width: .wide).attributed)
                    
                    let distanceStyling = AttributeContainer.font(.title)
                    let distance = AttributeContainer.measurement(.value)
                    result.replaceAttributes(distance, with: distanceStyling)
                    
                    return result
                }
                
                Text(message9)
                
                
                
                
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
