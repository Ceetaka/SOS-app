//
//  userLicenseAgreementViewController.swift
//  SOS動画メール一斉送信app
//
//  Created by 小野山　隆 on 2016/12/14.
//  Copyright © 2016年 Takashi Onoyama. All rights reserved.
//

import UIKit

class userLicenseAgreementViewController: UIViewController {

    @IBOutlet weak var btnAgree: UIButton!
    @IBOutlet weak var btnDisagree: UIButton!
    
    var index:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if index == 1{
            let tabBarController: UITabBarController = self.storyboard?.instantiateViewController(withIdentifier: "userLicenseAgreementVC") as! UITabBarController
            self.present(tabBarController, animated: false, completion: nil)
            
        }
        }
    
    //画面が表示されるとき
    override func viewWillAppear(_ animated: Bool) {
        //2.保存されたデーターを呼び出して表示
        //ユーザーデフォルトを用意する
        let myDefault = UserDefaults.standard
        
        //データーを読み出して
        let myStr = myDefault.set(index,forKey: "useLicenseAgreement")
//        //文字列が入っていたら表示する
//        if let tmpStr1 = myStr4 {
//            kenmeiTextField.text = tmpStr1
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onClickMyButton(sender: UIButton){
        // 遷移するViewを定義する.このas!はswift1.2では as?だったかと。
        let tabBarController: UITabBarController = self.storyboard?.instantiateViewController(withIdentifier: "userLicenseAgreementVC") as! UITabBarController
        self.present(tabBarController, animated: false, completion: nil)
        
        index = 1
        
        //1.ユーザーデフォルトに保存
        //ユーザーデフォルトを用意
        let myDefault = UserDefaults.standard
        
        //データーを書き込んで
        myDefault.set(index,forKey: "useLicenseAgreement")
        
        //即反映させる(奥にしまう作業）
        myDefault.synchronize()
    }

    }



