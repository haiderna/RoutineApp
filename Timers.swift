//
//  Timers.swift
//  SunAndMoon
//
//  Created by Najia Haider on 10/19/17.
//  Copyright © 2017 Najia Haider. All rights reserved.
//

import UIKit
import UserNotifications
class Timers: UIViewController {

    @IBOutlet weak var timer: UIDatePicker!
    
    @IBOutlet weak var submitTime: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer.datePickerMode = .time
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func morningRoutine() {
//        var time = timer.date
//    
//        let calendar = Calendar.current
//        let comp = calendar.dateComponents([.hour, .minute], from: time)
//        let hour = comp.hour
//        let minute = comp.minute
//        
//        
//        print(" \(String(describing: hour)) \(String(describing: minute))")
//
//        Notification(hour: hour, minute: minute)
//        
//    
//    }
//    
//    func nightRoutine() {
//    }
    
    @IBAction func whichTimer(_ sender: Any) {
        var time = timer.date
        
        let calendar = Calendar.current
        let comp = calendar.dateComponents([.hour, .minute], from: time)
        let hour = comp.hour
        let minute = comp.minute
        
        
        print(" \(String(describing: hour)) \(String(describing: minute))")
        if toDoCellTableViewCell.identity == "Sun" {
        Notification(hour: hour, minute: minute)
        
        }
        if toDoCellTableViewCell.identity == "Moon" {
        NotificationNight(hour: hour, minute: minute)
        }
        
    }
    
    
    func Notification(hour: Int?, minute: Int?){
        
        let sounder = UNNotificationSound.default()
        let content = UNMutableNotificationContent()
        
        content.title = "Morning Routine"
        content.subtitle = "Morning Routine Time"
        content.body = "Get the morning routine done! "
        content.badge = 1
        content.sound = sounder
        
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(identifier: "timerDone", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        print("got to the end")
    }

    func NotificationNight(hour: Int?, minute: Int?){
        let sounder = UNNotificationSound.default()
        let content = UNMutableNotificationContent()
        
        content.title = "Night Routine"
        content.subtitle = "Night Routine Time"
        content.body = "Get the night routine done! "
        content.badge = 1
        content.sound = sounder
        
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(identifier: "NightTimer", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        print("got to the end")

    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
