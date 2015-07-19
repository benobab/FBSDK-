//
//  LoggedViewController.swift
//  FbTest
//
//  Created by BenLacroix on 19/07/2015.
//  Copyright © 2015 BenLacroix. All rights reserved.
//

import UIKit

class LoggedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                print("Error: \(error)")
            }
            else
            {
                print("fetched user: \(result)")
                let userName : NSString = result.valueForKey("name") as! NSString
                print("User Name is: \(userName)")
                let userEmail : NSString = result.valueForKey("id") as! NSString
                print("User id is: \(userEmail)")
            }
        })

        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func logout(sender: UIBarButtonItem) {
        FBSDKLoginManager().logOut()
        self.navigationController?.popViewControllerAnimated(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
