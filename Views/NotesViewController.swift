//
//  NotesViewController.swift
//  lvxing
//
//  Created by qianfeng on 2016/10/14.
//  Copyright © 2016年 李慧珉. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet weak var NotesTableView: UITableView!
    
    
    
    //MARK:_创建Notes源数组
    var NotesArray=[NotesModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.reloadData()
        registerNotesTableCell()
        //registerHeaderFooter()
        
        //MARK:_关闭滚动条
        NotesTableView.showsVerticalScrollIndicator=false
        NotesTableView.showsHorizontalScrollIndicator=false
        
    }
    
    // 加载数据
    func reloadData() {
        //MARK:_代理回调
        NotesTableView.dataSource=self
        NotesTableView.delegate=self
        
        //MARK:_数据请求
        let urlString="http://q.chanyouji.com/api/v1/timelines.json?page=1"
        LHMAFHTTPRequest.GET(success: { (data) in
            
            let obj=try!JSONSerialization.jsonObject(with: data, options: .allowFragments)
            let rootArray = (obj as AnyObject).object(forKey: "data") as! NSArray
            for NotesDict in rootArray {
                
                let model = NotesModel()
                let activityDic = (NotesDict as AnyObject).object(forKey: "activity") as! NSDictionary
                let descriptionStr = activityDic.object(forKey: "description") as! String
                
                let topicStr = activityDic.object(forKey: "topic") as! String
                model.Description = descriptionStr
                model.topic = topicStr
                self.NotesArray.append(model)
                
                

                let contentsArr=(activityDic as AnyObject).object(forKey: "contents")as!NSArray
                
                var flag = 0
                for activityDic in contentsArr{
                    let model=NotesModel()
                    
                    if flag == 0 {
                        //第一张图片
                        let photoStr=(activityDic as AnyObject).object(forKey: "photo_url")as!String
                        model.photo_url=photoStr
                        self.NotesArray.append(model)
                        
                    } else {
                    
                   let  photoStr=(activityDic as AnyObject).object(forKey: "photo_url")as!String
                    model.photo_url=photoStr
                    self.NotesArray.append(model)
                    }
                    flag += 1
                }
            }
            self.NotesTableView.reloadData()
            },fail:{(reason) in
                print(reason)
            },urlString: urlString)
        
    }
    //MARK:_注册自定制Cell
    func registerNotesTableCell(){
        let nib=UINib.init(nibName: "NotesTableViewCell", bundle: nil)
        NotesTableView.register(nib, forCellReuseIdentifier: "a")
    }
    //MARK:_遵守TableView协议
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return NotesArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "a")as! NotesTableViewCell
        cell.model=NotesArray[indexPath.row]
        return cell
    }
    
    //Mark:_设置行高
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  450
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:_设置段的个数
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.NotesArray.count
    }
    //MARK:_注册段头和段位
    func registerHeaderFooter(){
        let  header=UINib(nibName: "NotesHeaderReusable", bundle: nil)
        NotesTableView.register(header, forCellReuseIdentifier: "Header")
        
        let footer=UINib(nibName: "NotesFooterReusable", bundle: nil)
        NotesTableView.register(footer, forCellReuseIdentifier: "Footer")
    }
    //MARK:_设置段头的高度
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return (NotesArray.count) as!String
    }
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
     return (NotesArray.count) as!String
        
        
       // return self(NotesArray.count)as!String
    }
    
    
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
