//
//  Extensions.swift
//  Test
//
//  Created by iMac on 31/08/21.
//

import Foundation
import UIKit

extension UITextField{
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        showDoneButtonOnKeyboard()
    }
    @objc func btnBarDoneAction() { self.resignFirstResponder() }
    func showDoneButtonOnKeyboard() {
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(resignFirstResponder))
        
        var toolBarItems = [UIBarButtonItem]()
        toolBarItems.append(flexSpace)
        toolBarItems.append(doneButton)
        
        let doneToolbar = UIToolbar()
        doneToolbar.items = toolBarItems
        doneToolbar.sizeToFit()
        
        inputAccessoryView = doneToolbar
    }
        
}
