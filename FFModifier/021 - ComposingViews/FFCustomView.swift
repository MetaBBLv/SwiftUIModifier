//
//  FFCustomView.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/28.
//
//  如何创建和组合自定义视图
//  SwiftUI的核心之一就是组合，这意味着可以创建许多小视图，然后将他们组合以创建更大、更复杂的视图。这可以大规模的重用视图，这意味着工作量减少了。更好的情况下，组合视图运行时几乎不会造成额外的开销，因此可以随意使用而不用在意性能。

import SwiftUI

//人物信息结构体
struct Employee {
    var name: String
    var jobTitle: String
    var emailAddress: String
    var profilePicture: String
}
//如果希望App中的员工个人资料有头像图片，可以创建一个圆形的视图
struct ProfilePicture: View {
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
    }
}
//创建一个email视图
struct EmailAddress: View {
    var address: String
        
    var body: some View {
        HStack {
            Image(systemName: "envelope")
            Text(address)
        }
    }
}

//员工具体的详细信息
struct EmployeeDetail: View {
    var employee: Employee
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(employee.name)
                .font(.largeTitle)
                .foregroundStyle(.primary)
            Text(employee.jobTitle)
                .foregroundStyle(.secondary)
            EmailAddress(address: employee.emailAddress)
        }
    }
}
//创建一个更大的视图，将ProfilePicture与Employee组合，提供整体的员工信息
struct EmployeeView: View {
    var employee: Employee
    
    var body: some View {
        HStack {
            ProfilePicture(imageName: employee.profilePicture)
            EmployeeDetail(employee: employee)
        }
    }
}
//通过分离的结构，可以用很多中方式来展示员工的信息：
//- 只展示头像
//- 只显示电子邮件
//- 只显示员工具体信息
//- 显示所有信息
//更重要的是，这意味着当涉及到使用这些struct时，主要的内容视图不必担心如何构建这些内容的布局，因为它只包含一个大的视图，所有的这些布局都被融入到较小的视图中。这就意味着我只要在body中创建一个EmployeeView就可以了。

//那么，在使用的时候就相当方便了，而且，较小的视图还可以以不同的方式组合
struct FFCustomView: View {
    //构建数据
    let employee = Employee(name: "Meta BBLv", jobTitle: "Keep Loving, Keep Living", emailAddress: "metabblv@163.com", profilePicture: "chrysanthemum-tea-thumb")
    
    var body: some View {
        EmployeeView(employee: employee)
    }
}

#Preview {
    FFCustomView()
}
