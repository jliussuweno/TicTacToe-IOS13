//
//  FirstViewController.swift
//  Day2BIT14
//
//  Created by Jlius Suweno on 30/09/20.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var fieldText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myLabel.text = "Input Text:"
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//    }
//    
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//    }

    @IBAction func buttonOKClicked(_ sender: UIButton) {
        myLabel.text = fieldText.text
    }
    
}

