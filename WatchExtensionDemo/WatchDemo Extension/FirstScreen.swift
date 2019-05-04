//
//  FirstScreen.swift
//  WatchExtensionDemo
//
//  Created by Suman on 5/3/17.
//  Copyright © 2017 Suman. All rights reserved.
//

import WatchKit
import Foundation

class FirstScreen: WKInterfaceController {
    @IBOutlet var tblFirstScreen: WKInterfaceTable!
    let swiftBlogs = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "W", "X", "Y", "Z"]
    
    override func awake(withContext context: Any?){
        super.awake(withContext: context)
        tblFirstScreen.setNumberOfRows(swiftBlogs.count, withRowType: "CellFirstScreen")
    }

    override func willActivate(){
        loadTableData()
        super.willActivate()
    }

    override func didDeactivate() {
        super.didDeactivate()
    }

    func loadTableData(){
        for index in 0 ..< tblFirstScreen.numberOfRows{
            let objCellFirstScreen = tblFirstScreen.rowController(at: index ) as! CellFirstScreen
            objCellFirstScreen.rowDescription.setText(swiftBlogs[index])
            objCellFirstScreen.rowImage.setImageNamed("Logo")
            objCellFirstScreen.groupImgBg.setBackgroundColor(UIColor.red)
        }
    }
}
