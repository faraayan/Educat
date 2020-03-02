//
//  Onboarding.swift
//  NoCrastinate
//
//  Created by Fara Yan on 2/29/20.
//  Copyright © 2020 Fara Yan. All rights reserved.
//

import Foundation
import UIKit
import paper_onboarding
var completeOnboarding: Bool = false

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
        let button = UIButton(frame: CGRect(x: 270, y: 80, width: 80, height: 50))
            button.backgroundColor = UIColor(named:"transparentWhite")
            button.setTitleColor(UIColor(named: "navigationColor"), for: .normal)
            button.setTitle(NSLocalizedString("Begin", comment: ""), for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = true
            button.titleLabel?.font =  UIFont(name: "avenir-medium", size: 20)
            button.layer.cornerRadius = 5
            button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
            view.addSubview(button)
    }
    @objc func buttonClicked(sender : UIButton){
        completeOnboarding = true
        UserDefaults.standard.set(completeOnboarding, forKey: "completeOnboarding")
        print(UserDefaults.standard.value(forKey: "completeOnboarding") as? Bool? as Any)
        performSegue(withIdentifier: "toApp", sender: nil)
    }


}

    


extension Onboarding: PaperOnboardingDataSource {
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        let bgOne = #colorLiteral(red: 0.7522197974, green: 0.9085828, blue: 0.8001499382, alpha: 1)
        let bgTwo = #colorLiteral(red: 0.7829809449, green: 0.9333210804, blue: 1, alpha: 1)
        let bgThree = #colorLiteral(red: 0.8412451069, green: 0.8248372556, blue: 1, alpha: 1)
        let bgFour = #colorLiteral(red: 0.8528290579, green: 0.7291803326, blue: 0.9085828, alpha: 1)
        let bgFive = #colorLiteral(red: 0.9922662907, green: 0.8697678968, blue: 1, alpha: 1)
        let bgSix = #colorLiteral(red: 1, green: 0.887721378, blue: 0.8824532881, alpha: 1)
        
        let mainFont = UIFont(name: "Avenir-Black", size: 30)!
        let descFont = UIFont(name: "Avenir-Medium", size: 17)!
        var onboardingViews: [OnboardingItemInfo] = []
        
        onboardingViews.append(OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "Checkmark"), title: "Welcome!", description: "Nocrastinate is an app to help you learn more efficiently.", pageIcon: #imageLiteral(resourceName: "dot"), color: bgOne, titleColor: UIColor(named:"navigationColor")!, descriptionColor: UIColor(named:"navigationColor")!, titleFont: mainFont, descriptionFont: descFont))
        
        onboardingViews.append(OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "onboardTwoTwo"), title: "The Forgetting Curve", description: "The forgetting curve displays patterns of human memory. Following this information can help the brain memorize information more effectively! Nocrastinate uses the forgetting curve to make studying as time-efficient as possible!", pageIcon: #imageLiteral(resourceName: "dot"), color: bgTwo, titleColor: UIColor(named:"navigationColor")!, descriptionColor: UIColor(named:"navigationColor")!, titleFont: mainFont, descriptionFont: descFont))
        
        onboardingViews.append(OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "onboardThree"), title: "Analytics", description: "Nocrastinate takes the folder length, words, and time spent on a study set into account to compute how much time to spend on a study set!", pageIcon: #imageLiteral(resourceName: "dot"), color: bgThree, titleColor: UIColor(named:"navigationColor")!, descriptionColor: UIColor(named:"navigationColor")!, titleFont: mainFont, descriptionFont: descFont))
        
        onboardingViews.append(OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "onboardFour"), title: "Extra Tips:", description: "When using a flashcard, click the checkmark if you remembered the information correctly, and click the x mark if you did not!", pageIcon: #imageLiteral(resourceName: "dot"), color: bgFour, titleColor: UIColor(named:"navigationColor")!, descriptionColor: UIColor(named:"navigationColor")!, titleFont: mainFont, descriptionFont: descFont))
        
        onboardingViews.append(OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "onboardFive"), title: "Extra Tips: pt.2", description: "A dot next to each flashcard marks which topics to spend more time on!", pageIcon: #imageLiteral(resourceName: "dot"), color: bgFour, titleColor: UIColor(named:"navigationColor")!, descriptionColor: UIColor(named:"navigationColor")!, titleFont: mainFont, descriptionFont: descFont))
        
        onboardingViews.append(OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "x-mark"), title: "Extra Tips: pt.3", description: "Once you make a study set, long hold on the screen to see how much you've studied a set that week!", pageIcon: #imageLiteral(resourceName: "dot"), color: bgFive, titleColor: UIColor(named:"navigationColor")!, descriptionColor: UIColor(named:"navigationColor")!, titleFont: mainFont, descriptionFont: descFont))
        
        onboardingViews.append(OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "onboardSeven"), title: "Let's do this!", description: "", pageIcon: #imageLiteral(resourceName: "dot"), color: bgSix, titleColor: UIColor(named:"navigationColor")!, descriptionColor: UIColor(named:"navigationColor")!, titleFont: mainFont, descriptionFont: descFont))
        
        return onboardingViews[index]
        }
    
    //how many onboarding screens
    func onboardingItemsCount() -> Int {
        return 7
    }
}
