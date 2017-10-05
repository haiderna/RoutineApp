//
//  SecondViewController.swift
//  SunAndMoon
//
//  Created by Najia Haider on 9/27/17.
//  Copyright © 2017 Najia Haider. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    
    public static var toDoNight = ["pick clothes", "check blackboard", "vitamin E/Cabergolyn", "floss", "brush teeth", "mouthwash", "clean retainer", "put retainer in", "eye exercises", "lemon skin scrub"]
    
    public static var checkedOffNight = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         toDoCellTableViewCell.identity = "Moon"
    }

    override func viewDidAppear(_ animated: Bool) {
        toDoCellTableViewCell.identity = "Moon"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SecondViewController.toDoNight.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! toDoCellTableViewCell
        cell.toDoTask.text = SecondViewController.toDoNight[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            SecondViewController.toDoNight.remove(at: indexPath.row)
            tableView.reloadData()
            
        }
    }

}

