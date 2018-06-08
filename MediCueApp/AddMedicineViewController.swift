//
//  AddMedicineViewController.swift
//  MediCueApp
//
//  Created by Mads Østergaard on 08/06/2018.
//  Copyright © 2018 Mads Østergaard. All rights reserved.
//

import UIKit

class AddMedicineViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var startDateTextField: UITextField!
    @IBOutlet weak var typeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var packageCountTextField: UITextField!
    @IBOutlet weak var activateEndDateSwitch: UISwitch!
    @IBOutlet weak var endDateTextField: UITextField!
    
    @IBAction func activateChanged(_ sender: Any) {
        if activateEndDateSwitch.isOn{
            print("IsON!")
            //endDateTextField.isUserInteractionEnabled = true
            endDateTextField.isEnabled = true
        } else{
            print("isOFF!")
            endDateTextField.isEnabled = false
            //endDateTextField.isUserInteractionEnabled = false
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        let beginDatePicker = UIDatePicker()
        let endDatePicker = UIDatePicker()
        
        beginDatePicker.datePickerMode = UIDatePickerMode.date
        endDatePicker.datePickerMode = UIDatePickerMode.date
        
        beginDatePicker.addTarget(self, action: #selector(AddMedicineViewController.startDatePickerValueChanged(sender:)), for: UIControlEvents.valueChanged)
        
        endDatePicker.addTarget(self, action: #selector(AddMedicineViewController.endDatePickerValueChanged(sender:)), for: UIControlEvents.valueChanged)
        
        startDateTextField.inputView = beginDatePicker
        endDateTextField.inputView = endDatePicker
        
        // Do any additional setup after loading the view.
    }
    
    @objc func startDatePickerValueChanged(sender: UIDatePicker){
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.medium
        formatter.timeStyle = DateFormatter.Style.none
        startDateTextField.text = formatter.string(from: sender.date)
    }
    
    @objc func endDatePickerValueChanged(sender: UIDatePicker){
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.medium
        formatter.timeStyle = DateFormatter.Style.none
        endDateTextField.text = formatter.string(from: sender.date)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
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
