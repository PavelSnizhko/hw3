//
//  ViewController.swift
//  firstTaskPart2
//
//  Created by Павел Снижко on 27.12.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stackView1: UIStackView!
    @IBOutlet weak var stackView2: UIStackView!
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var violetView: UIView!
    
    

    override func viewDidLoad() {
         super.viewDidLoad()
         redView.layer.cornerRadius = 10
         orangeView.layer.cornerRadius = 10
         greenView.layer.cornerRadius = 10
         violetView.layer.cornerRadius = 10
    }
}

