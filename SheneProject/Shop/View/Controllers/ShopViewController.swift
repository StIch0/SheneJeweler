//
//  ShopViewController.swift
//  SheneProject
//
//  Created by pavelburdukovskii on 20/08/2018.
//  Copyright © 2018 pavelburdukovskii. All rights reserved.
//

import Foundation
import GoogleMaps
import UIKit
class ShopViewController : UIViewController {
    var mapView : GMSMapView!
    var markerLocation : CLLocationCoordinate2D = CLLocationCoordinate2D()
    let apiKey  : String = "AIzaSyBu1s1WyxnVMxofslu0CPwci7_Ojnj5LIY"
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var zoomLevel: Float = 15.0
    var marker : GMSMarker!
    let cellId = "shopCell"
    var data = [ShopModel]()
    var viewModel = ShopViewModel()
    var nearestLocation : CLLocation?
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var findButton : UIButton!
    var coordinates : [CLLocation] = Array()

    override func viewDidLoad() {
        super.viewDidLoad()
        GMSServices.provideAPIKey(apiKey)
        let camera = GMSCameraPosition.camera(withTarget: .init(), zoom: zoomLevel)
        mapView = GMSMapView.map(withFrame: CGRect.init(x: 0, y: 0, width: view.frame.width,height:view.frame.height/2-findButton.frame.height), camera: camera)
        view.addSubview(mapView)
            //mapView.delegate = self
        locationManager.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib.init(nibName: "ShopCell", bundle: nil), forCellReuseIdentifier: cellId)
        loadData()

        
        

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 50
        locationManager.requestAlwaysAuthorization()
        
        mapView.addObserver(self, forKeyPath: "myLocation", options: .new, context: nil)
        DispatchQueue.main.async {
            self.mapView.isMyLocationEnabled = true
        }
        
        mapView.settings.myLocationButton = true
    }
    private func loadData(){
        printDebug("loadData")
        self.viewModel.getShops(api: APISelected.shops.rawValue, parameters: [:], headres: [:]){
            printDebug("address = \(self.viewModel.shopList.first?.address)")
            self.data = self.viewModel.shopList
            self.tableView.reloadData()
        }
    }
    @IBAction func findMyself(_ sender: UIButton) {
        //printDebug("findMyself \(currentLocation)")
        if let currentLoc = currentLocation {
            print("currentLoc = \(currentLoc)")
            transformToMarkerPosition(myLocation: currentLoc)
        }
        locationManager.startUpdatingLocation()
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if change![NSKeyValueChangeKey.oldKey] == nil {
            let location = change![NSKeyValueChangeKey.newKey] as! CLLocation
            mapView.camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude, longitude: location.coordinate.longitude, zoom: zoomLevel)
            print("My location = \(location.coordinate)")
            currentLocation = location
            if let currentLoc = currentLocation {
                print("currentLoc = \(currentLoc)")
                transformToMarkerPosition(myLocation: currentLoc)
            }
            //            takeLocation(currentLocation)
        }
        
    }
    
    func transformToMarkerPosition(myLocation : CLLocation){
        printDebug(coordinates.count)
        nearestLocation = coordinates.min(by:
            { $0.distance(from: myLocation) < $1.distance(from: myLocation)})
        marker = GMSMarker()
        guard let unOpNearestLocation = nearestLocation else { return  }
        marker.position = unOpNearestLocation.coordinate
        marker.map = mapView
        mapView.camera = GMSCameraPosition.camera(withTarget: marker.position, zoom: zoomLevel)
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        mapView.removeObserver(self, forKeyPath: "myLocation")
    }
}
