//
//  SignInViewController.swift
//  ChangeMyPic
//
//  Created by Merritte on 2/25/15.
//  Copyright (c) 2015 Merritte. All rights reserved.
//

import UIKit
import Accounts
import Social

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Go!
    }

    @IBAction func twitterTapped(sender: AnyObject) {
        let account = ACAccountStore()
        
        let accountType = account.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierTwitter)
        
        account.requestAccessToAccountsWithType(accountType, options: nil) { (granted:Bool, error: NSError!) -> Void in
            
            if granted {
                
            } else {
                println("Access Not Granted")
            }
        }
    }

}
