//
//  myMailItems1ViewController.swift
//  SOS動画メール一斉送信app
//
//  Created by 小野山　隆 on 2016/11/24.
//  Copyright © 2016年 Takashi Onoyama. All rights reserved.
//

import UIKit

class myMailItems1ViewController: UIViewController {

    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var mailTextField1: UITextField!
    @IBOutlet weak var mailTextField2: UITextField!
    @IBOutlet weak var mailTextField3: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func mailTextField1(_ sender: AnyObject) {
        var mailTeFi1 = mailTextField1.text
    }
    @IBAction func mailTextField2(_ sender: AnyObject) {
         var mailTeFi2 = mailTextField2.text
    }
    @IBAction func mailTextField3(_ sender: AnyObject) {
        var mailTeFi3 = mailTextField3.text

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
