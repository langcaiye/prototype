//
//  GetData.swift
//  prototype
//
//  Created by Star on 14-9-14.
//  Copyright (c) 2014年 langcaiye. All rights reserved.
//

import Foundation

protocol DataGeterProtcol {
    func didReceiveAPIResults(results:NSMutableDictionary)
}


class DataGeter{
    
    var delegate: DataGeterProtcol?
    init() {
    }
    
    
    func getDataFor() {
        var results = NSMutableDictionary(object: "Lansing", forKey: "name");
        self.delegate?.didReceiveAPIResults(results)
    }
    
}