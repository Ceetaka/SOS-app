//
//  FirstViewController.swift
//  SOS動画メール一斉送信app
//
//  Created by 小野山　隆 on 2016/11/17.
//  Copyright © 2016年 Takashi Onoyama. All rights reserved.
//

import UIKit
import AVFoundation
import AssetsLibrary
import MessageUI
import CoreLocation

class FirstViewController: UIViewController,AVCaptureFileOutputRecordingDelegate, MFMailComposeViewControllerDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var myReview3: UITextView!
    
    var myStrMailAddress1 = ""
    var myStrMailAddress2 = ""
    var myStrMailAddress3 = ""
    var myStr4 = ""
    var myStr5 = ""
    var myStrName = ""
    var myStrGender = ""
    var myStrBirth = ""
    var myStrAdd = ""
    var myStrPhone1 = ""
    var myStrPhone2 = ""

    
    var session: AVCaptureSession!
    var videoDevice: AVCaptureDevice!
    var audioDevice: AVCaptureDevice!
    var videoInput: AVCaptureDeviceInput!
    var audioInput: AVCaptureDeviceInput!
    var fileOutput: AVCaptureMovieFileOutput!
    var filePath: String!
    
    
    var previewFlag: Bool = false;
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    @IBOutlet weak var myLabel: UILabel!
    
    @IBAction func tapRecord(_ sender: UIButton) {
        //    }
        //    @IBAction func tapRecord(_ sender: AnyObject) {
        print("recording started")
        myLabel.text = "録画中"
        //        myLabel.text = "recording started"
        filePath = NSHomeDirectory() + "/Documents/test.mp4"
        let fileURL: URL = URL(fileURLWithPath: filePath)
        
        session.startRunning()
        fileOutput.startRecording(toOutputFileURL: fileURL, recordingDelegate: self)
    }
    @IBAction func tapStop(_ sender: UIButton) {
        //    }
        //    @IBAction func tapStop(_ sender: AnyObject) {
        fileOutput.stopRecording()
        session.stopRunning()
        UISaveVideoAtPathToSavedPhotosAlbum(filePath, self, #selector(FirstViewController.video(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    @IBAction func tapPreview(_ sender: AnyObject) {
        if previewFlag {
            previewLayer.removeFromSuperlayer()
        } else {
            view.layer.insertSublayer(previewLayer,at:0)
        }
        previewFlag = !previewFlag
    }
    
    func capture(_ captureOutput: AVCaptureFileOutput, didFinishRecordingToOutputFileAt outputFile: URL, fromConnections connections: [Any]!,error: Error) {
        print("recording finished")
        myLabel.text = "録画終了"
        //        myLabel.text = "recording finished"
    }
    
    func video(_ videoPath: String, didFinishSavingWithError error: NSError!, contextInfo: UnsafeMutableRawPointer) {
        if (error != nil) {
            print("video saving fails")
            myLabel.text = "録画失敗"
            //            myLabel.text = "video saving fails"
        } else {
            print("video saving success")
            myLabel.text = "録画成功"
            //            myLabel.text = "video saving success"
        }
    }
    
    func prepareVideo() {
        session = AVCaptureSession()
        session.sessionPreset = AVCaptureSessionPresetHigh
        let devices = AVCaptureDevice.devices()
        for device in devices! {
            if ((device as AnyObject).position == AVCaptureDevicePosition.back) {
                videoDevice = device as! AVCaptureDevice
            }
        }
        audioDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeAudio)
        do {
            videoInput = try AVCaptureDeviceInput(device: videoDevice)
            if (session.canAddInput(videoInput)) {
                session.addInput(videoInput)
            } else {
                print("cannot add video input to session")
            }
            audioInput = try AVCaptureDeviceInput(device: audioDevice)
            if (session.canAddInput(audioInput)) {
                session.addInput(audioInput)
            } else {
                print("cannot add audio input to session")
            }
            fileOutput = AVCaptureMovieFileOutput()
            if (session.canAddOutput(fileOutput)) {
                session.addOutput(fileOutput)
            } else {
                print("cannot add file output to session")
            }
            
            // preview background
            previewLayer = AVCaptureVideoPreviewLayer(session: session)!
            previewLayer.frame = view.bounds
            previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
            
        } catch let error as NSError {
            print("cannot use camera \(error)")
        }
    }
    
    //GPS -CurrentAddress-
    
    var lm:CLLocationManager
    var longitude: CLLocationDegrees
    var latitude: CLLocationDegrees
    
    // storyboardで関連づけるLabel
    @IBOutlet var latlonLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    
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

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareVideo()
    }
    
    //画面が表示されるとき
    override func viewWillAppear(_ animated: Bool) {
    
        //2.保存されたデーターを呼び出して表示
        //ユーザーデフォルトを用意する
        let myDefault = UserDefaults.standard
        
        //データーを読み出して
//        myStrMailAddress1 = myDefault.string(forKey:"MailAddress1")!
//        myStrMailAddress2 = myDefault.string(forKey:"MailAddress2")!
//        myStrMailAddress3 = myDefault.string(forKey:"MailAddress3")!
//        myStr4 = myDefault.string(forKey:"MailKenmei1")!
//        myStr5 = myDefault.string(forKey:"MailContent")!
//        myStrName = myDefault.string(forKey:"myPrivacyItems1")!
//        myStrGender = myDefault.string(forKey:"myPrivacyGender")!
//        myStrBirth = myDefault.string(forKey:"myPrivacyBirth")!
//        myStrAdd = myDefault.string(forKey:"myPrivacyAddress")!
//        myStrPhone1 = myDefault.string(forKey:"phoneNumber1")!
//        myStrPhone2 = myDefault.string(forKey:"phoneNumber2")!
        
        if myDefault.string(forKey:"MailAddress1") != nil{
            myStrMailAddress1 = myDefault.string(forKey:"MailAddress1")!
        }
        if myDefault.string(forKey:"MailAddress2") != nil{
            myStrMailAddress2 = myDefault.string(forKey:"MailAddress2")!
        }
        if myDefault.string(forKey:"MailAddress3") != nil{
            myStrMailAddress3 = myDefault.string(forKey:"MailAddress3")!
        }
        if myDefault.string(forKey:"MailKenmei1") != nil{
            myStr4 = myDefault.string(forKey:"MailKenmei1")!
        }
        if myDefault.string(forKey:"MailContent") != nil{
            myStr5 = myDefault.string(forKey:"MailContent")!
        }
        if myDefault.string(forKey:"myPrivacyItems1") != nil{
            myStrName = myDefault.string(forKey:"myPrivacyItems1")!
        }
        if myDefault.string(forKey:"myPrivacyGender") != nil{
            myStrGender = myDefault.string(forKey:"myPrivacyGender")!
        }
        if myDefault.string(forKey:"myPrivacyBirth") != nil{
            myStrBirth = myDefault.string(forKey:"myPrivacyBirth")!
        }
        if myDefault.string(forKey:"myPrivacyAddress") != nil{
            myStrAdd = myDefault.string(forKey:"myPrivacyAddress")!
        }
        if myDefault.string(forKey:"phoneNumber1") != nil{
            myStrPhone1 = myDefault.string(forKey:"phoneNumber1")!
        }
        if myDefault.string(forKey:"phoneNumber2") != nil{
            myStrPhone2 = myDefault.string(forKey:"phoneNumber2")!
        }
    }
    
    //sampleSendEmail
    @IBAction func tapBtn(_ sender: UIButton) {
        
        // check if can send an email
        if MFMailComposeViewController.canSendMail() == false {
            print("Email Send Failed")
            return
        }
        
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
        
        // Configure the fields of the interface.
        composeVC.setToRecipients(["\(myStrMailAddress1)","\(myStrMailAddress2)","\(myStrMailAddress3)"])
        composeVC.setSubject("\(myStr4)")
        composeVC.setMessageBody("\(myStr5)\n氏名　\(myStrName)\n血液型　\(myStrGender)\n生年月日　\(myStrBirth)\n住所　\(myStrAdd)\n携帯電話番号　\(myStrPhone1)\n電話番号　\(myStrPhone2)", isHTML: false)
        
        // パスからassetを生成.
        let path = Bundle.main.path(forResource: "sample", ofType: "MOV")
        let avAsset = NSData(contentsOfFile: path!)
        
        composeVC.addAttachmentData(avAsset as! Data, mimeType: "video/quicktime", fileName: "testmovie")
        
        // Present the view controller modally.
        self.present(composeVC, animated: true, completion: nil)
    }
    
    
