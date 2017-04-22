//
//  LHMAFHTTPSessionManager.swift
//  test
//
//  Created by qianfeng on 16/9/27.
//  Copyright © 2016年 李慧珉. All rights reserved.
//

import UIKit

class LHMAFHTTPSessionManager: NSObject {
    class func UploadImage(success suc:@escaping (_ data: Data) ->Void, fail fa:@escaping (_ reason: String) -> Void, urlString: String, MyImage: UIImage){
        
        //当选中图片后，通过AFNetworking的POST方式实现头像的上传
        //1.定义接口
        //2.创建AFN的会话管理器
        let manager = AFHTTPSessionManager()
        //3.关闭自动解析功能
        manager.responseSerializer = AFHTTPResponseSerializer()
        
        let dict = ["m_auth":UserDefaults.standard.object(forKey: "token") as! String]
        
        //4.上传图片数据
        manager.post(urlString, parameters: dict, constructingBodyWith: { (formData) in
            
            //第一个参数填写准备上传给服务器的图像的二进制数据
            let data = UIImagePNGRepresentation(MyImage)
            //第二个参数填写服务器需要的参数名
            //第三个参数填写图像被上传到服务器上的文件的名称（没有实质作用）
            //第四个参数填写图片的类型
            
            //填写准备上传的图片的数据
            formData.appendPart(withFileData: data!, name: "headimage", fileName: "a.png", mimeType: "image/png")
            }, progress: nil, success: { (task, data) in
                
                //当上传图像成功时，调用该闭包
                //                print(data!)
                
                suc(data as! Data)
                
        }) { (task, error) in
            //上传失败时，调用
            
            fa(error.localizedDescription)
        }
        
        
        
    }
}
