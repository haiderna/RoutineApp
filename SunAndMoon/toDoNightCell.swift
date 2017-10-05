//
//  toDoNightCell.swift
//  SunAndMoon
//
//  Created by Najia Haider on 10/3/17.
//  Copyright © 2017 Najia Haider. All rights reserved.
//

import UIKit

class toDoNightCell: UITableViewCell {

    @IBOutlet weak var nightLabel: UILabel!
    
    @IBOutlet weak var nightChecked: UIButton!
    var checked = false
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = UITableViewCellSelectionStyle.none
    }

    
    
    
    @IBAction func nightChecked(_ sender: Any) {
        nightChecked.backgroundColor = UIColor.init(patternImage:#imageLiteral(resourceName: "icons8-Tick Box-50"))
        checked = true
        SecondViewController.checkedOffNight+=1
        
        if (SecondViewController.checkedOffNight == SecondViewController.toDoNight.count) {
                       print("finished night routine")
                  }

        
        
        
    }
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
