//
//  CustomTableCell.swift
//  Test_project
//
//  Created by iMac on 12.08.2022.
//

import UIKit

class CustomTableCell: UITableViewCell {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var countOfChangesLabel: UILabel!
    @IBOutlet weak var docBodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
