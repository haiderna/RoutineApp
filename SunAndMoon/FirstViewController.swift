//
//  FirstViewController.swift
//  SunAndMoon
//
//  Created by Najia Haider on 9/27/17.
//  Copyright © 2017 Najia Haider. All rights reserved.

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    
    public static var toDoMorning = ["medicine", "brush teeth", "skincare", "contacts", "sunscreen", "makeup", "refill water bottle"]
    
    public static var checkedOff = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toDoCellTableViewCell.identity = "Sun"
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
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            FirstViewController.toDoMorning.remove(at: indexPath.row)
            tableView.reloadData()
        
        }
    }

 
    
    
}

