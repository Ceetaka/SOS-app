//
//  SecondViewController.swift
//  SOS動画メール一斉送信app
//
//  Created by 小野山　隆 on 2016/11/17.
//  Copyright © 2016年 Takashi Onoyama. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var myTableView: UITableView!
    
    // Tableで使用する配列を定義する.
    let myMailItems: NSArray = ["送信先", "件名", "メール文"]
    let myPrivacyItems: NSArray = ["氏名", "血液型", "生年月日","住所", "携帯電話番号"]
    let myLocationItems: NSArray = ["GPS/on,off","AppleID(任意)"]
    
    // Sectionで使用する配列を定義する.
    let mySections: NSArray = ["メール内容", "個人情報","位置情報"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //完了ボタンタップ後入力内容を即反映させる
    override func viewWillAppear(_ animated: Bool) {
        myTableView.reloadData()
    }
    
    //行数を決定
    //func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     //   return mySections.count
    //}
    //表示するデータの中身
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var cellIndex = indexPath.row
        if indexPath.section == 1 {
            cellIndex = (indexPath.row) + 3
        }else if indexPath.section == 2{
            cellIndex = (indexPath.row) + 8
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell" + String(cellIndex), for: indexPath) as! myTableViewCell

//        var myLab1 = cell.viewWithTag(1) as! UILabel
//        
//        var myLab2 = cell.viewWithTag(2) as! UILabel
        
            //2.保存されたデーターを呼び出して表示
            //ユーザーデフォルトを用意する
            let myDefault = UserDefaults.standard
            
            //データーを読み出して
            let myStr1 = myDefault.string(forKey:"MailAddress1")
            let myStr2 = myDefault.string(forKey:"MailAddress2")
            let myStr3 = myDefault.string(forKey:"MailAddress3")
            let myStr4 = myDefault.string(forKey:"MailKenmei1")
            let myStr5 = myDefault.string(forKey:"MailContent")
            let myStrName = myDefault.string(forKey:"myPrivacyItems1")

            let myStrBirth = myDefault.string(forKey:"myPrivacyBirth")
            let myStrAdd = myDefault.string(forKey:"myPrivacyAddress")
            let myStrPhone1 = myDefault.string(forKey:"phoneNumber1")
            let myStrPhone2 = myDefault.string(forKey:"phoneNumber2")

        
        
        if indexPath.section == 0 {
            
            if indexPath.row == 0 {
                cell.myLab1.text = "\(myMailItems[indexPath.row])"
                cell.myLab2.text = myStr1
            }
            
            if indexPath.row == 1 {
                cell.myLab3.text = "\(myMailItems[indexPath.row])"
                cell.myLab4.text = myStr4
            }
            
            if indexPath.row == 2 {
                cell.myLab5.text = "\(myMailItems[indexPath.row])"
                cell.myLab6.text = myStr5
            }
        }
        if indexPath.section == 1 {
                
            if indexPath.row == 0 {
                cell.myLab7.text = "\(myPrivacyItems[indexPath.row])"
                cell.myLab8.text = myStrName
            }
                
            if indexPath.row == 1 {
                cell.myLab9.text = "\(myPrivacyItems[indexPath.row])"
                cell.myLab10.text = "bbb"
            }
                
            if indexPath.row == 2 {
                cell.myLab11.text = "\(myPrivacyItems[indexPath.row])"
                cell.myLab12.text = myStrBirth
            }

            if indexPath.row == 3 {
                cell.myLab13.text = "\(myPrivacyItems[indexPath.row])"
                cell.myLab14.text = myStrAdd
            }
            
            if indexPath.row == 4 {
                cell.myLab15.text = "\(myPrivacyItems[indexPath.row])"
                cell.myLab16.text = myStrPhone1
            }
        }
        if indexPath.section == 2 {
                
            if indexPath.row == 0 {
                cell.myLab17.text = "\(myLocationItems[indexPath.row])"
                cell.myLab18.text = "aaa"
            }
                
            if indexPath.row == 1 {
                cell.myLab19.text = "\(myLocationItems[indexPath.row])"
                cell.myLab20.text = "bbb"
            }
        }
            
//            cell.myLab + (numberLab1[indexPath.row]).text = "\(myMailItems[indexPath.row])"
//            cell.myLab + (numberLab2).text = "cetaka1973@gmail.com"
        
//        else if indexPath.section == 1 {
//            cell.myLab1.text = "\(myPrivacyItems[indexPath.row])"
//            cell.myLab2.text = ""
//        } else if indexPath.section == 2 {
//            cell.myLab1.text = "\(myLocationItems[indexPath.row])"
//            cell.myLab2.text = ""
//        }
        //矢印を右側につける
        cell.accessoryType = .disclosureIndicator
        
        
//        //accessoryViewを追加
//        if cell.accessoryView == nil {
//            cell.accessoryView = UISwitch()
//        }
        
        return cell
    }
    
//    //cellの高さを指定する
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        
//        if  (indexPath.section == 0 && indexPath.row == 2) {
//            return 80
//        }else{
//            return 30
//        }
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
     //セクションの数を返す.
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return mySections.count
    }
    
    
     //セクションのタイトルを返す.
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mySections[section] as? String
    }
    
    // Cellが選択された際に呼び出される.
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //プログラムでの画面遷移（上記Segueでの画面遷移指定してない場合の設定）
//        if indexPath.section == 0 && indexPath.row == 0 {
//            let targetViewController = self.storyboard!.instantiateViewController(withIdentifier: "myCell0")
//            self.present(targetViewController, animated: true, completion: nil)
//        }else if indexPath.section == 0 && indexPath.row == 1 {
//            let targetViewController = self.storyboard!.instantiateViewController(withIdentifier: "myCell1")
//            self.present(targetViewController, animated: true, completion: nil)
//        }else if indexPath.section == 0 && indexPath.row == 2 {
//            let targetViewController = self.storyboard!.instantiateViewController(withIdentifier: "myCell2")
//            self.present(targetViewController, animated: true, completion: nil)
//        }else if indexPath.section == 1 && indexPath.row == 0 {
//            let targetViewController = self.storyboard!.instantiateViewController(withIdentifier: "myCell3")
//            self.present(targetViewController, animated: true, completion: nil)
//        }else if indexPath.section == 1 && indexPath.row == 1 {
//            let targetViewController = self.storyboard!.instantiateViewController(withIdentifier: "myCell4")
//            self.present(targetViewController, animated: true, completion: nil)
//        }else if indexPath.section == 1 && indexPath.row == 2 {
//            let targetViewController = self.storyboard!.instantiateViewController(withIdentifier: "myCell5")
//            self.present(targetViewController, animated: true, completion: nil)
//        }else if indexPath.section == 1 && indexPath.row == 3 {
//            let targetViewController = self.storyboard!.instantiateViewController(withIdentifier: "myCell6")
//            self.present(targetViewController, animated: true, completion: nil)
//        }else if indexPath.section == 1 && indexPath.row == 4 {
//            let targetViewController = self.storyboard!.instantiateViewController(withIdentifier: "myCell7")
//            self.present(targetViewController, animated: true, completion: nil)
//        }else if indexPath.section == 2 && indexPath.row == 0 {
//            let targetViewController = self.storyboard!.instantiateViewController(withIdentifier: "myCell8")
//            self.present(targetViewController, animated: true, completion: nil)
//        }else if indexPath.section == 2 && indexPath.row == 1 {
//            let targetViewController = self.storyboard!.instantiateViewController(withIdentifier: "myCell9")
//            self.present(targetViewController, animated: true, completion: nil)
//        }


//        performSegue(withIdentifier: "showmyMailItems1",sender: nil)

    }
    
     //テーブルに表示する配列の総数を返す.（行数を決定）
    
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

    
    




