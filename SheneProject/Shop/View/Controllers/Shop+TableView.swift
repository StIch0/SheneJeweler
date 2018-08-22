//
//  Shop+TableView.swift
//  SheneProject
//
//  Created by pavelburdukovskii on 20/08/2018.
//  Copyright © 2018 pavelburdukovskii. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps
extension ShopViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return viewModel.numberOfItem()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ShopCell
        cell.shopCellViewModel = self.viewModel.cellViewModel(at: indexPath.row)
        //cell.loadData(from: data[indexPath.row])
        guard   let lat = data[indexPath.row].lat,
                let lng = data[indexPath.row].lng,
                let fLat = data[0].lat,
                let fLng  = data[0].lng else { return UITableViewCell()}
    
         let coor = CLLocation(latitude: CLLocationDegrees.init(lat), longitude: CLLocationDegrees.init(lng))
        coordinates.append(coor)
        transformToMarkerPosition(myLocation: CLLocation(latitude: CLLocationDegrees.init(fLat), longitude: CLLocationDegrees.init(fLng)))
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mapView.clear()
        guard let lat =  data[indexPath.row].lat , let lng = data[indexPath.row].lng else { return }
        let coor = CLLocation(latitude: CLLocationDegrees.init(lat), longitude: CLLocationDegrees.init(lng))
        marker = GMSMarker(position: coor.coordinate)
        marker.map = mapView
        mapView.camera = GMSCameraPosition.camera(withTarget: marker.position, zoom: zoomLevel)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
