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
    
    @IBOutlet weak var term: UILabel!
    
    @IBOutlet weak var def: UILabel!
    
    @IBOutlet weak var termLabel: UILabel!
    
    @IBOutlet weak var defLabel: UILabel!
    
    @IBOutlet weak var rememberLabel: UILabel!
    
    var isHidden = false
    
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
        termLabel.text = flashcardsTerm[whichFolder][whichFlashcard]
        defLabel.text = flashcardsDef[whichFolder][whichFlashcard]
    
        //Create tap recognition for defLabel
        let tap = UITapGestureRecognizer(target: self, action: #selector(ExpandedFlashcard.tapFunction))
        defLabel.frame = defLabel.bounds
        defLabel.isUserInteractionEnabled = true
        defLabel.addGestureRecognizer(tap)
    
        
        //Hide label
        defLabel.textColor = UIColor(named: "flipColorBack")
        isHidden = true
    
        //Create tap recognition for defLabel
        let tapTerm = UITapGestureRecognizer(target: self, action: #selector(ExpandedFlashcard.tapTermFunction))
        termLabel.frame = defLabel.bounds
        termLabel.isUserInteractionEnabled = true
        termLabel.addGestureRecognizer(tapTerm)
        
        //Hide label
        termLabel.textColor = UIColor(named: "flipColorBack")
        isHidden = true

    }
    
    @IBAction func tapFunction(sender: UITapGestureRecognizer) {
        if isHidden == false{
            defLabel.textColor = UIColor(named: "flipColorBack")
            defLabel.backgroundColor = UIColor(named: "flipColorBack")
            isHidden = true
        }else{
            defLabel.textColor = UIColor(named: "titleColor")
            defLabel.backgroundColor = UIColor(named: "flipColorFront")
            isHidden = false
        }
        
    }
    @IBAction func tapTermFunction(sender: UITapGestureRecognizer) {
        if isHidden == false{
            termLabel.textColor = UIColor(named: "flipColorBack")
            termLabel.backgroundColor = UIColor(named: "flipColorBack")
            isHidden = true
        }else{
            termLabel.textColor = UIColor(named: "titleColor")
            termLabel.backgroundColor = UIColor(named: "flipColorFront")
            isHidden = false
        }
        
    }
}
