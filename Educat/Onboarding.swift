//
//  Onboarding.swift
//  Educat
//
//  Created by Fara Yan on 2/29/20.
//  Copyright © 2020 Fara Yan. All rights reserved.
//

import Foundation
import UIKit
import paper_onboarding

var completeOnboarding: Bool = false
let screenRect = UIScreen.main.bounds
let screenWidth = screenRect.size.width
let button = UIButton(frame: CGRect(x: screenWidth-100, y: 60, width: 80, height: 50))

class Onboarding: UIViewController{
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.value(forKey: "completeOnboarding") as? Bool == true{
            performSegue(withIdentifier: "toApp", sender: self)
        }
        super.viewDidAppear(animated)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.value(forKey: "completeOnboarding") as? Bool == false{
            completeOnboarding = UserDefaults.standard.object(forKey: "completeOnboarding") as? Bool ?? false
            UserDefaults.standard.set(completeOnboarding, forKey: "completeOnboarding")
        }
          let onboarding = PaperOnboarding()
          onboarding.dataSource = self
          onboarding.translatesAutoresizingMaskIntoConstraints = false
          view.addSubview(onboarding)

          // add constraints
        for attribute: NSLayoutConstraint.Attribute in [.left, .right, .top, .bottom] {
            let constraint = NSLayoutConstraint(item: onboarding,
                                                attribute: attribute,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: attribute,
                                                multiplier: 1,
                                                constant: 0)
            view.addConstraint(constraint)
        }
            button.backgroundColor = UIColor(named:"transparentWhite")
            button.setTitleColor(UIColor(named: "navigationColor"), for: .normal)
            button.setTitle(NSLocalizedString("skip", comment: ""), for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = true
            button.titleLabel?.font =  UIFont(name: "avenir-medium", size: 20)
            button.layer.cornerRadius = 5
            button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
            view.addSubview(button)
    }
    @objc func buttonClicked(sender : UIButton){
        completeOnboarding = true
        UserDefaults.standard.set(completeOnboarding, forKey: "completeOnboarding")
        performSegue(withIdentifier: "toApp", sender: nil)
    }
}

//Set content for onboarding screen
extension Onboarding: PaperOnboardingDataSource {
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        let bgOne = UIColor(named:"onboardOneColor")!
        let bgTwo = UIColor(named:"onboardTwoColor")!
        let bgThree = UIColor(named:"onboardThreeColor")!
        let bgFour = UIColor(named:"onboardFourColor")!
        let bgFive = UIColor(named:"onboardFiveColor")!
        let bgSix = UIColor(named:"onboardSixColor")!
        let bgSeven = UIColor(named:"onboardSevenColor")!
        
        let mainFont = UIFont(name: "Avenir-Black", size: 30)!
        let descFont = UIFont(name: "Avenir-Medium", size: 17)!
        var onboardingViews: [OnboardingItemInfo] = []
        
        onboardingViews.append(OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "Checkmark"), title: "Welcome!", description: "Educat is an app to help you learn more efficiently. \n\n(Swipe left and right!)", pageIcon: #imageLiteral(resourceName: "dot"), color: bgOne, titleColor: UIColor(named:"navigationColor")!, descriptionColor: UIColor(named:"navigationColor")!, titleFont: mainFont, descriptionFont: descFont))
        
        onboardingViews.append(OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "onboardTwoTwo"), title: "The Forgetting Curve", description: "The forgetting curve displays patterns of human memory. Following this information can help the brain memorize information more effectively! \n\nEducat uses the forgetting curve to make studying as time-efficient as possible!", pageIcon: #imageLiteral(resourceName: "dot"), color: bgTwo, titleColor: UIColor(named:"navigationColor")!, descriptionColor: UIColor(named:"navigationColor")!, titleFont: mainFont, descriptionFont: descFont))
        
        onboardingViews.append(OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "onboardThree"), title: "Analytics", description: "Educat includes an Analytics page in the app, where it takes the folder length, words, and time spent on a study set into account to compute a recommended study time!", pageIcon: #imageLiteral(resourceName: "dot"), color: bgThree, titleColor: UIColor(named:"navigationColor")!, descriptionColor: UIColor(named:"navigationColor")!, titleFont: mainFont, descriptionFont: descFont))
        
        onboardingViews.append(OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "onboardFour"), title: "Extra Tips:", description: "When using a flashcard, click the checkmark if you remembered the information correctly, and click the " + "\"" + "x" + "\"" + " mark if you did not!", pageIcon: #imageLiteral(resourceName: "dot"), color: bgFour, titleColor: UIColor(named:"navigationColor")!, descriptionColor: UIColor(named:"navigationColor")!, titleFont: mainFont, descriptionFont: descFont))
        
        onboardingViews.append(OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "onboardFive"), title: "Extra Tips: pt.2", description: "A dot next to each flashcard marks which topics to spend more time on!", pageIcon: #imageLiteral(resourceName: "dot"), color: bgFive, titleColor: UIColor(named:"navigationColor")!, descriptionColor: UIColor(named:"navigationColor")!, titleFont: mainFont, descriptionFont: descFont))
        
        onboardingViews.append(OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "onboardSix"), title: "Extra Tips: pt.3", description: "Once you make a study set, long hold on the screen to see how much you've studied a set that week!", pageIcon: #imageLiteral(resourceName: "dot"), color: bgSix, titleColor: UIColor(named:"navigationColor")!, descriptionColor: UIColor(named:"navigationColor")!, titleFont: mainFont, descriptionFont: descFont))
        
        onboardingViews.append(OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "onboardSeven"), title: "Let's do this!", description: "Press " + "\"" + "skip" + "\"" + " to begin!", pageIcon: #imageLiteral(resourceName: "dot"), color: bgSeven, titleColor: UIColor(named:"navigationColor")!, descriptionColor: UIColor(named:"navigationColor")!, titleFont: mainFont, descriptionFont: descFont))
        return onboardingViews[index]
        }
    
    //How many onboarding screens
    func onboardingItemsCount() -> Int {
        return 7
    }
}
