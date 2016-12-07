//
//  myLocationItems1ViewController.swift
//  SOS動画メール一斉送信app
//
//  Created by 小野山　隆 on 2016/12/07.
//  Copyright © 2016年 Takashi Onoyama. All rights reserved.
//

import UIKit
import CoreLocation

// CLLocationManagerDelegateを継承
class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var lm:CLLocationManager
    var longitude: CLLocationDegrees
    var latitude: CLLocationDegrees
    
    // storyboardで関連づけるLabel
//    @IBOutlet var latlonLabel: UILabel!
//    @IBOutlet var addressLabel: UILabel!
    
//    var gpsAddress = var address
    
    // CLLocationManagerDelegateを継承すると、init()が必要になる
    required init(coder aDecoder: NSCoder) {
        lm = CLLocationManager()
        longitude = CLLocationDegrees()
        latitude = CLLocationDegrees()
        super.init(coder: aDecoder)!
    }
    
    // ボタンが押された時の処理（storyboardで関連づける）
    @IBAction func btnGetLocation(sender: AnyObject) {
        // get latitude and longitude
        lm.startUpdatingLocation()
    }
    
    // 画面表示後の処理
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lm = CLLocationManager()
        lm.delegate = self
        
        // セキュリティ認証のステータスを取得
        let status = CLLocationManager.authorizationStatus()
        
        // まだ認証が得られていない場合は、認証ダイアログを表示
        if status == CLAuthorizationStatus.notDetermined {
            print("didChangeAuthorizationStatus:\(status)")
//            labelGps = "GPS認証されてません"
            
        // まだ承認が得られていない場合は、認証ダイアログを表示
            self.lm.requestAlwaysAuthorization()
        }else{
//            labelGps = "認証済み"
        }
        
        // 取得精度の設定
        lm.desiredAccuracy = kCLLocationAccuracyBest
        // 取得頻度の設定
        lm.distanceFilter = 100
    }
    
    // 位置情報取得成功時
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations[0].coordinate.longitude)
        print(locations[0].coordinate.latitude)
        
        longitude = locations[0].coordinate.longitude
        latitude = locations[0].coordinate.latitude
//        self.latlonLabel.text = "\(longitude), \(latitude)"
        
        // get address
        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placemarks, error)->Void in
            if error != nil {
                print("Reverse geocoder failed with error" + (error?.localizedDescription)!)
                return
            }
            if (placemarks?.count)! > 0 {
                let pm = (placemarks?[0])! as CLPlacemark
                self.displayLocationInfo(placemark: pm)
                //stop updating location to save battery life
                self.lm.stopUpdatingLocation()
            } else {
                print("Problem with the data received from geocoder")
            }
        })
        
    }
    
    // 位置情報表示
    func displayLocationInfo(placemark: CLPlacemark) {
        var address: String = ""
        address = placemark.locality != nil ? placemark.locality! : ""
        address += ","
        address += placemark.postalCode != nil ? placemark.postalCode! : ""
        address += ","
        address += placemark.administrativeArea != nil ? placemark.administrativeArea! : ""
        address += ","
        address += placemark.country != nil ? placemark.country! : ""
//        self.gpsAddress = address
    }
    
    // 位置情報取得失敗時
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        NSLog("Error while updating location. " + error.localizedDescription)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
