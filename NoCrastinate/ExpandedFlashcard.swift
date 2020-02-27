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
    
    var isDefHidden = false
    
    var isTermHidden = false
    
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
    
        
        //Hide Def label
        defLabel.textColor = UIColor(named: "flipColorBack")
        isDefHidden = true
    
        //Create tap recognition for defLabel
        let tapTerm = UITapGestureRecognizer(target: self, action: #selector(ExpandedFlashcard.tapTermFunction))
        termLabel.frame = defLabel.bounds
        termLabel.isUserInteractionEnabled = true
        termLabel.addGestureRecognizer(tapTerm)
        
        //Show Term label
        termLabel.textColor = UIColor(named: "titleColor")
        termLabel.backgroundColor = UIColor(named: "flipColorFront")
        isTermHidden = false

    }
    
    @IBAction func tapFunction(sender: UITapGestureRecognizer) {
        if isDefHidden == false{
            defLabel.textColor = UIColor(named: "flipColorBack")
            defLabel.backgroundColor = UIColor(named: "flipColorBack")
            isDefHidden = true
        }else{
            defLabel.textColor = UIColor(named: "titleColor")
            defLabel.backgroundColor = UIColor(named: "flipColorFront")
            isDefHidden = false
        }
        
    }
    @IBAction func tapTermFunction(sender: UITapGestureRecognizer) {
        if isTermHidden == false{
            termLabel.textColor = UIColor(named: "flipColorBack")
            termLabel.backgroundColor = UIColor(named: "flipColorBack")
            isTermHidden = true
        }else{
            termLabel.textColor = UIColor(named: "titleColor")
            termLabel.backgroundColor = UIColor(named: "flipColorFront")
            isTermHidden = false
        }
        
    }
}
