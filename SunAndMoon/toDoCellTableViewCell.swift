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
    
    var dayRoutine = [String]()
    var nightRoutine = [String]()
    
    @IBOutlet weak var toDoTask: UILabel!
    
    @IBOutlet weak var checkButton: UIButton! 
    var checked = false
    var task = " "
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = UITableViewCellSelectionStyle.none
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDayRoutine(day: [String]) -> [String] {
        dayRoutine = day
        return dayRoutine
    }
   
    func setNightRoutine(night: [String]) -> [String] {
        nightRoutine = night
        return nightRoutine
    }
    
    @IBAction func tick(_ sender: Any) {
       // print(checked)
       
        //print(dayRoutine.count)
        //print(FirstViewController.checkedOff)
        if checked == true {
            //do nothing
            //print("pic should not change")
        }
        else {
            checkButton.backgroundColor = UIColor.init(patternImage: #imageLiteral(resourceName: "icons8-Tick Box-50"))
        checked = true
        if toDoCellTableViewCell.identity == "Sun" {
            FirstViewController.checkedOff+=1
           // print(dayRoutine.count)
           // print(FirstViewController.checkedOff)
           // print("first")
            
//            for each in FirstViewController.cells {
//                print(each.checked)
//            }
            
            //when all the boxes are checked off
            if (FirstViewController.checkedOff == FirstViewController.cells.count) {
                
                print("finished morning routine")
                
                let finishedTasks = UIAlertController(title: "Finished!", message: "You completed your morning routine!", preferredStyle: UIAlertControllerStyle.alert)
                
                finishedTasks.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: { (action) in finishedTasks.dismiss(animated: true, completion: nil)
                    
                }))
                UIApplication.shared.keyWindow?.rootViewController?.present(finishedTasks, animated: true, completion: nil)
                FirstViewController.checkedOff = 0
                
                
                for each in FirstViewController.cells {
                    
                    each.checked = false
                    //each.checkButton = UIButton()
                    print(each.checkButton)
                    
                   // each.checkButton.backgroundColor = UIColor.init(patternImage: #imageLiteral(resourceName: "icons8-Unchecked Checkbox-50"))
                }
                
            
            }
        }
        if toDoCellTableViewCell.identity == "Moon" {
            
            SecondViewController.checkedOffNight+=1
           
            print("Number of cells")
            print(SecondViewController.nightCells.count)
            print("checked off")
            print(SecondViewController.checkedOffNight)
            
            if (SecondViewController.checkedOffNight == SecondViewController.nightCells.count) {
                print("finished Night routine")
                let finishedTasks = UIAlertController(title: "Finished!", message: "You completed your night routine!", preferredStyle: UIAlertControllerStyle.alert)
                
                finishedTasks.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: { (action) in finishedTasks.dismiss(animated: true, completion: nil)
                    
                }))
                UIApplication.shared.keyWindow?.rootViewController?.present(finishedTasks, animated: true, completion: nil)
                SecondViewController.checkedOffNight = 0
                for each in SecondViewController.nightCells {
                  //  print(each.checkButton)
                    each.checkButton.backgroundColor = UIColor.init(patternImage: #imageLiteral(resourceName: "icons8-Unchecked Checkbox-50"))
                    each.checked = false
                 
                   // print(each.checked)
                }
              //  print(SecondViewController.nightCells.count)
               
            }
        }
        }}
    
    func setCell(task: String, checkedOff: Bool) {
        self.toDoTask.text = task
        self.checked = checkedOff
        if checked == true {
            self.checkButton.backgroundColor = UIColor.init(patternImage:#imageLiteral(resourceName: "icons8-Tick Box-50"))
        }else {
            self.checkButton.backgroundColor = UIColor.init(patternImage:#imageLiteral(resourceName: "icons8-Unchecked Checkbox-50"))
        }
    }
    
    
}
