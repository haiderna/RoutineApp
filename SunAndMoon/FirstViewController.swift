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
    
    public static var toDoMorning = ["medicine", "brush teeth", "skincare", "contacts", "sunscreen", "makeup", "refill water bottle"]
    public static var cells = [toDoCellTableViewCell]()
    
    public static var checkedOff = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoCellTableViewCell.identity = "Sun"
        reloadInputViews()
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in })
        //Notification()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        toDoCellTableViewCell.identity = "Sun"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FirstViewController.toDoMorning.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! toDoCellTableViewCell
        cell.toDoTask.text = FirstViewController.toDoMorning[indexPath.row]
        FirstViewController.cells.append(cell)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            FirstViewController.toDoMorning.remove(at: indexPath.row)
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
            FirstViewController.toDoMorning.append(self.addedTask)
            self.tabView.reloadData()
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }

    func Notification(){
        let calendar = NSCalendar.current
        let date = NSDateComponents()
        date.hour = 13
        date.minute = 02
        
        let sounder = UNNotificationSound.default()
        let content = UNMutableNotificationContent()
        content.title = "Morning Routine"
        content.subtitle = "Morning Routine Time"
        content.body = "Get the morning routine done! "
        content.badge = 1
        content.sound = sounder
       
      //  let components = Calendar.current.dateComponents([.minute, .hour], from:self.)
        
        var dateComponents = DateComponents()
        dateComponents.hour = 16
        dateComponents.minute = 36
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "timerDone", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
      
    }
    
    
    func toolBarDatePicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action:#selector (donePressed) )
        toolbar.setItems([doneButton], animated: false)
        //getTime.inputAccessoryView = toolbar
       // getTexttxt.inputAccessoryView = toolbar
        //getTexttxt.inputView = datePicker
      //  datePickerTxtTest.inputView = datePicker
        
    
    }
    func donePressed() {
    print("was pressed")
        print("\(datePicker.date)")
    }
    
    
    
    
}

