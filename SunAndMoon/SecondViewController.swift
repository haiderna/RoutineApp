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
    
    public static var toDoNight = ["pick clothes", "check blackboard", "vitamin E/Cabergolyn", "floss", "brush teeth", "mouthwash", "clean retainer", "put retainer in", "eye exercises", "lemon skin scrub"]
    
    public static var checkedOffNight = 0
    
    public static var nightCells = [toDoCellTableViewCell]()
    
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
        SecondViewController.nightCells.append(cell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            SecondViewController.toDoNight.remove(at: indexPath.row)
            tableView.reloadData()
            
        }
    }

    @IBAction func NightAdd(_ sender: Any) {
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
            SecondViewController.toDoNight.append(self.addedTask)
            self.NightTable.reloadData()
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    
}

