//
//  MapKitViewController.swift
//  KC-MO Guide
//
//  Created by Haithem Araissia on 10/10/16.
//  Copyright © 2016 Haithem Araissia. All rights reserved.
//

import UIKit

class MapKitViewController: UIViewController {


    @IBOutlet weak var Test: UILabel!
    
    var placeIdPassed : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Test.text = placeIdPassed
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
}































    
    // MARK: - Target / Action
    // Load URL IN SAFARI
//    @IBAction func fullBlogDidTap(_ sender: AnyObject)
//    {
        // import SafariServices
//        let safariVC = SFSafariViewController(url: URL(string: "https://maps.google.com/?cid=8705674934556788176")!)
//        
//        safariVC.view.tintColor = UIColor(red: 248/255.0, green: 47/255.0, blue: 38/255.0, alpha: 1.0)
//        safariVC.delegate = self
//        self.present(safariVC, animated: true, completion: nil)
//    }
    


//extension MapKitViewController : SFSafariViewControllerDelegate
//{
//    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
//        controller.dismiss(animated: true, completion: nil)
//    }
//}
