//
//  NotesFooterReusable.swift
//  lvxing
//
//  Created by qianfeng on 2016/12/20.
//  Copyright © 2016年 李慧珉. All rights reserved.
//

import UIKit

class NotesFooterReusable: UICollectionReusableView {

    //MARK:_点赞
    @IBAction func likeBtn(_ sender: UIButton) {
    }
    
    //MARK:_点赞的数量
    @IBOutlet weak var likenumber: UILabel!
   
    //MARK:_写评论
    @IBAction func writeBtn(_ sender: UIButton) {
    }
    //MARK:_写评论的数量
    @IBOutlet weak var writenumber: UILabel!
    
    //MARK:_收藏
    @IBAction func favotiteBtn(_ sender: UIButton) {
    }
    
    
    @IBAction func moreBtn(_ sender: UIButton) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
