//
//  alter-date-format.swift
//  PFXZigzag
//
//  Created by PFXStudio on 2019. 2. 21..
//  Copyright © 2019년 PFXStudio. All rights reserved.
//

import UIKit

class alter_date_format: NSObject {
    override init() {
        super.init()
        print(self.solution("PM 01:00:00", 10))
        print(self.solution("PM 11:59:59", 1))
        print(self.solution("AM 12:10:00", 40))
        print(self.solution("AM 05:24:03", 102392))

        print("end")
    }
    
    public func solution(_ text: String, _ addSecond: Int) -> String {
        
        return ""
    }
}
