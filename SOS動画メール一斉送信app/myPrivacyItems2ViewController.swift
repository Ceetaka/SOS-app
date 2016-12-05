//
//  myPrivacyItems2ViewController.swift
//  SOS動画メール一斉送信app
//
//  Created by 小野山　隆 on 2016/12/04.
//  Copyright © 2016年 Takashi Onoyama. All rights reserved.
//

import UIKit

class myPrivacyItems2ViewController: UIViewController {

    var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        myButton = UIButton()
        myButton.frame = CGRectMake(0,100,200,40)
        myButton.addTarget(self, action: Selector("onClickMyButton:"), for: .touchUpInside)
        // ボタンに画像セット
        myButton.setImage(UIImage(named: "check.png"), for: UIControlState.selected)
        myButton.setImage(UIImage(named: "nocheck.png"), for: UIControlState.normal)
        
        self.view.addSubview(myButton)
    }
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }

    
    
    internal func onClickMyButton(sender: UIButton){
        myButton.isSelected = !myButton.isSelected
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
