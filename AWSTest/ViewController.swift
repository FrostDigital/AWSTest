//
//  ViewController.swift
//  AWSTest
//
//  Created by Sergii Nezdolii on 17/12/15.
//  Copyright © 2015 FrostDigital. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var deviceToken: UILabel?
    @IBOutlet weak var endpointArn: UILabel?
    @IBOutlet weak var userAction: UILabel?
    @IBOutlet weak var aikSwitch: UISwitch?
    @IBOutlet weak var difSwitch: UISwitch?
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        updateTopicsUI()
    }

    func displayDeviceInfo() {
        deviceToken?.text = NSUserDefaults.standardUserDefaults().stringForKey("deviceToken") ?? "N/A"
        endpointArn?.text = NSUserDefaults.standardUserDefaults().stringForKey("endpointArn") ?? "N/A"
    }
    
    func displayUserAction(action: NSString?) {
        if action == nil {
            userAction?.text = "---"
        } else {
            userAction?.text = "The user selected [" + (action! as String) + "]"
        }
    }
    
    func updateTopicsUI() {
        aikSwitch?.on = NSUserDefaults.standardUserDefaults().boolForKey("aikSubscribed") ?? false
        difSwitch?.on = NSUserDefaults.standardUserDefaults().boolForKey("difSubscribed") ?? false
    }
    
    @IBAction private func switchAIK() {
        print("Switch AIK: ", aikSwitch?.on)
    }

    @IBAction private func switchDIF() {
        print("Switch DIF: ", difSwitch?.on)
    }
}