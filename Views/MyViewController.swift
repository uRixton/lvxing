//
//  MyViewController.swift
//  lvxing
//
//  Created by qianfeng on 2016/10/14.
//  Copyright © 2016年 李慧珉. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    
    @IBOutlet weak var MyViewControllerTb: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
//
//        //MARK:_创建文字数组
//
//        //MARK:_创建Bar数组
//        MyViewControllerTb.dataSource=self
//        MyViewControllerTb.delegate=self
//        
//    //注册自定制cell
//    let nib=UINib(nibName: "MyTableViewCell", bundle: nil)
//    MyViewControllerTb.register(nib, forCellReuseIdentifier: "MyTableViewCell")
//    }
//
//        //MARK:_返回行数
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 5
//    }
//    //MARK:_返回行对象
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        //创建自定制MyTableViewCell样式
//        let cell=tableView.dequeueReusableCell(withIdentifier: "MyTabViewCell")as!MyTableViewCell
//        return cell
//        
//    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 80
//    }
//    
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
