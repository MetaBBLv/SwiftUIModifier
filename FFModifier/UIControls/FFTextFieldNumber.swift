//
//  FFTextFieldNumber.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/25.
//
//  如何设置TextField的numbers
//

import SwiftUI

struct FFTextFieldNumber: View {
    @State private var score = 0
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var body: some View {
        // format格式化
        VStack(alignment: .leading) {
            TextField("Enter your score", value: $score, format: .number)
                .textFieldStyle(.roundedBorder)
            
            Text("Your score was \(score)")
            
        }
        .padding()
        
        //formatter格式化
        VStack(alignment: .leading) {
            TextField("Enter your score", value: $score, formatter: formatter)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Text("Your score was \(score)")
        }
        .padding()
        
        Spacer()
    }
}

#Preview {
    FFTextFieldNumber()
}
