//
//  SalesData.swift
//  Intro20
//
//  Created by SwiftiCode on 16/8/16.
//  Copyright © 2016 SwiftiCode. All rights reserved.
//

import Foundation


// MARK: Data Structure
// Data structure to record sales made by each person
struct SalesRecord {
    
    var name: String
    var sales: Int
     
}

// MARK: Data Collection
var teamSalesData = [SalesRecord]()


// MARK: Helper program to load sample data
func loadSampleSales() {
    
    let sales1 = SalesRecord(name: "Salesman 1", sales: 0)
    let sales2 = SalesRecord(name: "Salesman 2", sales: 10)
    let sales3 = SalesRecord(name: "Salesman 3", sales: 100)
    
    teamSalesData += [sales1, sales2, sales3]
}

