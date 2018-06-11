//
//  MedicineTableViewController.swift
//  MediCueApp
//
//  Created by Mads Østergaard on 07/06/2018.
//  Copyright © 2018 Mads Østergaard. All rights reserved.
//

import UIKit
import Firebase

class MedicineTableViewController: UITableViewController {
    
    var medArr = [Medicine]()
    var ref: DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        ref.observe(.value, with: { snapshot -> Void in
            var tempMeds: [Medicine] = []
            
            for item in snapshot.children{
                let newMed = Medicine(snapshot: item as! DataSnapshot)
                
                tempMeds.append(newMed)
            }
            
            self.medArr = tempMeds
            self.tableView.reloadData()
        })
        
        
        //fillPills()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func save(medicine: Medicine){
        ref.childByAutoId().setValue(medicine.toAnyObject())
    }
    
    func fillPills(){
        var medtimes = MedicineTimes.init()
        medtimes.morning = 1
        medtimes.evening = 2
        medtimes.frequency = MedicineTimes.interval.daily
        
        let med = Medicine(name: "Panodil", size: 20, date: Date(timeIntervalSinceNow: 0), medType: Medicine.MedicineType.pill, medTimes: medtimes)

        save(medicine: med!)
        sortPills()
    }
    
    func sortPills(){
        medArr.sort { (medArr1, medArr2) -> Bool in
            //if medArr1.name != medArr2.name{
                return medArr1.name < medArr2.name
            //}
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return medArr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "medsCell", for: indexPath)

        cell.textLabel?.text = medArr[indexPath.row].name
        cell.detailTextLabel?.text = "hahahahah"

        return cell
    }
    
    @IBAction func unwindToMedicineTableView(segue: UIStoryboardSegue){
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
