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
                print(jsonResult)
                print(self.solution(""))
                print("end")
            }
        } catch {
        }

    }
    
    public func solution(_ text: String) -> [Int] {
        
        return []
    }
}
