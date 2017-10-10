//
//  toDoCellTableViewCell.swift
//  SunAndMoon
//
//  Created by Najia Haider on 9/27/17.
//  Copyright © 2017 Najia Haider. All rights reserved.
//

import UIKit

class toDoCellTableViewCell: UITableViewCell {

    public static var identity = "nothing"
    
    @IBOutlet weak var toDoTask: UILabel!
    
    @IBOutlet weak var checkButton: UIButton!
    var checked = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = UITableViewCellSelectionStyle.none
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func tick(_ sender: Any) {
        if checked == true {
            //do nothing
            print("pic should not change")
        }
        else {
        checkButton.backgroundColor = UIColor.init(patternImage:#imageLiteral(resourceName: "icons8-Tick Box-50"))
        checked = true
        if toDoCellTableViewCell.identity == "Sun" {
            FirstViewController.checkedOff+=1
            print("first")
        }
        if toDoCellTableViewCell.identity == "Moon" {
            SecondViewController.checkedOffNight+=1
            print("second")
            
        }
        
        if (FirstViewController.checkedOff == FirstViewController.toDoMorning.count) {
            print("finished morning routine")
            let finishedTasks = UIAlertController(title: "Finished!", message: "You completed your morning routine!", preferredStyle: UIAlertControllerStyle.alert)
            
            finishedTasks.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: { (action) in finishedTasks.dismiss(animated: true, completion: nil)
                
            }))
            UIApplication.shared.keyWindow?.rootViewController?.present(finishedTasks, animated: true, completion: nil)
            FirstViewController.checkedOff = 0
            
            for each in FirstViewController.cells {
                each.checkButton.backgroundColor = UIColor.init(patternImage:#imageLiteral(resourceName: "icons8-Unchecked Checkbox-50"))
                each.checked = false
            }
      
        }
        
        if (SecondViewController.checkedOffNight == SecondViewController.toDoNight.count) {
            print("finished Night routine")
            let finishedTasks = UIAlertController(title: "Finished!", message: "You completed your night routine!", preferredStyle: UIAlertControllerStyle.alert)
            
            finishedTasks.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: { (action) in finishedTasks.dismiss(animated: true, completion: nil)
                
            }))
            UIApplication.shared.keyWindow?.rootViewController?.present(finishedTasks, animated: true, completion: nil)
            SecondViewController.checkedOffNight = 0
            for each in SecondViewController.nightCells {
                each.checkButton.backgroundColor = UIColor.init(patternImage:#imageLiteral(resourceName: "icons8-Unchecked Checkbox-50"))
                each.checked = false
            }
            
            
        }

        }}
    
    



}
