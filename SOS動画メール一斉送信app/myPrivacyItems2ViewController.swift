//
//  myPrivacyItems2ViewController.swift
//  SOS動画メール一斉送信app
//
//  Created by 小野山　隆 on 2016/12/04.
//  Copyright © 2016年 Takashi Onoyama. All rights reserved.
//

import UIKit

class myPrivacyItems2ViewController: UIViewController ,UIPickerViewDataSource,UIPickerViewDelegate{
    
    @IBOutlet weak var myLabel: UILabel!

    @IBOutlet weak var myTextField: UITextField!
    
    @IBOutlet weak var myPickerView1: UIPickerView!
    //データを配列で用意する
    var genderList = ["A型","B型","O型","AB型"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myPickerView1.dataSource = self
        myPickerView1.delegate = self
        
    }
    
    //ピッカービューの列数
    func numberOfComponents(in pickerView:UIPickerView) -> Int {return 1
    }
    //ピッカービューの行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {return 4
    }
    //ピッカービューに表示する文字のセット
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genderList[row]
    }
    
    //ピッカービューで選択されたときに行う作業
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var mySelectedDate = genderList[row]
        self.myTextField.text = mySelectedDate as String

     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //2.保存されたデーターを呼び出して表示
        //ユーザーデフォルトを用意する
        let myDefault = UserDefaults.standard
        
        //データーを読み出して
        let myStrGender = myDefault.string(forKey:"myPrivacyGender")
        //文字列が入っていたら表示する
        if let tmpStr1 = myStrGender {
            myTextField.text = tmpStr1
        }
    }
    
    @IBAction func tapTextField(_ sender: UITextField) {
        
        //1.ユーザーデフォルトに保存
        //ユーザーデフォルトを用意
        let myDefault = UserDefaults.standard
        
        //データーを書き込んで
        myDefault.set(myTextField.text,forKey:"myPrivacyGender")
        
        //即反映させる(奥にしまう作業）
        myDefault.synchronize()
    }
    
    @IBAction func tapFinished(_ sender: UIButton) {
        
        let myDefault = UserDefaults.standard
        
        //データーを書き込んで
        myDefault.set(myTextField.text,forKey:"myPrivacyGender")
        
        //即反映させる(奥にしまう作業）
        myDefault.synchronize()
        
        //Segue(show)1つ前の画面に戻る
        self.navigationController?.popViewController(animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

