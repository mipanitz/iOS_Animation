//
//  UIVewAnimation_ViewController.swift
//  iOS-Animation
//
//  Created by Michael Panitz on 7/27/19.
//  Copyright © 2019 Michael Panitz. All rights reserved.
//

import UIKit

class UIViewAnimation_ViewController: UIViewController {

    @IBOutlet weak var imgArrow: UIImageView!
    @IBAction func btnStartAnimation(_ sender: UIButton) {
        
        UIView.animateKeyframes(withDuration: 2.0,
                                delay: 0,
                                options: [  ],
                                animations: {
                                    
                                    UIView.addKeyframe(withRelativeStartTime: 0.0,
                                                       relativeDuration: 1,
                                                       animations: {
                                                        self.imgArrow.center.y += 100
                                    })
                                    // NOTE: Do NOT use multiple overlapping animations on the same
                                    // property (for example, width/height, or location
                                    // These three should not be mixed:
                                    // frame
                                    // bounds
                                    // center
                                    
                                    // Also keep in mind that we can't animate the arrow sliding from one item
                                    // to the next all in one animation (because it won't stop between keyframes)
                                    
                                    // We're going to do another transformation, this time on the background color:
                                    UIView.addKeyframe(withRelativeStartTime: 0.0,
                                                       relativeDuration: 0.5,
                                                       animations: {
                                                        self.imgArrow.backgroundColor = #colorLiteral(red: 0, green: 1, blue: 0.07706925133, alpha: 1)
                                    })
                                    UIView.addKeyframe(withRelativeStartTime: 0.5,
                                                       relativeDuration: 0.5,
                                                       animations: {
                                                        self.imgArrow.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                                    })

                                    // If we want to rotate, stretch, etc the image we can use UIView.transform
                                    let rotate_down = CGFloat.pi / 2
                                    UIView.addKeyframe(withRelativeStartTime: 0.0,
                                                       relativeDuration: 0.2,
                                                       animations: {
                                                        self.imgArrow.transform = CGAffineTransform.identity.rotated(by: rotate_down)
                                    })

                                    // remember that we're replacing the transform that's applied to the base iamge
                                    // so we just need to reset it back to the starting direction (pointing rightward)
                                    // We do NOT need to rotate it relative to the direction we set in the prior animation
                                    UIView.addKeyframe(withRelativeStartTime: 0.8,
                                                       relativeDuration: 0.2,
                                                       animations: {
                                                        self.imgArrow.transform = CGAffineTransform.identity
                                    })
                                },
                                completion: nil)
        
        UIView.animateKeyframes(withDuration: 0.5,
                                delay: 2,
                                options: [  ],
                                animations: {
                                    
                                    UIView.addKeyframe(withRelativeStartTime: 0.0,
                                                       relativeDuration: 0.5,
                                                       animations: {
                                                        self.imgArrow.alpha = CGFloat(0)
                                    })
                                    UIView.addKeyframe(withRelativeStartTime: 0.5,
                                                       relativeDuration: 0.5,
                                                       animations: {
                                                        self.imgArrow.alpha = CGFloat(1)
                                    })
                                },
                                completion: nil)
    }
    
    
    @IBOutlet weak var lblTitle: UILabel!
    var animator: UIViewPropertyAnimator?;
    @IBAction func btnControllableAnimation(_ sender: UIButton) {
        if animator == nil {
            animator = UIViewPropertyAnimator(
                duration: 10.0,
                curve: .easeInOut,
                animations: {
                    self.lblTitle.alpha = CGFloat(0)
                    // Warning: Animating the backgroundColor didn't seem to work
            })
            
            animator?.startAnimation()
        }
        else if let anim = animator {
            if anim.isRunning == true {
                anim.pauseAnimation()
            }
            else {
                anim.startAnimation()
            }
        }
    }

}
