//
//  ViewController.swift
//  AWSTest
//
//  Created by Sergii Nezdolii on 17/12/15.
//  Copyright © 2015 FrostDigital. All rights reserved.
//

import UIKit

let kDeviceToken = "deviceToken"
let kEndpointArn = "endpointArn"
let kAIKSubscribed = "aikSubscribed"
let kDIFSubscribed = "difSubscribed"

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
        deviceToken?.text = NSUserDefaults.standardUserDefaults().stringForKey(kDeviceToken) ?? "N/A"
        endpointArn?.text = NSUserDefaults.standardUserDefaults().stringForKey(kEndpointArn) ?? "N/A"
    }
    
    func displayUserAction(action: NSString?) {
        if action == nil {
            userAction?.text = "---"
        } else {
            userAction?.text = "The user selected [" + (action! as String) + "]"
        }
    }
    
    func updateTopicsUI() {
        aikSwitch?.on = NSUserDefaults.standardUserDefaults().boolForKey(kAIKSubscribed) ?? false
        difSwitch?.on = NSUserDefaults.standardUserDefaults().boolForKey(kDIFSubscribed) ?? false
    }
    
    @IBAction private func switchAIK() {
        if (aikSwitch?.on != NSUserDefaults.standardUserDefaults().boolForKey(kAIKSubscribed)) {
            print("Switch AIK: ", aikSwitch?.on)
        }
    }

    @IBAction private func switchDIF() {
        if (difSwitch?.on != NSUserDefaults.standardUserDefaults().boolForKey(kDIFSubscribed)) {
            print("Switch DIF: ", difSwitch?.on)
        }
    }
}