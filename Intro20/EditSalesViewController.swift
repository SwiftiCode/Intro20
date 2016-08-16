//
//  EditSalesViewController.swift
//  Intro20
//
//  Created by SwiftiCode on 16/8/16.
//  Copyright © 2016 SwiftiCode. All rights reserved.
//

import UIKit

class EditSalesViewController: UIViewController {
    
    
    // MARK: Properties
    @IBOutlet weak var salesmanTextField: UITextField!
    @IBOutlet weak var salesAmountTextField: UITextField!
    
    @IBOutlet weak var editSaveButton: UIBarButtonItem!
    
    var currentSalesToEdit: SalesRecord?
    
    // MARK: Template
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let gotSalesToEdit = currentSalesToEdit {
            
            salesmanTextField.text = gotSalesToEdit.name
            salesAmountTextField.text = String(gotSalesToEdit.sales)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if sender === editSaveButton {
            
            var mySalesman: String
            
            let nameCheck = salesmanTextField.text ?? ""
            
            if nameCheck.isEmpty {
                mySalesman = "No Name"
            } else {
                mySalesman = nameCheck
            }
            
            var mySales: Int
            
            let tempSales = salesAmountTextField.text ?? ""
            
            if tempSales.isEmpty {
                mySales = 0
            } else {
                mySales = Int(tempSales)!
            }
            
            currentSalesToEdit = SalesRecord(name: mySalesman, sales: mySales)
        }
    }
    

}
