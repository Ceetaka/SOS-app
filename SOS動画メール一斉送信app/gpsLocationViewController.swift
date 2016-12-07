//
//  gpsLocationViewController.swift
//  SOS動画メール一斉送信app
//
//  Created by 小野山　隆 on 2016/12/07.
//  Copyright © 2016年 Takashi Onoyama. All rights reserved.
//

import UIKit

class gpsLocationViewController: UIViewController {

    @IBOutlet weak var gamenKirikae: UILabel!
    @IBOutlet weak var videoStartStop: UILabel!    
    @IBOutlet weak var mailSousinLabel: UILabel!
    @IBOutlet weak var syokisettei: UILabel!
    @IBOutlet weak var gpsLabel1: UILabel!
    @IBOutlet weak var gpsLabel2: UILabel!
    
    @IBOutlet weak var gamenkirikaeLbel: UILabel!
    @IBOutlet weak var videoStartStopTextView: UITextView!
    @IBOutlet weak var mailSousin: UITextView!
    @IBOutlet weak var syokisetteiTextView: UITextView!
    @IBOutlet weak var gpsTextView1: UITextView!

    @IBOutlet weak var gpsTexView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapFinish(_ sender: UIButton) {

    //Segue(show)1つ前の画面に戻る
    self.navigationController?.popViewController(animated: true)
    
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
