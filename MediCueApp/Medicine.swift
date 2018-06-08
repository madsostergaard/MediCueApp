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
    var size: Int
    
    
    init(name: String){
        self.name = name
        self.size = 10
    }
}
