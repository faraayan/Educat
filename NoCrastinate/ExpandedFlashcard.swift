//
//  ExpandedFlashcard.swift
//  CleverStudy
//
//  Created by Fara Yan on 10/27/19.
//  Copyright © 2019 Fara Yan. All rights reserved.
//

import UIKit
var myIndex = 0
class ExpandedFlashcard: UIViewController {
    
    @IBAction func Cancel(_ sender: Any) {
    }
    @IBOutlet weak var term: UILabel!
    
    @IBOutlet weak var def: UILabel!
    
    @IBOutlet weak var termLabel: UILabel!
    
    
    @IBOutlet weak var defLabel: UILabel!
    
    @IBOutlet weak var rememberLabel: UILabel!
    
    @IBAction func didNotRemember(_ sender: Any) {
        remembered[whichFolder][whichFlashcard] = -1
        UserDefaults.standard.set(remembered, forKey: "remembered")
        print(remembered)
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func didRemember(_ sender: Any) {
        remembered[whichFolder][whichFlashcard] = 1
        UserDefaults.standard.set(remembered, forKey: "remembered")
        print(remembered)
        dismiss(animated: true, completion: nil)
        
    }
   override func viewDidLoad() {
        super.viewDidLoad()
    print(myIndex)
    termLabel.text = flashcardsTerm[whichFolder][whichFlashcard]
    defLabel.text = flashcardsDef[whichFolder][whichFlashcard]
    }

}
