//
//  CalendarViewController.swift
//  MediCueApp
//
//  Created by Mads Østergaard on 07/06/2018.
//  Copyright © 2018 Mads Østergaard. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {

    @IBOutlet weak var tuesdayLabel: UILabel!
    @IBOutlet weak var mondayLabel: UILabel!
    @IBOutlet weak var wedLabel: UILabel!
    @IBOutlet weak var thursLabel: UILabel!
    @IBOutlet weak var fridayLabel: UILabel!
    @IBOutlet weak var sundayLabel: UILabel!
    @IBOutlet weak var saturdayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: self, action: #selector(CalendarViewController.tapFunction(sender:)))
        tuesdayLabel.addGestureRecognizer(tap)
        mondayLabel.addGestureRecognizer(tap)
        wedLabel.addGestureRecognizer(tap)
        thursLabel.addGestureRecognizer(tap)
        sundayLabel.addGestureRecognizer(tap)
        saturdayLabel.addGestureRecognizer(tap)
    }
    
    @objc func tapFunction(sender:UITapGestureRecognizer){
        print("Tabbed: \(sender.description)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
