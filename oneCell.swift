//
//  oneCell.swift
//  lvxing
//
//  Created by qianfeng on 2016/10/17.
//  Copyright © 2016年 李慧珉. All rights reserved.
//

import UIKit

class oneCell: UICollectionViewCell {

    //MARK:_轮播视图
    @IBOutlet weak var Img: UIImageView!
        var model=OneRaidersModel(){
        didSet{
            Img.sd_setImage(with: URL.init(string: model.photo_url!))
            }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
