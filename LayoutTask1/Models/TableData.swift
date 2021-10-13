//
//  TableData.swift
//  LayoutTask1
//
//  Created by ahmed on 10/10/2021.
//

import Foundation

class TableData {
    
    static func getData() -> [Data] {
        let data = [Data(image: "largeWalk", title: "Analyze your work", label: "Take a 30 second walk, and get immediate insights", buttonTitle: "walk"),
                    Data(image: "smallUpgradeToPro", title: "Upgrad to OneStep pro", label: "", buttonTitle: "Upgrade"),
                    Data(image: "goalIcon", title: "Set your physical therapy goals", label: "", buttonTitle: "Set")]
        return data
    }
}
