//
//  BGViewController.swift
//  SliderRGB
//
//  Created by Ast on 02.03.2025.
//

import UIKit

final class BGViewController: UIViewController {

    @IBAction func setBGColorPressed() {
        view.backgroundColor = .black
        delegate?.setBGColor()
    }
    
    weak var delegate: BGViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
