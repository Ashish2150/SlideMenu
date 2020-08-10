//
//  ViewController.swift
//  newProject
//
//  Created by Ashish on 10/08/20.
//  Copyright © 2020 Ashish. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let blackView = UIView()
    
    @IBOutlet var slidingview: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func openView(_ sender: Any) {
        self.eventAnimationPopUp()
        
    }
    
    
    
    
       func eventAnimationPopUp(){
           
           //  slidinginnerview.layer.cornerRadius = 5
           
           //slidingview.layer.cornerRadius = 5
           slidingview.clipsToBounds = true
           
        if let window = UIApplication.shared.windows.first{ //UIApplication.shared.keyWindow{
               print(window.frame)
               blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
               let lefswipe = (UISwipeGestureRecognizer(target: self, action:#selector(slideToRightWithGestureRecognizer)))
               lefswipe.direction = .left
               self.blackView.addGestureRecognizer(lefswipe)
               blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
               window.addSubview(blackView)
               window.addSubview(slidingview)
               slidingview.frame = CGRect(x: 0, y: 0, width: window.frame.width-100, height: window.frame.height)
               blackView.frame = window.frame
               blackView.alpha = 0
               //self.sligingview.alpha = 1
               
               slidingview.slideLeft()
               self.slidingview.alpha = 1
               blackView.alpha = 1
               //sligingview.slideLeft()
               
           }
       }
    @objc func handleDismiss() {
           //sligingview.slideLeft()
           slidingview.slideRight()
           self.slidingview.alpha = 0
           self.blackView.alpha = 0
           //self.blackView.removeFromSuperview()
           //self.sligingview.removeFromSuperview()
       }
       
    
 
    @objc func slideToRightWithGestureRecognizer(gesture: UIGestureRecognizer) {
          
          if let swipeGesture = gesture as? UISwipeGestureRecognizer {
              
              
              switch swipeGesture.direction {
              case UISwipeGestureRecognizer.Direction.left:
                  print("Swiped right")
                  slidingview.slideRight()
                  self.slidingview.alpha = 0
                  self.blackView.alpha = 0
              default:
                  break
              }
          }
      }
    
   
      
    
}


extension UIView {
    
    func slideLeft()
    {
        
        
        let transition = CATransition()
        transition.duration = 0.2
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.layer.add(transition, forKey: kCATransition)
    }
    
    
    
    func slideRight()
    {
        
        let transition = CATransition()
        transition.duration = 0.2
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.layer.add(transition, forKey: kCATransition)
        
        
    }
}
