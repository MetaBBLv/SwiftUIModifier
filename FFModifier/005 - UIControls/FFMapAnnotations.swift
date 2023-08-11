//
//  FFMapAnnotations.swift
//  FFModifier
//
//  Created by 小B同学 on 2023/7/25.
//
//  如何在Map中显示注释
//  swiftUI的Map可以在地图上标注注释，包括默认的标记和引脚，以及完全自定义的视图。
//  1、创建某种状态，以跟踪地图显示的坐标，使用MKCoordinateRegion跟踪地图的中心和缩放级别。
//  2、准备一系列位置用于你的注释
//  3、决定你希望它如何显示在你的地图上。你可以显示内置的MapPin和MapMaker注释，也可以使用自己的视图。
//  无论你创建的什么位置数组，你的类型都必须符合Identifiable，以便SwiftUI了解如何唯一的识别每个项目。

import SwiftUI
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

//如果你拥有的只是CLLocationCoordinate2D数据，你可以通过向这样的扩展来直接使用他们。
extension CLLocationCoordinate2D: Identifiable {
    public var id: String {
        "\(latitude)-\(longitude)"
    }
}

//它把所有的东西放在一起，这样你就可以看到各个首都城市的大头针
struct City: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct FFMapAnnotations: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    let  annotations = [
        City(name: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275)),
        City(name: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508)),
        City(name: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5)),
        City(name: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.89511, longitude: -77.036667))
        
    ]
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: annotations) {
            MapPin(coordinate: $0.coordinate)
        }
        .frame(width: 400, height: 300)
    }
}

#Preview {
    FFMapAnnotations()
}

