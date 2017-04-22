//
//  ShowTableViewCell.swift
//  lvxing
//
//  Created by qianfeng on 2016/10/21.
//  Copyright © 2016年 李慧珉. All rights reserved.
//

import UIKit

class ShowTableViewCell: UITableViewCell {

    
    @IBOutlet weak var ShowTableViewImg: UIImageView!
    
    @IBOutlet weak var ShowTbNameLb: UILabel!
    
    
    @IBOutlet weak var ShowTbNameenLb: UILabel!
    
    
    @IBOutlet weak var ShowTbSummaryLb: UILabel!
    
    @IBOutlet weak var ShowTbVisitLb: UILabel!
    
    
    @IBOutlet weak var ShowTbDescriptionLb: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
