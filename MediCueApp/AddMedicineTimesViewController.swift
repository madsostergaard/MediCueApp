//
//  AddMedicineTimesViewController.swift
//  MediCueApp
//
//  Created by Mads Østergaard on 08/06/2018.
//  Copyright © 2018 Mads Østergaard. All rights reserved.
//

import UIKit

class AddMedicineTimesViewController: UIViewController {

    var med: Medicine?{
        didSet{
            configureView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func configureView(){
        
        // input all the data recieved via segue in the view
        
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
