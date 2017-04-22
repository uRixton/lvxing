//
//  LHMAutoCollectionView.swift
//  lvxing
//
//  Created by qianfeng on 2016/10/15.
//  Copyright © 2016年 李慧珉. All rights reserved.
//

import UIKit

//扩展UICollectionView
extension UICollectionView {
    
    class func LHMLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }
    
}
//MARK:_手动创建一个网格视图
class LHMAutoCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    /*
     // Only override drawRect: if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func drawRect(rect: CGRect) {
     // Drawing code
     }
     */
    //MARK:_创建数据源数组
    var oneRaidersArray=[OneRaidersModel]()
    //MARK:_屏幕适宽
    let swidth = UIScreen.main.bounds.size.width
    //声明网格全局变量
    var cv: UICollectionView?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        //设置回调
        self.delegate = self
        self.dataSource = self
        
        //MARK:_数据请求
        let urlString="http://q.chanyouji.com/api/v1/adverts.json?market=baidu&first_launch=false"
        
         LHMAFHTTPRequest.GET(success: { (data) in
           let obj=try!JSONSerialization.jsonObject(with: data, options: .allowFragments)
            let DataArray = (obj as AnyObject).object(forKey: "data") as! NSArray
            for oneRadisDict in DataArray {
                
                let  topStr=(oneRadisDict as AnyObject).object(forKey: "topic") as! String
                let model=OneRaidersModel()
                model.topic=topStr
                self.oneRaidersArray.append(model)
                
            let  photoDict = (oneRadisDict as AnyObject).object(forKey: "photo") as! NSDictionary
                let photoStr=(photoDict as AnyObject).object(forKey: "photo_url")as!String
                model.photo_url = photoStr
            }
            self.reloadData()

            
            },fail:{(reason) in
                print(reason)
            },urlString: urlString)
        
         //设置网格背景颜色
        self.backgroundColor = UIColor.gray
        //设置网格翻页效果
        self.isPagingEnabled = true
        //MARK:_回调
        registerMyCell()
        
        //创建计时器
        let timer = Timer.scheduledTimer(timeInterval: 1, target: self , selector: #selector(self.addTimer), userInfo: nil, repeats: true)
        
        //解决线程间冲突
        RunLoop.current.add(timer, forMode: RunLoopMode.commonModes)
        
    }
    var current = 0
    //计时器
    func addTimer() {
        //通过设置偏移量，改变轮播的图片
        current += 1
        if current == oneRaidersArray.count {
            current = 0
            self.contentOffset = CGPoint(x: 0, y: 0)
            
        } else {
            
            self.setContentOffset(CGPoint(x: CGFloat(current) * swidth, y: 0), animated: true)
        }
    }
    
    //向collectionView注册自定制Cell
    func registerMyCell() {
        let nib = UINib(nibName: "oneCell", bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: "OneCell")
        
    }
    
    
    
    //设置网格的个数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return oneRaidersArray.count
    }
    
    //创建网格对象
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OneCell", for: indexPath) as!oneCell
        cell.model = self.oneRaidersArray[indexPath.item]
            return cell
    }
    
    //设置网格的大小
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: swidth, height: 200)
    }
    
    
    //设置网格间最小行距,默认最小行距为10
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
      
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
