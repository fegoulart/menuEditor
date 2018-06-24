//
//  DishTableViewCell.swift
//  menuEditor
//
//  Created by Fernando Goulart on 24/06/2018.
//  Copyright © 2018 Leapi. All rights reserved.
//

import UIKit

class DishTableViewCell: UITableViewCell {

    @IBOutlet weak var dishNameUILabel: UILabel!
    @IBOutlet weak var trashIconUIImageView: UIImageView!
    @IBOutlet weak var dishDescriptionUiLabel: UILabel!
    @IBOutlet weak var dishPriceUILabel: UILabel!
    @IBOutlet weak var editIconUIImageView: UIImageView!
    
    @IBOutlet weak var dishImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
