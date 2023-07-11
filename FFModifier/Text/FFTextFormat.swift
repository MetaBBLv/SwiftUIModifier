//
//  FFTextFormat.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/10.
//

import SwiftUI

struct FFTextFormat: View {
    @State private var ingredients = [String]()
    @State private var rolls = [Int]()
    
    var body: some View {
        

        
        List{
            Section {
                //SwiftUI 的文本试图能过通过其format参数显示日期、数组、测量值等。不过，此功能尽在iOS15中可用，因此对iOS14、iOS13的支持，参考formatter
                //如果将格式类型与字符串数组一起使用.list()，则可以获得整齐的列表，例如“Howard、Josie和Kingsley”,无论多少条目，都将正确的打印成员列表
                Text(ingredients, format: .list(type: .and))
                
                Button("Add Ingredient") {
                    let possibles = ["Egg", "Sausage", "Bacon","Spam"]
                    
                    if let newIngredieng = possibles.randomElement() {
                        ingredients.append(newIngredieng)
                    }
                }
            }
            
            Section {
                //如果你拥有一个数字类型的数组，例如整数，则可以通过指定成员方式来格式化数组
                Text(rolls, format: .list(memberStyle: .number, type: .and))
                
                Button("Roll Dice") {
                    let result = Int.random(in: 1...6)
                    rolls.append(result)
                }
            }
            
            Section {
                //如果你想处理距离或者重量等测量值，.measurement()格式类型将自动调整你的值所在用户区域设置中显示。例如，如果你在内部存储以厘米为单位的值，但用户设备上的区域设置为美国，iOS将根据值的大小自动显示以英尺为单位的值
                let length = Measurement(value: 225, unit: UnitLength.centimeters)
                Text(length, format: .measurement(width: .wide))
                
                //格式化货币符号，确保显示的是两位小数，并根据需要添加货币符号
                Text(72.3, format: .currency(code: "CAD"))
            }
        }
    }
}

#Preview {
    FFTextFormat()
}
