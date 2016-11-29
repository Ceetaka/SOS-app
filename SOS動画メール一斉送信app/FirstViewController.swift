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

class FirstViewController: UIViewController,AVCaptureFileOutputRecordingDelegate {
    
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
    
    @IBAction func tapRecord(_ sender: AnyObject) {
        print("recording started")
        myLabel.text = "録画中"
        //        myLabel.text = "recording started"
        filePath = NSHomeDirectory() + "/Documents/test.mp4"
        let fileURL: URL = URL(fileURLWithPath: filePath)
        
        session.startRunning()
        fileOutput.startRecording(toOutputFileURL: fileURL, recordingDelegate: self)
    }
    @IBAction func tapStop(_ sender: AnyObject) {
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}


