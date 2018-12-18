//
//  TableViewCell.swift
//  testBranchNew
//
//  Created by Nobby on 18/10/18.
//  Copyright © 2018 Nobby. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var heightC: NSLayoutConstraint!
    @IBOutlet var imageNews: UIImageView!
    @IBOutlet var textContent: UILabel!
    @IBOutlet var textTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
