//
//  ViewController.swift
//  MediCueApp
//
//  Created by Mads Østergaard on 07/06/2018.
//  Copyright © 2018 Mads Østergaard. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ESTTriggerManagerDelegate {

    let triggerManager = ESTTriggerManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.triggerManager.delegate = self
        
        /*
            The following creates two rules ands appends them to a trigger.
         
            It should be possible to add multiple triggers to the triggerManager
         
            The trigger then fires the code in triggerManager...
         
         Possible (useful) rules are:
            - ESTDateRule (based on time)
            - ESTProximityRule (based on proximity)
            - ESTNearableRule
        */
        
        // create rules: (DON'T RUN - DOESN'T WORK)
        let rule1 = ESTOrientationRule.orientationEquals(
            .horizontalUpsideDown, for: .bag)
        
        let rule2 = ESTMotionRule.motionStateEquals(
            true, forNearableIdentifier: "54b128ebbc420d35")
        
        // add rules to a trigger!
        let trigger = ESTTrigger(rules: [rule1, rule2], identifier: "tom the trigger")
        
        self.triggerManager.startMonitoring(for: trigger)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func triggerManager(_ manager: ESTTriggerManager,
                        triggerChangedState trigger: ESTTrigger) {
        if (trigger.identifier == "tom the trigger" && trigger.state == true) {
            print("Hello, digital world! The physical world has spoken.")
        } else {
            print("Goodnight. <spoken in the voice of a turret from Portal>")
        }
    }


}

