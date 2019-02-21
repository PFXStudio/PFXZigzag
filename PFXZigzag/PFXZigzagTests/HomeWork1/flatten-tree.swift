//
//  flatten-tree.swift
//  PFXZigzag
//
//  Created by PFXStudio on 2019. 2. 21..
//  Copyright © 2019년 PFXStudio. All rights reserved.
//

import UIKit

class flatten_tree: NSObject {
    override init() {
        super.init()
        
        guard let path = Bundle.main.path(forResource: "categories", ofType: "json") else {
            return
        }

        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            if let jsonResult = jsonResult as? Dictionary<String, AnyObject> {
                let results = self.solution(jsonResult)
                for i in results {
                    print(i)
                }
                
                print("end")
            }
        } catch {
        }

    }
    
    class Info: NSObject {
        var key = ""
    }
    
    public func solution(_ dict: Dictionary<String, AnyObject>) -> [String] {
        var results = [String]()
        for key in dict.keys {
            guard let childDict = dict[key] as? Dictionary<String, AnyObject> else {
                return []
            }
            
            let parentInfo = Info()
            parentInfo.key = key
            self.recursive(parentInfo: parentInfo, dict: childDict, results:&results)
        }
        
        return results.sorted() { $0 < $1 }
    }
    
    func recursive(parentInfo: Info, dict: Dictionary<String, AnyObject>?, results: inout [String]) {
        guard let childDict = dict else {
            // deps strings
            results.append(parentInfo.key)
            return
        }
        
        if childDict.count <= 0 {
            // deps strings
            results.append(parentInfo.key)
            return
        }
        
        for key in childDict.keys {
            let info = Info()
            info.key = parentInfo.key + " > " + key
            let value = childDict[key]
            recursive(parentInfo: info, dict: (value as! Dictionary<String, AnyObject>), results:&results)
        }
    }
}
