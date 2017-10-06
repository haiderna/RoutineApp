//
//  FirstViewController.swift
//  SunAndMoon
//
//  Created by Najia Haider on 9/27/17.
//  Copyright © 2017 Najia Haider. All rights reserved.

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var addedTask = " "
    
    @IBOutlet weak var tabView: UITableView!
    
    public static var toDoMorning = ["medicine", "brush teeth", "skincare", "contacts", "sunscreen", "makeup", "refill water bottle"]
    public static var cells = [toDoCellTableViewCell]()
    
    public static var checkedOff = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoCellTableViewCell.identity = "Sun"
        reloadInputViews()
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

 
    
    
}

