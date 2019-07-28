//
//  ViewController.swift
//  MultiBoardDemo
//
//  Created by Michael Panitz on 7/26/19.
//  Copyright © 2019 Michael Panitz. All rights reserved.
//

import UIKit
import Lottie

// This is for the Lottie animation:
class ViewController: UIViewController {
    
    let animationView = AnimationView(name: "7980-earth")
    
    @IBAction func btnPlay(_ sender: UIButton) {
        animationView.play()
    }
    @IBAction func btnStop(_ sender: UIButton) {
        animationView.stop()
    }
    @IBAction func btnPause(_ sender: UIButton) {
        animationView.pause()
    }
    @IBOutlet weak var btnStop: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        animationView.loopMode = .loop
        
        animationView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFill
        
        view.addSubview(animationView)
        
        animationView.play()
    }
}

