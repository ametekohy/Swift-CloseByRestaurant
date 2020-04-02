//
//  ViewController.swift
//  CloseByRestaurant
//
//  Created by Arthur Metekohy on 02/02/2020.
//  Copyright © 2020 Arthur Metekohy. All rights reserved.
//

import UIKit
import UserNotifications
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager:CLLocationManager = CLLocationManager()
    
    // In this example the location used is Ruitenberglaan 26 in Arnhem.
    let restaurantLat = 51.9878277
    let restaurantLang = 5.9480078
    let restaurantName = "ICA HAN Arnhem"
    let closeByRadiusInMeters = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.distanceFilter = 100
        
        // Setup region
        let geoFenceRegion:CLCircularRegion = CLCircularRegion(center: CLLocationCoordinate2DMake(restaurantLat,restaurantLang), radius: CLLocationDistance(closeByRadiusInMeters), identifier: restaurantName)
        
        locationManager.startMonitoring(for: geoFenceRegion)
    }
    
    // If user entered the radius from the restaurant they will receive a Sale notification
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        sendNotification(reason: "Sale")
        print(region.identifier)
    }
    
    // If user not seduced with Sale and leaves the area we will send a Discount notification
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        sendNotification(reason: "Discount")
        print(region.identifier)
    }

    // Used for testing and displaying updated location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        for currentLocation in locations {
            print("\(String(describing: index)): \(currentLocation)")
        }
    }
    
    // Send local notification when app is not open
    func sendNotification(reason : String) {
        // Step 1: ask permission
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in

        }
        
       // Step 2: create notification
       let content = UNMutableNotificationContent()
       content.title = "From your favorite restaurant!"
       content.body = "Today only special " + reason + " at 'BASIC RESTAURANT' "
       
       // Step 3: create trigger
       let date = Date().addingTimeInterval(10)
       let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
       let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
       
       // Step 4: create request
       let uuidString = UUID().uuidString
       let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
       
       // Step 5: register request
       center.add(request) {
           (error) in
       }
    }
}

