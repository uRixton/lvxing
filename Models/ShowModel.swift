//
//  ShowModel.swift
//  lvxing
//
//  Created by qianfeng on 2016/10/21.
//  Copyright © 2016年 李慧珉. All rights reserved.
//

import UIKit

class ShowModel: NSObject {

    
    var _description:[String]=[]
    var _name:[String]=[]
    var _name_en:[String]=[]
    var _summary:[String]=[]
    var _visit_tip:[String]=[]
    var _photo_url:[String]=[]

     override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
        if  key=="models"{
            let object = value as! NSArray
            for i in object {
                let dic = i as! NSDictionary
                let description=dic.object(forKey: "description")as!String
                self._description.append(description)
                let name = dic.object(forKey: "name") as! String
                self._name.append(name)
                
                let name_ens = dic.object(forKey: "name_en") as! String
                self._name_en.append(name_ens)
                let summary=dic.object(forKey: "summary")as!String
                self._summary.append(summary)
                let visit_tip=dic.object(forKey: "visit_tip")as!String
                self._visit_tip.append(visit_tip)
                
                let photo=dic.object(forKey: "_photo_url")as!String
                self._photo_url.append(photo)
                
                
            }
            }
    }
}
