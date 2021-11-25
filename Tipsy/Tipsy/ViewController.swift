//
//  ViewController.swift
//  Tipsy
//
//  Created by Puja Kalpesh Surve on 25/11/21.
//

import UIKit

class ViewController: UIViewController {
     
    @IBOutlet weak var txtBillDisplay: UITextField!
    @IBOutlet weak var lblSplitNum: UILabel!
    
    var tip = 0.0
    var percentValue = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtBillDisplay.becomeFirstResponder()
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let str = String(format: "%.0f", sender.value)
        lblSplitNum.text = str
        
    }
    
    @IBAction func btnPercentageSelection(_ sender: UIButton) {
       
        percentValue = sender.currentTitle ?? ""
        let bill = Double(txtBillDisplay.text ?? "") ?? 0.0
        
        
        if percentValue == "0%" {
            tip = 0.0
        } else if percentValue == "10%" {
            tip = bill * 0.1
        } else {
            tip = bill * 0.2
        }
        
    }
    
    @IBAction func btnCalculateTapped(_ sender: UIButton) {
        
        let bill = Double(txtBillDisplay.text ?? "") ?? 0.0
        let totalBill = tip + bill
        let splitBill = totalBill / (Double(lblSplitNum.text ?? "") ?? 1.0)
        
        
        let story = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        
        vc.total = splitBill
        vc.discription = "Bill split between \(lblSplitNum.text ?? "") people with \(percentValue) tip"
        navigationController?.pushViewController(vc, animated: true)
        
    }


}

