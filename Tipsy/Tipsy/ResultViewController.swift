//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Puja Kalpesh Surve on 25/11/21.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var lblSplitDescription: UILabel!
    
    var total = 0.0
    var discription = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        lblTotal.text = String(format: "%.2f", total)
        lblSplitDescription.text = discription
    }
    
    @IBAction func btnRecalculateTapped(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
    }
    
   }
