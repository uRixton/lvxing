//
//  RaidersViewController.swift
//  lvxing
//
//  Created by qianfeng on 2016/10/13.
//  Copyright © 2016年 李慧珉. All rights reserved.
//

import UIKit

class RaidersViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
@IBOutlet weak var OneTableView: UITableView!
    //MARK:_第三块展示图
    @IBOutlet weak var ThreeRaidersCollectionView: UICollectionView!
   
    
    
    
    //MARK:_创建第三块数据源数组
    //var ThreeRaidersaArray=[ThreeRaidersModel]()
   var titleThreeArray=[ThreeRaidersModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.automaticallyAdjustsScrollViewInsets = false
        //MARK:_创建轮播视图
        let swidth = UIScreen.main.bounds.size.width
        let LHMAuto = LHMAutoCollectionView(frame: CGRect(x: 0, y: -200, width: swidth, height: 200), collectionViewLayout:UICollectionView.LHMLayout())
        
        // MARK:_将轮播视图放在collectionView上
        ThreeRaidersCollectionView.contentInset = UIEdgeInsets.init(top: 200, left: 10, bottom: 0, right: 10)
        ThreeRaidersCollectionView.addSubview(LHMAuto)
        
        //MARK:_关闭滚动条
        ThreeRaidersCollectionView.showsHorizontalScrollIndicator = false
        ThreeRaidersCollectionView.showsVerticalScrollIndicator = false
        
        ThreeRaidersCollectionView.indicatorStyle=UIScrollViewIndicatorStyle.white
        //MARK:_第三块代理回调
        ThreeRaidersCollectionView.dataSource=self
        ThreeRaidersCollectionView.delegate=self
        //MARK:_第三块请求数据
        let urlString="http://q.chanyouji.com/api/v2/destinations.json"
        
        LHMAFHTTPRequest.GET(success: { (data) in
            let obj=try!JSONSerialization.jsonObject(with: data, options: .allowFragments)
            let rootArray = (obj as AnyObject!).object(forKey: "data") as! NSArray
            for threeRaidersaDict in rootArray {
                
                let model=ThreeRaidersModel()
                model.setValuesForKeys(threeRaidersaDict as! [String : Any])

                self.titleThreeArray.append(model)
            
            
            
                            }
            
            self.ThreeRaidersCollectionView.reloadData()
            },fail:{(reason) in
                print(reason)
        },urlString: urlString)
        
        
        //Mark:_第三块回调
        registerThreeRaidersViewControllerCell()
        //Mark:_第三块打开CollectionView的分页设置
        ThreeRaidersCollectionView.isPagingEnabled=true
         registerHeaderFooter()

        // Do any additional setup after loading the view.
    }
    //MARK:_设置段的个数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.titleThreeArray.count
    }
    
    
    //注册段头和段尾
    func registerHeaderFooter() {
        let header = UINib(nibName: "OneReusableView", bundle: nil)
       ThreeRaidersCollectionView.register(header, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "Header")
        
        
        

        
        let footer = UINib(nibName: "OnefootReusableView", bundle: nil)
        ThreeRaidersCollectionView.register(footer, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "Footer")
        
        
    }
       //MARK:_设置段头高度
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 320, height: 30)
    }
    //MARK:_设置段位高度
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: 320, height: 30)
    }
    //返回段头段尾时，调用该方法
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
    if kind == UICollectionElementKindSectionFooter {
            //段尾
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Footer", for: indexPath) as! OnefootReusableView
            
            return view
            
            
        } else {
            //段头
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as! OneReusableView
            return view

        }
    }
    
    
    //MARK:_第三块注册自定制Cell
    func registerThreeRaidersViewControllerCell(){
        let nib=UINib.init(nibName: "ThreeRaidersViewControllerCell", bundle: nil)
        ThreeRaidersCollectionView.register(nib, forCellWithReuseIdentifier: "a")
        
    }
    //MARK:_第三块CollectionView协议方法
    //设置网格个数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.titleThreeArray[section]._name.count
    }
    //MARK:_制定自定制网格
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=ThreeRaidersCollectionView.dequeueReusableCell(withReuseIdentifier: "a", for:indexPath)as!ThreeRaidersViewControllerCell
        cell.ThreeRaidersImg.sd_setImage(with: URL.init(string: titleThreeArray[indexPath.section]._photo_url[indexPath.row]))
        cell.ThreeRaidersAddressLb.text=titleThreeArray[indexPath.section]._name[indexPath.row]
        cell.ThreeRadiersSpellLb.text=titleThreeArray[indexPath.section]._name_ens[indexPath.row]
        return cell
    }

    //MARK:_当collectionView被选中的时候调用该方法
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
    
    
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


