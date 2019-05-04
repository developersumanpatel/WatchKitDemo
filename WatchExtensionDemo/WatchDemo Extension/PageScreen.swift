//
//  PageScreen.swift
//  WatchExtensionDemo
//
//  Created by Suman on 5/3/17.
//  Copyright © 2017 Suman. All rights reserved.
//

import WatchKit
import Foundation

class PageScreen: WKInterfaceController {
    @IBOutlet var groupImg: WKInterfaceGroup!
    @IBOutlet var imgView: WKInterfaceImage!
    @IBOutlet var lblColor: WKInterfaceLabel!
    @IBOutlet var tapGesture: WKTapGestureRecognizer!

    var tapID:Int = 0
    let aryColor:[UIColor] = [UIColor.red, UIColor.blue, UIColor.green, UIColor.purple, UIColor.yellow]
    let aryTitle:[String] = ["Red", "Blue", "Green", "Purple", "Yellow"]
    
    override func awake(withContext context: Any?){
        super.awake(withContext: context)
    }

    override func willActivate(){
        tapID = 0
        self.lblColor.setText(aryTitle[tapID])
        self.groupImg.setBackgroundColor(aryColor[tapID])
        super.willActivate()
    }

    override func didDeactivate(){
        super.didDeactivate()
    }
    
    @IBAction func tap(_ sender: Any){
        tapID = tapID + 1
        if tapID > aryColor.count - 1{
            tapID = 0
        }
        self.lblColor.setText(aryTitle[tapID])
        self.groupImg.setBackgroundColor(aryColor[tapID])
    }
}
