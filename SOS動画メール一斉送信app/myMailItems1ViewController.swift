//
//  myMailItems1ViewController.swift
//  SOS動画メール一斉送信app
//
//  Created by 小野山　隆 on 2016/11/24.
//  Copyright © 2016年 Takashi Onoyama. All rights reserved.
//

import UIKit

class myMailItems1ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myTextField1: UITextField!
    @IBOutlet weak var myTextField2: UITextField!
    @IBOutlet weak var myTextField3: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func mailTextField1(_ sender: AnyObject) {
        var myTextF1 = myTextField1.text
        var myTextF2 = myTextField2.text
        var myTextF3 = myTextField3.text

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
