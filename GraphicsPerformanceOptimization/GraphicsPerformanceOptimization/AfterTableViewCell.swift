//
//  AfterTableViewCell.swift
//  GraphicsPerformanceOptimization
//
//  Created by DandJ on 2018/5/22.
//  Copyright © 2018年 DandJ. All rights reserved.
//

import UIKit

class AfterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var smallImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        mainImageView.layer.shadowColor = UIColor.black.cgColor
        mainImageView.layer.shadowOpacity = 1
        mainImageView.layer.shadowRadius = 2
//        mainImageView.layer.shadowOffset = CGSize(width: 2, height: 2)
        mainImageView.layer.shadowPath = UIBezierPath.init(roundedRect: mainImageView.bounds, cornerRadius: 2).cgPath
        smallImageView.layer.cornerRadius = smallImageView.frame.size.width / 2
        smallImageView.clipsToBounds = true
        
        
        nameLabel.backgroundColor = UIColor.white
        titleLabel.backgroundColor = UIColor.white
        titleLabel.layer.masksToBounds = true
        nameLabel.layer.masksToBounds = true
//        nameLabel.layer.shouldRasterize = true
    }
    
    func updateWithModel(cellModel: CellModel) {
        mainImageView.image = UIImage.init(named: cellModel.mainImgName)
        titleLabel.text = cellModel.title
        smallImageView.image = UIImage.init(named: cellModel.smallImagName)
        nameLabel.text = cellModel.name
    }
}
