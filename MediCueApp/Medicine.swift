//
//  Medicine.swift
//  MediCueApp
//
//  Created by Mads Østergaard on 08/06/2018.
//  Copyright © 2018 Mads Østergaard. All rights reserved.
//

import Foundation
import Firebase

struct MedicineTimes {
    var morning: Int?
    var lateMorning: Int?
    var midday: Int?
    var afternoon: Int?
    var evening: Int?
    var frequency: interval?
    
    enum interval: String {
        case daily, secondDay, weekly
    }
}

class Medicine: NSObject{
    var name: String
    var size: Int?{
        didSet{
            if let num = size{
                pillState = num
            }
        }}
    var pillState: Int?{
        didSet{
            if let num = size, let val = pillState {
                if Double(val) <= (0.2 * Double(num)){
                    buyNewMeds = true
                } else{
                    buyNewMeds = false
                }
            }
        }
    }
    var date: Date?
    var endDate: Date? = Date.distantFuture
    var times: MedicineTimes?
    var medType: MedicineType?
    var buyNewMeds: Bool = false
    
    enum MedicineType: String{
        case injektion, tablet, pill
    }
    
    init?(name: String){
        self.name = name
        
        guard !name.isEmpty else {
            return nil
        }
        
        if let num = size{
            pillState = num
        }
    }
    
    init?(name: String, size: Int, date: Date, endDate: Date, medType: MedicineType){
        self.name = name
        
        guard !name.isEmpty else {
            return nil
        }
        
        self.size = size
        self.date = date
        self.endDate = endDate
        self.medType = medType
    }
    
    init?(name: String, size: Int, date: Date, medType: MedicineType){
        self.name = name
        
        guard !name.isEmpty else {
            return nil
        }
        
        self.size = size
        self.date = date
        self.medType = medType
    }
    
    init(snapshot: DataSnapshot){
        let snapshotValues = snapshot.value as! [String : AnyObject]
        name = snapshotValues["name"] as! String
        size = snapshotValues["size"] as? Int
        
        // get Date strings
        let startDateString = snapshotValues["startDate"] as! String
        let endDateString = snapshotValues["endDate"] as! String
        // format to Date object:
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.medium
        formatter.timeStyle = DateFormatter.Style.none
        
        // save to date objects
        date = formatter.date(from: startDateString)
        endDate = formatter.date(from: endDateString)
        
        let typeString = snapshotValues["medType"] as! String
        if typeString == MedicineType.injektion.rawValue{
            medType = MedicineType.injektion
        } else if typeString == MedicineType.pill.rawValue{
            medType = MedicineType.pill
        } else{
            medType = MedicineType.tablet
        }
        
        // get the medicine times:
        let medtimesValues = snapshot.value(forKey: "medTimes") as! [String: AnyObject]
        var newTimes = MedicineTimes.init()
        newTimes.afternoon = medtimesValues["afternoon"] as? Int
        newTimes.evening = medtimesValues["evening"] as? Int
        let freqString = medtimesValues["frequency"] as! String
        if freqString == MedicineTimes.interval.daily.rawValue{
            newTimes.frequency = MedicineTimes.interval.daily
        } else if freqString == MedicineTimes.interval.secondDay.rawValue{
            newTimes.frequency = MedicineTimes.interval.secondDay
        } else {
            newTimes.frequency = MedicineTimes.interval.weekly
        }
        newTimes.lateMorning = medtimesValues["lateMorning"] as? Int
        newTimes.midday = medtimesValues["midday"] as? Int
        newTimes.morning = medtimesValues["morning"] as? Int
        
        // save the times in the object
        times = newTimes
    }
    
    func toAnyObject() -> Any {
        return [
            "name": name,
            "size": size!,
            "startDate" : date!,
            "endDate" : endDate!,
            "medType" : medType!,
            "medTimes" : [
                "morning" : times!.morning!,
                "lateMorning" : times!.lateMorning!,
                "midday" : times!.midday!,
                "afternoon" : times!.afternoon!,
                "evening": times!.evening!,
                "frequency" : times!.frequency!
            ]
        ]
    }
}
