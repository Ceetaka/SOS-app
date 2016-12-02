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

    override func viewWillAppear(_ animated: Bool) {
    //2.保存されたデーターを呼び出して表示
    //ユーザーデフォルトを用意する
    let myDefault = UserDefaults.standard
        
    //データーを読み出して
    let myStr1 = myDefault.string(forKey:"MailAddress1")
    let myStr2 = myDefault.string(forKey:"MailAddress2")
    let myStr3 = myDefault.string(forKey:"MailAddress3")
    
    //文字列が入っていたら表示する
    if let tmpStr1 = myStr1 {
        mailTextField1.text = tmpStr1
    }
    if let tmpStr2 = myStr2 {
        mailTextField2.text = tmpStr2
    }
    if let tmpStr3 = myStr3 {
        mailTextField3.text = tmpStr3
    }
    }

    @IBAction func tapReturnKey1(_ sender: UITextField) {

    //1.ユーザーデフォルトに保存
    //ユーザーデフォルトを用意
    let myDefault = UserDefaults.standard
        
    //データーを書き込んで
    myDefault.set(mailTextField1.text,forKey:"MailAddress1")
    
    //即反映させる(奥にしまう作業）
    myDefault.synchronize()
    }

    @IBAction func tapReturnKey2(_ sender: UITextField) {
        
        let myDefault = UserDefaults.standard
        
        //データーを書き込んで
    myDefault.set(mailTextField2.text,forKey:"MailAddress2")
        
        //即反映させる(奥にしまう作業）
        myDefault.synchronize()
    }
    
    @IBAction func tapReturnKey3(_ sender: UITextField) {
        
        let myDefault = UserDefaults.standard
        
        //データーを書き込んで
    myDefault.set(mailTextField3.text,forKey:"MailAddress3")
        
        //即反映させる(奥にしまう作業）
        myDefault.synchronize()
    }
    
    @IBAction func tapFinished(_ sender: UIButton) {

        let myDefault = UserDefaults.standard
        
        //データーを書き込んで
    myDefault.set(mailTextField1.text,forKey:"MailAddress1")
    myDefault.set(mailTextField2.text,forKey:"MailAddress2")
    myDefault.set(mailTextField3.text,forKey:"MailAddress3")

        //即反映させる(奥にしまう作業）
        myDefault.synchronize()
        
        self.navigationController?.popViewController(animated: true)
        
    }

        
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
           }
    
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


