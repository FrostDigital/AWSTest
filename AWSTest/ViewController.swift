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
        aikSwitch?.on = isSubscribedToTopic(SNSTopicAIKArn)
        difSwitch?.on = isSubscribedToTopic(SNSTopicDIFArn)
    }
    
    @IBAction private func switchAIK() {
        if (aikSwitch?.on != isSubscribedToTopic(SNSTopicAIKArn)) {
            print("Switch AIK: \(aikSwitch?.on)")
            if aikSwitch != nil {
                let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                if aikSwitch!.on {
                    appDelegate.subscribeToTopic(SNSTopicAIKArn)
                } else {
                    appDelegate.unsubscribeFromTopic(SNSTopicAIKArn)
                }
            }
        }
    }

    @IBAction private func switchDIF() {
        if (difSwitch?.on != isSubscribedToTopic(SNSTopicDIFArn)) {
            print("Switch DIF: \(difSwitch?.on)")
            if difSwitch != nil {
                let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                if difSwitch!.on {
                    appDelegate.subscribeToTopic(SNSTopicDIFArn)
                } else {
                    appDelegate.unsubscribeFromTopic(SNSTopicDIFArn)
                }
            }
        }
    }
    
    private func isSubscribedToTopic(topicArn: String!) -> Bool {
        return NSUserDefaults.standardUserDefaults().objectForKey(topicArn) != nil
    }
}