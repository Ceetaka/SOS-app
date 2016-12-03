//
//  myPrivacyItems4ViewController.swift
//  SOS動画メール一斉送信app
//
//  Created by 小野山　隆 on 2016/12/03.
//  Copyright © 2016年 Takashi Onoyama. All rights reserved.
//

import UIKit

class myPrivacyItems4ViewController: UIViewController {

    @IBOutlet weak var addressTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //2.保存されたデーターを呼び出して表示
        //ユーザーデフォルトを用意する
        let myDefault = UserDefaults.standard
        
        //データーを読み出して
        let myStrAdd = myDefault.string(forKey:"myPrivacyAddress")
        //文字列が入っていたら表示する
        if let tmpStr1 = myStrAdd {
            addressTextField.text = tmpStr1
        }
    }
    
    @IBAction func tapReturn(_ sender: UITextField) {
        
        //1.ユーザーデフォルトに保存
        //ユーザーデフォルトを用意
        let myDefault = UserDefaults.standard
        
        //データーを書き込んで
        myDefault.set(addressTextField.text,forKey:"myPrivacyAddress")
        
        //即反映させる(奥にしまう作業）
        myDefault.synchronize()
    }
    
    @IBAction func tapFinished(_ sender: UIButton) {
        
        let myDefault = UserDefaults.standard
        
        //データーを書き込んで
        myDefault.set(addressTextField.text,forKey:"myPrivacyAddress")
        
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
