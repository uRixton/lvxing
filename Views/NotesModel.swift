//
//  NotesModel.swift
//  lvxing
//
//  Created by qianfeng on 2016/10/14.
//  Copyright © 2016年 李慧珉. All rights reserved.
//

import UIKit

class NotesModel: NSObject {
    
    //MARK:_显示的大图
    var  photo_url:String?
    var  name:String?
    var  Description:String?
    var  topic:String?
    
    //展示数据不完全时，用此方法
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
}