//    //GPS -CurrentAddress-
//    
//        lm = CLLocationManager()
//        lm.delegate = self
//    
//    // セキュリティ認証のステータスを取得
//        let status = CLLocationManager.authorizationStatus()
//    
//    // まだ認証が得られていない場合は、認証ダイアログを表示
//        if status == CLAuthorizationStatus.notDetermined {
//        print("didChangeAuthorizationStatus:\(status)")
//    // まだ承認が得られていない場合は、認証ダイアログを表示
//        self.lm.requestAlwaysAuthorization()
//    }
//    
//    // 取得精度の設定
//        lm.desiredAccuracy = kCLLocationAccuracyBest
//    // 取得頻度の設定
//        lm.distanceFilter = 100
//    }
//
//    // 位置情報取得成功時
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        print(locations[0].coordinate.longitude)
//        print(locations[0].coordinate.latitude)
//    
//        longitude = locations[0].coordinate.longitude
//        latitude = locations[0].coordinate.latitude
//        self.latlonLabel.text = "\(longitude), \(latitude)"
//    
//    // get address
//    CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placemarks, error)->Void in
//        if error != nil {
//            print("Reverse geocoder failed with error" + (error?.localizedDescription)!)
//            return
//        }
//        if (placemarks?.count)! > 0 {
//            let pm = (placemarks?[0])! as CLPlacemark
//            self.displayLocationInfo(placemark: pm)
//            //stop updating location to save battery life
//            self.lm.stopUpdatingLocation()
//        } else {
//            print("Problem with the data received from geocoder")
//        }
//    })
//    
//    }
//
//    // 位置情報表示
//    func displayLocationInfo(placemark: CLPlacemark) {
//        var address: String = ""
//            address = placemark.locality != nil ? placemark.locality! : ""
//            address += ","
//            address += placemark.postalCode != nil ? placemark.postalCode! : ""
//            address += ","
//            address += placemark.administrativeArea != nil ? placemark.administrativeArea! : ""
//            address += ","
//            address += placemark.country != nil ? placemark.country! : ""
//            self.addressLabel.text = address
//    }
//
//    // 位置情報取得失敗時
//    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
//        NSLog("Error while updating location. " + error.localizedDescription)
//    }
//
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}


