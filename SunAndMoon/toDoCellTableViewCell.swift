//
//  toDoCellTableViewCell.swift
//  SunAndMoon
//
//  Created by Najia Haider on 9/27/17.
//  Copyright © 2017 Najia Haider. All rights reserved.
//

import UIKit

class toDoCellTableViewCell: UITableViewCell {

    @IBOutlet weak var toDoTask: UILabel!
    
    @IBOutlet weak var checkButton: UIButton!
    var checked = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func tick(_ sender: Any) {
        checkButton.backgroundColor = UIColor.init(patternImage:#imageLiteral(resourceName: "icons8-Tick Box-50"))
        checked = true
    }

}
