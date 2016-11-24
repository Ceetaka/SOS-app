//
//  SecondViewController.swift
//  SOS動画メール一斉送信app
//
//  Created by 小野山　隆 on 2016/11/17.
//  Copyright © 2016年 Takashi Onoyama. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
//    var sections = ["受取人", "件名", "メール文", "氏名", "性別", "住所", "年齢", "性別","GPS/on,off","AppleID(任意)"]
    
    // Tableで使用する配列を定義する.
    let myMailItems: NSArray = ["受取人", "件名", "メール文"]
    let myPrivacyItems: NSArray = ["氏名", "性別", "年齢","住所", "携帯電話番号"]
    let myLocationItems: NSArray = ["GPS/on,off","AppleID(任意)"]
    
    // Sectionで使用する配列を定義する.
    let mySections: NSArray = ["メール内容", "個人情報","位置情報"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //行数を決定
    //func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     //   return mySections.count
    //}
    //表示するデータの中身
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "myCell")
        //cell.textLabel?.text = sections[indexPath.row]
        if indexPath.section == 0 {
            cell.textLabel?.text = "\(myMailItems[indexPath.row])"
        } else if indexPath.section == 1 {
            cell.textLabel?.text = "\(myPrivacyItems[indexPath.row])"
        } else if indexPath.section == 2 {
            cell.textLabel?.text = "\(myLocationItems[indexPath.row])"
        }
        //矢印を右側につける
        cell.accessoryType = .disclosureIndicator
        

        return cell
    }
//    //選択されたとき行う処理
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("\((indexPath as! NSIndexPath).row)行目を選択")
//    }
    
    
////    //cellの高さを指定する
////    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
////        
////        if  (indexPath.section == 0 && indexPath.row == 2) {
////            return 80
////        }else{
////            return 30
////        }
//    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
     セクションの数を返す.
     */
    func numberOfSections(in tableView: UITableView) -> Int {
        return mySections.count
    }
    
    /*
     セクションのタイトルを返す.
     */
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mySections[section] as? String
    }
    
    /*
     Cellが選択された際に呼び出される.
     */
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.section == 0 {
            print("Value: \(myMailItems[indexPath.row])")
        } else if indexPath.section == 1 {
            print("Value: \(myPrivacyItems[indexPath.row])")
        } else if indexPath.section == 2 {
            print("Value: \(myLocationItems[indexPath.row])")
        }
    }
    
    /*
     テーブルに表示する配列の総数を返す.（行数を決定）
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return myMailItems.count
        } else if section == 1 {
            return myPrivacyItems.count
        } else if section == 2 {
            return myLocationItems.count
        } else {
            return 0
        }
    }



}

