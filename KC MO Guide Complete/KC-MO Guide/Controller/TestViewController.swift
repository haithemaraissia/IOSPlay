//
//  TestViewController.swift
//  Kc Mo Guide
//
//  Created by user122109 on 10/10/16.
//  Copyright © 2016 Developers Academy. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var Test: UILabel!
    var testPassed: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
     // Test.text = testPassed
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
