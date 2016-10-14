//
//  TestViewController.swift
//  Kc Mo Guide
//
//  Created by user122109 on 10/10/16.
//  Copyright © 2016 Developers Academy. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var AddressLabel: UILabel!
    @IBOutlet weak var FaceBookButtonLabel: UIButton!
    @IBOutlet weak var PhoneLabel: UILabel!
    @IBOutlet weak var MainPhoto: UIImageView!
    
    @IBOutlet weak var Test: UILabel!
    var testPassed: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BindPlaceDetail()
        

        // Do any additional setup after loading the view.
     // Test.text = testPassed
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func faceBookButton(_ sender: AnyObject)
    {
        UIApplication.shared.openURL(NSURL(string: "http://www.google.com") as! URL)
    }
    
    
    func BindPlaceDetail() -> Void
    {
        TitleLabel?.text = "This is Title"
        AddressLabel?.text = "This is address"
        PhoneLabel?.text = "(913) 406 0298"
        FaceBookButtonLabel.setTitle("This is facebookTitle", for: UIControlState.normal)
//        
//        FaceBookButtonLabel.titleLabel?.text = "Test"
        
        
//        MainPhoto.image  = UIImage(named: sections[indexPath.row].name)

        
        MainPhoto.image = UIImage( named: "noimage-1")

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
