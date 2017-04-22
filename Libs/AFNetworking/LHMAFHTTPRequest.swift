//
//  LHMAFHTTPRequest.swift
//  test
//
//  Created by qianfeng on 16/9/27.
//  Copyright © 2016年 李慧珉. All rights reserved.
//

import UIKit

class LHMAFHTTPRequest: NSObject {
    
    //闭包
    //1.声明  2.实现  3.调用
    
    //两个参数之间跟逗号
    //MARK: GET方法
    class  func GET(success suc: @escaping (_ data: Data) -> Void,  fail fa: @escaping (_ reason: String) -> Void,   urlString: String) {
        
        
        let manager = AFHTTPSessionManager()
        //关闭自动解析
        manager.responseSerializer = AFHTTPResponseSerializer()
        
        manager.get(urlString, parameters: nil, progress: nil, success: { (task, data) in
            suc(data as! Data)
        }) { (task, error) in
            fa(error.localizedDescription)
        }
    }
    
    
    
    
    //MARK: POST方法
    class func POST(success suc:@escaping (_ data: Data) -> Void ,fail fa:@escaping (_ reason: String) -> Void,    urlString: String, dict: AnyObject) {
        
        
        let manager = AFHTTPSessionManager()
        //关闭自动格式解析
        manager.responseSerializer = AFHTTPResponseSerializer()
        
        manager.post(urlString, parameters: dict, progress: nil, success: { (task, data) in
            //通过闭包传值
            suc(data as! Data)
        }) { (task, error) in
            fa(error.localizedDescription)
        }
        
           }
    
    
    
}
