//
//  ViewController.swift
//  thirdTask
//
//  Created by Павел Снижко on 27.12.2020.
//
//
import UIKit

class ViewController: UIViewController {
    var circle: UIView!
    var randomColor: UIColor{
        [UIColor.yellow, UIColor.orange, UIColor.red, UIColor.blue, UIColor.green, UIColor.purple].randomElement()!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.circle = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.circle.layer.cornerRadius = circle.frame.width * 0.5
        self.circle.center = view.center
        self.circle.backgroundColor = .red
        view.addSubview(circle)
        addSwipe()
        addTaps()



    }

    func addSwipe() {
        let directions: [UISwipeGestureRecognizer.Direction] = [.right, .left, .up, .down]
        directions.forEach{ direction in
            let gesture = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture) )
            gesture.direction = direction
            view.addGestureRecognizer(gesture)

        }
    }

    func addTaps() {
        for count in 1...2 {
            let tap = UITapGestureRecognizer(target: self, action: #selector(handleTaps))
            tap.numberOfTapsRequired = count
            view.addGestureRecognizer(tap)
        }
    }

    @objc func handleTaps(gesture: UITapGestureRecognizer) {
        switch gesture.numberOfTapsRequired {
            case 2:
                UIView.transition(with: self.circle, duration: 1.5, animations: {
                                    self.circle.center = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height / 2 )})
                let animation = CAKeyframeAnimation()
                animation.keyPath = "position"
                animation.values = circlePath()
                animation.duration = 3.0
                self.circle.layer.add(animation, forKey: "position")
            case 1:
                UIView.transition(with: self.circle, duration: 1.5, animations: {
                                    self.circle.center = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height / 2 )})
            default:
                break
        }
    }

    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {

        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
                case .down:
                    UIView.transition(with: self.circle, duration: 1.5, animations: {
                        self.circle.backgroundColor = self.randomColor
                        self.circle.center = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height / 2 + 30)})
                case .right:
                    UIView.transition(with: self.circle, duration: 1.5, animations: {
                        self.circle.backgroundColor = self.randomColor
                        self.circle.center = CGPoint(x: self.view.frame.width / 2 + 30, y: self.view.frame.height / 2)
                    })
                case .left:
                    UIView.transition(with: self.circle, duration: 1.5, animations: {
                        self.circle.backgroundColor = self.randomColor
                        self.circle.center = CGPoint(x: self.view.frame.width / 2 - 30, y: self.view.frame.height / 2)})
                case .up:
                    UIView.transition(with: self.circle, duration: 1.5, animations: {
                        self.circle.backgroundColor = self.randomColor
                        self.circle.center = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height / 2 - 30)})
                default:
                    break
            }
        }
    }



    func circlePath() ->  [CGPoint] {
        var pathArray = [CGPoint]()
        let rightMoving = Double(self.view.frame.width / 4)
        let downMoving = Double(self.view.frame.height / 4)

        for angle in 0...360 {
            let radian = Double(angle) * Double.pi / Double(180)
            let x = 80.0 + 80.0 * sin(radian) + rightMoving
            let y = 80.0 + 80.0 * cos(radian) + downMoving
            pathArray.append(CGPoint(x: x, y: y))
        }
        return pathArray
    }



}






