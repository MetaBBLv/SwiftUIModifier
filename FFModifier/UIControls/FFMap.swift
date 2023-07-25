//
//  FFMap.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/25.
//
//  SwiftUI的Map可以与其他控件一起使用，并控制是否向用户显示、注释信息等

import SwiftUI
import MapKit

struct FFMap: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    var body: some View {
        //通过MKCoordinateRegion创建经纬度
        
//        Map {
//            MapContentBuilder($region)
//        }
        //TODO:
        Map(coordinateRegion: $region)
            .frame(width: 400, height: 300)
    }
}

#Preview {
    FFMap()
}
