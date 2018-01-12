//
//  SecondViewController.swift
//  SunAndMoon
//
//  Created by Najia Haider on 9/27/17.
//  Copyright © 2017 Najia Haider. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var addedTask = " "
    
    @IBOutlet weak var NightTable: UITableView!
    
     public static var toDoNight = ["pick clothes", "brush teeth"] //

    let defaults = UserDefaults()
   
  
    public static var checkedOffNight = 0
    
    public static var nightCells = [toDoCellTableViewCell]()
   public static var boolArray = [false, true]
    
    override func viewDidLoad() {
        NightTable.dataSource = self
        NightTable.delegate = self
  
        SecondViewController.nightCells.removeAll()
        super.viewDidLoad()
        toDoCellTableViewCell.identity = "Moon"
        defaults.set(SecondViewController.toDoNight, forKey: "nightArray")
        UserDefaults.standard.set(SecondViewController.toDoNight, forKey: "nightArray")
         reloadInputViews()
    }

    override func viewDidAppear(_ animated: Bool) {
        toDoCellTableViewCell.identity = "Moon"
        if let x = UserDefaults.standard.object(forKey: "nightArray") as? String
        {
            print("idk what goes here")
            SecondViewController.toDoNight = [x]
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SecondViewController.nightCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! toDoCellTableViewCell
    
        cell = SecondViewController.nightCells[indexPath.row]
           cell.toDoTask.text = SecondViewController.nightCells[indexPath.row].task
         cell.checked = SecondViewController.nightCells[indexPath.row].checked
      
        
        if cell.checked == true {
             cell.checkButton.backgroundColor = UIColor.init(patternImage: #imageLiteral(resourceName: "icons8-Tick Box-50"))
        } else {
            cell.checkButton.backgroundColor = UIColor.init(patternImage: #imageLiteral(resourceName: "icons8-Unchecked Checkbox-50"))
        }

       
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! toDoCellTableViewCell
            cell.checked = SecondViewController.nightCells[indexPath.row].checked
            cell.toDoTask.text = SecondViewController.nightCells[indexPath.row].task
            if cell.checked == true {
                SecondViewController.checkedOffNight-=1
                
            }
            
            SecondViewController.nightCells.remove(at:indexPath.row)
            print("Number of cells")
            print(SecondViewController.nightCells.count)
            print("checked off")
            print(SecondViewController.checkedOffNight)
          
            ///// CHANGE THIS TO A FUNCTION EVENTUALLY
            
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
            
            
            
            
            
            
         //   UserDefaults.standard.set(SecondViewController.toDoNight, forKey: "nightArray")
          
            tableView.reloadData()
         
        }
    }

    @IBAction func NightAdd(_ sender: Any) {
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Add", message: "Add another task", preferredStyle: .alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = "New task here"}
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
           // print("Text field: \(textField?.text)")
            self.addedTask = (textField?.text)!
            var cell = self.NightTable.dequeueReusableCell(withIdentifier: "cell") as! toDoCellTableViewCell
            cell.task = self.addedTask
            cell.checked = false
            //SecondViewController.toDoNight.append(self.addedTask)
            //SecondViewController.boolArray.append(false)
            SecondViewController.nightCells.append(cell)
           // UserDefaults.standard.set(SecondViewController.toDoNight, forKey: "nightArray")
            //SecondViewController.nightCells.removeAll()
            self.NightTable.reloadData()
            print("Number of cells")
            print(SecondViewController.nightCells.count)
            print("checked off")
            print(SecondViewController.checkedOffNight)
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    
}

