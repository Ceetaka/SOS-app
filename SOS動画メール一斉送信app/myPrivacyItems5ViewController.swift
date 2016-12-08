//
//  myPrivacyItems5ViewController.swift
//  SOS動画メール一斉送信app
//
//  Created by 小野山　隆 on 2016/12/04.
//  Copyright © 2016年 Takashi Onoyama. All rights reserved.
//

import UIKit

class myPrivacyItems5ViewController: UIViewController {


    @IBOutlet weak var phoneTextField1: UITextField!
    @IBOutlet weak var phoneTextField2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //2.保存されたデーターを呼び出して表示
        //ユーザーデフォルトを用意する
        let myDefault = UserDefaults.standard
        
        //データーを読み出して
        let myStrPhone1 = myDefault.string(forKey:"phoneNumber1")
        let myStrPhone2 = myDefault.string(forKey:"phoneNumber2")
        
        //文字列が入っていたら表示する
        if let tmpStr1 = myStrPhone1 {
            phoneTextField1.text = tmpStr1
        }
        if let tmpStr2 = myStrPhone2 {
            phoneTextField2.text = tmpStr2
        }
        }
    
    @IBAction func tapReturnKey1(_ sender: UITextField) {
        
        //1.ユーザーデフォルトに保存
        //ユーザーデフォルトを用意
        let myDefault = UserDefaults.standard
        
        //データーを書き込んで
        myDefault.set(phoneTextField1.text,forKey:"phoneNumber1")
        
        //即反映させる(奥にしまう作業）
        myDefault.synchronize()
    }
    
    @IBAction func tapReturnKey2(_ sender: UITextField) {
        
        let myDefault = UserDefaults.standard
        
        //データーを書き込んで
        myDefault.set(phoneTextField2.text,forKey:"phoneNumber2")
        
        //即反映させる(奥にしまう作業）
        myDefault.synchronize()
    }
    
    @IBAction func tapFinished(_ sender: UIButton) {
        
        let myDefault = UserDefaults.standard
        
        //データーを書き込んで
        myDefault.set(phoneTextField1.text,forKey:"phoneNumber1")
        myDefault.set(phoneTextField2.text,forKey:"phoneNumber2")
        
        //即反映させる(奥にしまう作業）
        myDefault.synchronize()
        
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
