
//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by yukun on 2017/10/23.
//  Copyright © 2017年 SouthWest University-yukun. All rights reserved.
//

import UIKit
import MapKit

class MapViewController:UIViewController{
    var mapView:MKMapView!//隐式可选类型,class中的stored property必须有初始值，或者是可选类型
    override func loadView() {
        //创建一个地图视图
        mapView = MKMapView()
        view = mapView
        
        let segmentedControl = UISegmentedControl(items: ["standard","Hybrid","Satellite"])
        
//        segmentedControl.backgroundColor = UIColor
    }
    override func viewDidLoad() {
        print("MapViewController loaded its view.")
    }
}
