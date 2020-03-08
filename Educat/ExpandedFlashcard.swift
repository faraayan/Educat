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
    @IBOutlet weak var defScrollView: UIScrollView!
    @IBOutlet weak var termScrollView: UIScrollView!
    
    var isDefHidden = false
    var isTermHidden = false
    
    //If not in study mode, display is dismissed. Otherwise, display will continue to show the rest of the flashcards in order.
    func toNextFlashcard(){
        if isInStudyMode == true{
            whichFlashcard+=1
            if whichFlashcard < flashcardsTerm[whichFolder].count{
                resetFlashcardShowAndHide()
                termLabel.text = flashcardsTerm[whichFolder][whichFlashcard]
                defLabel.text = flashcardsDef[whichFolder][whichFlashcard]
            }else{
                isInStudyMode = false
                dismiss(animated: true, completion: nil)
            }
        }
        else{
            dismiss(animated: true, completion: nil)
        }
    }
    
    //"X" Button
    @IBAction func didNotRemember(_ sender: Any) {
        remembered[whichFolder][whichFlashcard] = -1
        UserDefaults.standard.set(remembered, forKey: "remembered")
        toNextFlashcard()
    }
    
    //checkmark Button
    @IBAction func didRemember(_ sender: Any) {
        remembered[whichFolder][whichFlashcard] = 1
        UserDefaults.standard.set(remembered, forKey: "remembered")
        toNextFlashcard()
    }
    
   override func viewDidLoad() {
        super.viewDidLoad()
        termLabel.text = flashcardsTerm[whichFolder][whichFlashcard]
        defLabel.text = flashcardsDef[whichFolder][whichFlashcard]
    
        //Create tap recognition for defLabel
        let tap = UITapGestureRecognizer(target: self, action: #selector(ExpandedFlashcard.tapFunction))
        defLabel.numberOfLines = 0;
        defLabel.isUserInteractionEnabled = true
        defLabel.addGestureRecognizer(tap)
        defScrollView.addGestureRecognizer(tap)
        
        //Hide Def label
        defLabel.textColor = UIColor(named: "flipColorBack")
        isDefHidden = true
    
        //Create tap recognition for defLabel
        let tapTerm = UITapGestureRecognizer(target: self, action: #selector(ExpandedFlashcard.tapTermFunction))
        termLabel.frame = defLabel.bounds
        termLabel.isUserInteractionEnabled = true
        termLabel.addGestureRecognizer(tapTerm)
        termScrollView.addGestureRecognizer(tapTerm)
        
        //Show Term label
        termLabel.textColor = UIColor(named: "titleColor")
        termLabel.backgroundColor = UIColor(named: "flipColorFront")
        isTermHidden = false
    
        defScrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: defLabel.bottomAnchor).isActive = true
        defScrollView.isScrollEnabled = false
        
        termScrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: termLabel.bottomAnchor).isActive = true
        termScrollView.isScrollEnabled = true
    }
    
    //Resets the settings for showing the term/definition
    func resetFlashcardShowAndHide(){
        termLabel.textColor = UIColor(named: "titleColor")
        termLabel.backgroundColor = UIColor(named: "flipColorFront")
        isTermHidden = false
        defLabel.textColor = UIColor(named: "flipColorBack")
        defLabel.backgroundColor = UIColor(named: "flipColorBack")
        defScrollView.backgroundColor = UIColor(named: "flipColorBack")
        isDefHidden = true
        defScrollView.isScrollEnabled = false
        
        termScrollView.backgroundColor = UIColor(named: "flipColorFront")
        termScrollView.isScrollEnabled = true
    }
    
    //Makes the flashcard definition hide/show when tapped
    @IBAction func tapFunction(sender: UITapGestureRecognizer) {
        if isDefHidden == false{
            defLabel.textColor = UIColor(named: "flipColorBack")
            defLabel.backgroundColor = UIColor(named: "flipColorBack")
            defScrollView.backgroundColor = UIColor(named: "flipColorBack")
            defScrollView.isScrollEnabled = false
            isDefHidden = true
        }else{
            defScrollView.backgroundColor = UIColor(named: "flipColorFront")
            defLabel.textColor = UIColor(named: "titleColor")
            defLabel.backgroundColor = UIColor(named: "flipColorFront")
            defScrollView.backgroundColor = UIColor(named: "flipColorFront")
            isDefHidden = false
        }
    }
    
    //Makes the flashcard term hide/show when tapped
    @IBAction func tapTermFunction(sender: UITapGestureRecognizer) {
        if isTermHidden == false{
            termLabel.textColor = UIColor(named: "flipColorBack")
            termLabel.backgroundColor = UIColor(named: "flipColorBack")
            termScrollView.backgroundColor = UIColor(named: "flipColorBack")
            termScrollView.isScrollEnabled = false
            isTermHidden = true
        }else{
            termLabel.textColor = UIColor(named: "titleColor")
            termScrollView.isScrollEnabled = true
            termScrollView.backgroundColor = UIColor(named: "flipColorFront")
            termLabel.backgroundColor = UIColor(named: "flipColorFront")
            isTermHidden = false
        }
    }
}
