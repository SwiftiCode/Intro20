//
//  AddSalesViewController.swift
//  Intro20
//
//  Created by SwiftiCode on 16/8/16.
//  Copyright © 2016 SwiftiCode. All rights reserved.
//

import UIKit

class AddSalesViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var addSalesmanTextField: UITextField!
    @IBOutlet weak var addSalesTextField: UITextField!

    @IBOutlet weak var addSaveButton: UIBarButtonItem!

    var currentAddSalesRecord: SalesRecord?
    
    // MARK: Template
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sender as AnyObject? === addSaveButton {
            
            var mySalesman: String
            
            let nameCheck = addSalesmanTextField.text ?? ""
            
            if nameCheck.isEmpty {
                mySalesman = "No Name"
            } else {
                mySalesman = nameCheck
            }
            
            var mySales: Int
            
            let tempSales = addSalesTextField.text ?? ""
            
            if tempSales.isEmpty {
                mySales = 0
            } else {
                mySales = Int(tempSales)!
            }
            
            currentAddSalesRecord = SalesRecord(name: mySalesman, sales: mySales)
        }

    }
    
    
    @IBAction func cancelAddSales(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
    }

}
