//
//  Medicine.swift
//  MediCueApp
//
//  Created by Mads Østergaard on 08/06/2018.
//  Copyright © 2018 Mads Østergaard. All rights reserved.
//

import Foundation
import Firebase

class Medicine: NSObject{
    var name: String
    var size: Int?
    var date: Date?
    var morgen: Int?
    var formiddag: Int?
    var middag: Int?
    var eftermiddag: Int?
    var aften: Int?
    enum type{
        case injektion, tablet, kapsel
    }
    enum interval {
        case dagligt, hver2dag, ugentligt
    }
    
    init?(name: String){
        self.name = name
        
        guard !name.isEmpty else {
            return nil
        }
    }
}
