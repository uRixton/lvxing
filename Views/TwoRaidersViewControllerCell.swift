//
//  TwoRaidersViewControllerCell.swift
//  lvxing
//
//  Created by qianfeng on 2016/10/14.
//  Copyright © 2016年 李慧珉. All rights reserved.
//

import UIKit

class TwoRaidersViewControllerCell: UICollectionViewCell {

    @IBOutlet weak var TwoRaidersImg: UIImageView!
    
    @IBOutlet weak var TwoRaidersAddressLb: UILabel!
    
    @IBOutlet weak var TwoRadiersDistanceLb: UILabel!
    
    var model=TwoRaidersModel(){
        didSet{
            TwoRaidersImg.sd_setImage(with: URL.init(string: model.photo_url!))
            TwoRaidersAddressLb.text=model.name
            TwoRadiersDistanceLb.text=model.visit_tip
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
