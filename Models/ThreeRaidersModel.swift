//
//  ThreeRaidersModel.swift
//  lvxing
//
//  Created by qianfeng on 2016/10/13.
//  Copyright © 2016年 李慧珉. All rights reserved.
//

import UIKit

class ThreeRaidersModel: NSObject {
    //MARK:_地点名称
    var _name:[String] = []
    //地点名称的拼音
    var _name_ens:[String] = []
    //景点图片
    var  _photo_url:[String] =  []
    
    
    var titlename:String?
    var button_text:String?
    
       override func setValue(_ value: Any?, forUndefinedKey key: String) {
        if key == "destinations" {
            let object = value as! NSArray
            for i in object {
                let dic = i as! NSDictionary
                let name = dic.object(forKey: "name") as! String
                self._name.append(name)
                
                let name_ens = dic.object(forKey: "name_en") as! String
                self._name_ens.append(name_ens)
                let photo = dic.object(forKey: "photo_url") as! String
                self._photo_url.append(photo)
                
            }
           
        }
    }

}
