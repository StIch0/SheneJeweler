//
//  Shop+LocationManager.swift
//  SheneProject
//
//  Created by pavelburdukovskii on 20/08/2018.
//  Copyright © 2018 pavelburdukovskii. All rights reserved.
//

import Foundation
import GoogleMaps
extension ShopViewController:CLLocationManagerDelegate {
    //get current position
    //    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    //        let location: CLLocation = locations.last!
    //        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude,
    //                                              longitude: location.coordinate.longitude,
    //                                              zoom: zoomLevel)
    //        if mapView.isHidden {
    //            mapView.isHidden = false
    //            mapView.camera = camera
    //        } else {
    //            mapView.animate(to: camera)
    //        }
    //    }
    //allowed to get position
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .restricted:
            print("Доступ к местоположению ограничен")
        case .denied:
            print("Нет доступа к местоположению")
            mapView.isHidden = false
        case .notDetermined:
            print("Местоположение не определено")
        case .authorizedAlways: fallthrough
        case .authorizedWhenInUse:
            print("Доступ получен")
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationManager.stopUpdatingLocation()
        print("Error: \(error)")
    }
}
