//
//  TwoRaidersModel.swift
//  lvxing
//
//  Created by qianfeng on 2016/10/14.
//  Copyright © 2016年 李慧珉. All rights reserved.
//

import UIKit

class TwoRaidersModel: NSObject {

    //地点名称
    var  name:String?
    //距离的距离
    var  visit_tip:String?
    //图片展示
    var photo_url:String?
    
   
    //展示数据不完全时，用此方法
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
}
