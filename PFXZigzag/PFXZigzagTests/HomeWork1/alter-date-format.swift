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
    
    public func solution(_ p: String, _ n: Int) -> String {
        guard n <= 200000 else { return "" }
        
        let tokens = p.components(separatedBy: " ")
        let pm = tokens[0]
        let times = tokens[1].components(separatedBy: ":")
        let hhText = times[0]
        var defaultHour = 0
        if pm.lowercased() == "pm" && hhText != "12" {
            defaultHour = 12
        }
        
        let mmText = times[1]
        let ssText = times[2]
        
        var totalSecond = (defaultHour * 3600) + (Int(hhText)! * 3600) + (Int(mmText)! * 60) + Int(ssText)!
        totalSecond = totalSecond + n
        var hh = totalSecond / 3600
        hh = min(hh, hh % 24)
        
        let mm = (totalSecond % 3600) / 60
        let ss = (totalSecond % 3600) % 60
        
        let resultHH = hh < 10 ? "0" + String(hh) : String(hh)
        let resultMM = mm < 10 ? "0" + String(mm) : String(mm)
        let resultSS = ss < 10 ? "0" + String(ss) : String(ss)
        
        return resultHH + ":" + resultMM + ":" + resultSS
    }
}
