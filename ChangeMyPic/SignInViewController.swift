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
                let allAccounts = account.accountsWithAccountType(accountType)
                if allAccounts.count > 0 {
                    let twitterAccount = allAccounts.last as ACAccount
                    
                    let requestAPI = NSURL(string: "https://api.twitter.com/1.1/account/verify_credentials.json")
                    
                    let userRequest = SLRequest(forServiceType: SLServiceTypeTwitter, requestMethod: SLRequestMethod.GET, URL: requestAPI, parameters: nil)
                    
                    userRequest.account = twitterAccount
                    
                    userRequest.performRequestWithHandler({ (response:NSData!, urlResponse:NSHTTPURLResponse!, error:NSError!) -> Void in
                        
                        var error = NSErrorPointer()
                        
                        let responseDictionary = NSJSONSerialization.JSONObjectWithData(response, options: NSJSONReadingOptions.MutableLeaves, error: error) as [String : AnyObject]
                        
                        let imageURL = responseDictionary["profile_image_url_https"] as NSString
                        
                        
                    })
                }
            } else {
                println("Access Not Granted")
            }
        }
    }

}
