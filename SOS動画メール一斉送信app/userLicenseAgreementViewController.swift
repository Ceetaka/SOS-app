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
    
    //初回起動判定
    let ud = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        if ud.bool(forKey: "firstLaunch") {
            
            // 初回起動時の処理
//        func onClickBtnAgree(sender: UIButton){
//            let storyboard: UIStoryboard = self.storyboard!
//            let nextView = storyboard.instantiateViewController(withIdentifier: "userLicenseAgreementVC") as! UITabBarController
//            self.present(nextView, animated: true, completion: nil)
//
            
        // 2回目以降の起動では「firstLaunch」のkeyをfalseに
        ud.set(false, forKey: "firstLaunch")
        ud.synchronize()
        }
        else{
            let tabBarController: UITabBarController = self.storyboard?.instantiateViewController(withIdentifier: "userLicenseAgreementVC") as! UITabBarController
                // Viewの移動する.
            self.navigationController?.pushViewController(tabBarController, animated: false)
    
        }
    }
    
    @IBAction func btnAgree(_ sender: UIButton) {
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "userLicenseAgreementVC") as! UITabBarController
        self.present(nextView, animated: true, completion: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    }



