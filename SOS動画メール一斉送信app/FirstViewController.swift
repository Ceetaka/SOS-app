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

class FirstViewController: UIViewController,AVCaptureFileOutputRecordingDelegate, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var myReview3: UITextView!
    
//    var myMailAdd1:String!
//    var myMailAdd2:String!
//    var myMailAdd3:String!
      var myMailKenmei:String?
    
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
        let myStrMailAddress1 = myDefault.string(forKey:"MailAddress1")
        let myStrMailAddress2 = myDefault.string(forKey:"MailAddress2")
        let myStrMailAddress3 = myDefault.string(forKey:"MailAddress3")
        let myStr4 = myDefault.string(forKey:"MailKenmei1")
        let myStr5 = myDefault.string(forKey:"MailContent")
        let myStrName = myDefault.string(forKey:"myPrivacyItems1")
        let myStrGender = myDefault.string(forKey:"myPrivacyGender")
        let myStrBirth = myDefault.string(forKey:"myPrivacyBirth")
        let myStrAdd = myDefault.string(forKey:"myPrivacyAddress")
        let myStrPhone1 = myDefault.string(forKey:"phoneNumber1")
        let myStrPhone2 = myDefault.string(forKey:"phoneNumber2")
        //文字列が入っていたら表示する
//        if let tmpStr1 = myStrMailAddress1 {
//            myMailAdd1 = tmpStr1
//        }
//        if let tmpStr2 = myStrMailAddress2 {
//            myMailAdd2 = tmpStr2
//        }
//        if let tmpStr3 = myStrMailAddress3 {
//            myMailAdd3 = tmpStr3
//        }
//        if let tmpStr4 = myStr4 {
//            myMailKenmei = tmpStr4
//        }
        myMailKenmei = myStr4
        
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
        composeVC.setToRecipients(["address@example.com","test@gmail.com"])
        composeVC.setSubject(myMailKenmei!)
        composeVC.setMessageBody("Hello from California!", isHTML: false)
        
        // パスからassetを生成.
        let path = Bundle.main.path(forResource: "sample", ofType: "MOV")
        let avAsset = NSData(contentsOfFile: path!)
        
        composeVC.addAttachmentData(avAsset as! Data, mimeType: "video/quicktime", fileName: "testmovie")
        
        // Present the view controller modally.
        self.present(composeVC, animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}


