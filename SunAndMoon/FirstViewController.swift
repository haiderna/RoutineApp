//
//  FirstViewController.swift
//  SunAndMoon
//
//  Created by Najia Haider on 9/27/17.
//  Copyright © 2017 Najia Haider. All rights reserved.

import UIKit
import UserNotifications

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    
    var addedTask = " "
    let datePicker = UIDatePicker()
@IBOutlet weak var tabView: UITableView!
    var starter = true
    
    var toDoMorning = ["medicine", "brush teeth", "skincare", "contacts", "sunscreen", "makeup", "refill water bottle"]
   public static var checkedArray = [false, false, false, false, false, false, false]
   
    public static var cells = [toDoCellTableViewCell]()
    var boolArray = [Bool]()
    
    public static var checkedOff = 0
    var cellCheck = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoCellTableViewCell.identity = "Sun"
        print(FirstViewController.cells.isEmpty)
        reloadInputViews()
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in })
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        toDoCellTableViewCell.identity = "Sun"
        if let x = UserDefaults.standard.object(forKey: "dayArray") as? String
        {
            print("idk what goes here")
            print(toDoMorning)
            toDoMorning = [x]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FirstViewController.cells.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! toDoCellTableViewCell
        cell.setDayRoutine(day: toDoMorning)
        cell.toDoTask.text = FirstViewController.cells[indexPath.row].task
        print(FirstViewController.cells[indexPath.row].checked)
//        cell = FirstViewController.cells[indexPath.row]
//        cell.toDoTask.text = FirstViewController.cells[indexPath.row].task
//        cell.checkButton.backgroundColor = FirstViewController.cells[indexPath.row].backgroundColor
        //FirstViewController.cells.append(cell)
//        if checkedArray.count > 0 {
//            if checkedArray[indexPath.row] == true {
//                cell.checkButton.backgroundColor = UIColor.init(patternImage:#imageLiteral(resourceName: "icons8-Tick Box-50"))
//            } else {
//                cell.checkButton.backgroundColor = UIColor.init(patternImage:#imageLiteral(resourceName: "icons8-Unchecked Checkbox-50"))
//            }
//
//        }
            return cell
  
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        starter = false
        if editingStyle == UITableViewCellEditingStyle.delete {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! toDoCellTableViewCell
            print(cell.checked)
            print("---")
            
            if cell.checked == true {
                FirstViewController.checkedOff-=1
                print(toDoMorning.count)
                print(FirstViewController.checkedOff)
                
            }
            
            toDoMorning.remove(at: indexPath.row)
            FirstViewController.checkedArray.remove(at:indexPath.row)
            //FirstViewController.cells.remove(at: indexPath.row)
            print(FirstViewController.cells.count)
            for each in FirstViewController.cells {
                print(each.checked)
                FirstViewController.checkedArray.append(each.checked)
            }
            FirstViewController.cells.removeAll()
            UserDefaults.standard.set(toDoMorning, forKey: "dayArray")
            tableView.reloadData()
        }
        
    }
    
    
    @IBAction func addTaskDay(_ sender: Any) {
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Add", message: "Add another task", preferredStyle: .alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = "New task here"
        }
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
            print("Text field: \(textField?.text)")
            self.addedTask = (textField?.text)!
            //self.toDoMorning.append(self.addedTask)
            //FirstViewController.checkedArray.append(false)
            var cell = toDoCellTableViewCell()
            cell.task = self.addedTask
            print(cell.checkButton)
            cell.checkButton?.backgroundColor = UIColor.init(patternImage:#imageLiteral(resourceName: "icons8-Unchecked Checkbox-50"))
            print(cell.checkButton)
            FirstViewController.cells.append(cell)
            print(FirstViewController.cells.count)
           // print(FirstViewController.cells[0].task)
            UserDefaults.standard.set(self.toDoMorning, forKey: "dayArray")
            self.tabView.reloadData()
            print(FirstViewController.cells)
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }

    
    
    
    
}

