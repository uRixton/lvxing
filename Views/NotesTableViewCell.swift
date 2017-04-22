//
//  NotesTableViewCell.swift
//  lvxing
//
//  Created by qianfeng on 2016/10/14.
//  Copyright © 2016年 李慧珉. All rights reserved.
//

import UIKit

class NotesTableViewCell: UITableViewCell {


    @IBOutlet weak var NotesBigImg: UIImageView!
    
    @IBOutlet weak var NotesCollectionView: UICollectionView!
    
    @IBOutlet weak var NotesTopicLb: UILabel!
    
    @IBOutlet weak var NotesDescriptionLb: UILabel!
    
    
    var model=NotesModel(){
    didSet{
        if let path = model.photo_url {
            NotesBigImg.sd_setImage(with:URL.init(string:path))

        }
        NotesTopicLb.text=model.topic
        NotesDescriptionLb.text=model.Description
        
    }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
