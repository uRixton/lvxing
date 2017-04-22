//
//  ShowViewController.swift
//  lvxing
//
//  Created by qianfeng on 2016/10/21.
//  Copyright © 2016年 李慧珉. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var ShowImg: UIImageView!
    
    @IBOutlet weak var ShowAddressLb: UILabel!
    
   
    @IBOutlet weak var ShowSpellLb: UILabel!
    
    @IBOutlet weak var ShowDescriptionLb: UILabel!
    
    @IBOutlet weak var ShowTb: UITableView!
    //MARK:_创建数据源
    var ShowArray=[ShowModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
//MARK:_代理回调
   ShowTb.delegate=self
   ShowTb.dataSource=self
        
      let urlString="http://q.chanyouji.com/api/v3/destinations/704.json"
        
        LHMAFHTTPRequest.GET(success: { (data) in
            let obj=try!JSONSerialization.jsonObject(with: data, options: .allowFragments)
            
            let rootArray = (obj as AnyObject!).object(forKey: "data") as! NSDictionary
            
            for _ in rootArray {
                
                let sectionsArray=(obj as AnyObject).object(forKey: "sections")as!NSArray
                for ShowDict in sectionsArray{
                
                  
    
                let model=ShowModel()
                model.setValuesForKeys(ShowDict as! [String : Any])
                
            
                
                self.ShowArray.append(model)
            }
            }
            self.ShowTb.reloadData()
            },fail:{(reason) in
                print(reason)
            },urlString: urlString)
        
        
        
        // Do any additional setup after loading the view.
    }
    func registerMyCell(){
        let nib = UINib.init(nibName: "ShowCell", bundle: nil)
        ShowTb.register(nib, forCellReuseIdentifier: "a")
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return self.ShowArray.count
        
        
       
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=ShowTb.dequeueReusableCell(withIdentifier: "a", for:indexPath)as!ShowTableViewCell
        
        
   cell.ShowTbNameLb.text=ShowArray[indexPath.row]._name[indexPath.row]
        cell.ShowTbNameenLb.text=ShowArray[indexPath.section]._name_en[indexPath.row]
    cell.ShowTbSummaryLb.text=ShowArray[indexPath.section]._summary[indexPath.row]
        cell.ShowTbVisitLb.text=ShowArray[indexPath.section]._visit_tip[indexPath.row]
    cell.ShowTableViewImg.sd_setImage(with: URL.init(string: ShowArray[indexPath.section]._photo_url[indexPath.row]))
        return cell
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
