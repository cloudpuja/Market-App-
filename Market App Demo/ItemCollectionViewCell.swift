//
//  ItemCollectionViewCell.swift
//  Market App Demo
//
//  Created by Vijay લાDવા on 01/11/18.
//  Copyright © 2018 Vijay લાDવા. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var viewBack :UIView!
    @IBOutlet weak var btnAction :UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.viewBack.layer.cornerRadius = 10
        self.btnAction.layer.cornerRadius = (self.btnAction.frame.size.height / 2)
    }

}
