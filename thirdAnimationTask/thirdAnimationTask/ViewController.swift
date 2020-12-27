//
//  ViewController.swift
//  thirdAnimationTask
//
//  Created by Павел Снижко on 25.12.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewForChangeColor: UIView!
    @IBOutlet weak var circleInSquareView: UIView!
    @IBOutlet weak var blackSquare: UIView!
    @IBOutlet weak var squareToCircle: UIView!
    @IBOutlet weak var stackForRotating: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        self.circleInSquareView.layer.cornerRadius = self.circleInSquareView.frame.height * 0.50
        UIView.animate(withDuration: 2, delay: 1,options: [.repeat], animations: {
            self.resizeSquare()
        })
        changeGradualyColor()
        transformSquareToCircle()            
    }
    
    func transformToCircle(from view: UIView) {
        view.layer.cornerRadius = view.frame.height * 0.5

    }
    
    func resizeSquare(){
        self.blackSquare.frame.size.width += self.blackSquare.bounds.width / 2
        self.blackSquare.frame.size.height += self.blackSquare.bounds.height / 2
    }
    
    func transformSquareToCircle(){
        UIView.animate(withDuration: 3, delay: 1,options: [.repeat, .autoreverse], animations: {
            self.squareToCircle.layer.cornerRadius = self.squareToCircle.frame.height * 0.5
        })
    }
    
    func changeGradualyColor(){
        UIView.animateKeyframes(withDuration: 5, delay: 0, options: [.calculationModeCubic, .repeat], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) {
                self.viewForChangeColor.backgroundColor = UIColor.red
                self.circleInSquareView.backgroundColor = UIColor.purple
            }

            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                self.viewForChangeColor.backgroundColor = UIColor.green
                self.circleInSquareView.backgroundColor = UIColor.yellow

            }

            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
                self.viewForChangeColor.backgroundColor = UIColor.orange
                self.circleInSquareView.backgroundColor = UIColor.orange

            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                self.viewForChangeColor.backgroundColor = UIColor.white
                self.circleInSquareView.backgroundColor = UIColor.black

            }

        })
        
        
        
//    q
        
    }
    
  
}




