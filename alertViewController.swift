//
//  alertViewController.swift
//  SunAndMoon
//
//  Created by Najia Haider on 10/6/17.
//  Copyright © 2017 Najia Haider. All rights reserved.
//

import UIKit

class alertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let wonGame = UIAlertController(title: "You won!", message: "Play Again?", preferredStyle: UIAlertControllerStyle.alert)
        
        wonGame.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.default, handler: { (action) in wonGame.dismiss(animated: true, completion: nil)
            
            self.viewDidLoad()
            
        }))

        
        self.present(wonGame, animated: true, completion: nil)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
