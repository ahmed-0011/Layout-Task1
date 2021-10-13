//
//  Data.swift
//  LayoutTask1
//
//  Created by ahmed on 10/10/2021.
//

import Foundation

struct Data {
    var image: String?
    var title: String?
    var label: String?
    var buttonTitle: String?
    
    init(image: String?, title: String?, label: String?, buttonTitle: String?) {
        self.image = image
        self.title = title
        self.label = label
        self.buttonTitle = buttonTitle
    }
    
    init() {
        image = ""
        title = ""
        label = ""
        buttonTitle = ""
    }
}
