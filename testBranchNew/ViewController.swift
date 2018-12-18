//
//  ViewController.swift
//  testBranchNew
//
//  Created by Nobby on 15/10/18.
//  Copyright © 2018 Nobby. All rights reserved.
//

import UIKit
import Branch
import FirebaseAnalytics
import FirebaseDynamicLinks

class ViewController: UIViewController {

    
     var promocode = ""
     var analyticsUrl = ""
    var checknode : String? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        guard let tracker = GAI.sharedInstance().defaultTracker else { return }
        tracker.set(kGAIScreenName, value: "homepage")
        self.createDynamicLink()
       // checknode = "values exist"
        print(checknode ?? "no value")
    }
    
    
    func createDynamicLink()
    {
        guard let link = URL(string: "https://www.example.com/my-page") else { return }
        let dynamicLinksDomain = "example.page.link"
        let linkBuilder = DynamicLinkComponents(link: link, domain: dynamicLinksDomain)
        linkBuilder.iOSParameters = DynamicLinkIOSParameters(bundleID: "com.example.ios")
        //linkBuilder.androidParameters = DynamicLinkAndroidParameters(packageName: "com.example.android")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func showMessage(_ sender: UIButton)
    {
        if UserDefaults.standard.string(forKey: "promocode") != nil
        {
            self.promocode = UserDefaults.standard.string(forKey: "promocode")!
        }
        
        if UserDefaults.standard.string(forKey: "analyticsUrl") != nil
        {
            self.analyticsUrl = UserDefaults.standard.string(forKey: "analyticsUrl")!
        }
        
        
        
        let alertController = UIAlertController(title: "Alert", message: "PromoCode are:.>>>>\(self.promocode)=======\(self.analyticsUrl)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction) in
            print("You've pressed cancel");
            self.createRefferalCode()
            self.dismiss(animated: true, completion: nil)
        }
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    func createRefferalCode()
    {
        if UserDefaults.standard.string(forKey: "promocode") != nil
        {
            UserDefaults.standard.removeObject(forKey: "promocode")
        }
        
        
        let buo = BranchUniversalObject.init(canonicalIdentifier: "firsttest")
        buo.title = "Lyk App"
        buo.contentDescription = "Lyk App Description"
        buo.publiclyIndex = true
        buo.locallyIndex = true
        buo.contentMetadata.customMetadata["custom_data"] = "XD200"
        
        let lp: BranchLinkProperties = BranchLinkProperties()
        // lp.channel = "Refer"
        //lp.feature = "Share"
        // lp.campaign = "Share"
        // lp.stage = "new user"
        // lp.tags = ["one", "two", "three"]
        
        //lp.addControlParam("$ios_url", withValue: "https://webapp.diawi.com/install/BFqdbW")
        // lp.addControlParam("$android_url", withValue: "http://example.com/android")
        //lp.addControlParam("custom_data", withValue: "REFEAL100")
        //lp.addControlParam("look_at", withValue: "this")
        //lp.addControlParam("nav_to", withValue: "over here")
        //lp.addControlParam("random", withValue: UUID.init().uuidString)
       // lp.addControlParam("random", withValue: "Manish200")
        buo.getShortUrl(with: lp) { (url, error) in
            print(url ?? "")
        }
        
    }

}

