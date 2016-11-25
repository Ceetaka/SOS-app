//
//  myTableViewCell.swift
//  SOS動画メール一斉送信app
//
//  Created by 小野山　隆 on 2016/11/26.
//  Copyright © 2016年 Takashi Onoyama. All rights reserved.
//

import UIKit

class myTableViewCell: UITableViewCell {

    @IBOutlet weak var myLabel1: UILabel!
   
    @IBOutlet weak var myLabel2: UILabel!
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
