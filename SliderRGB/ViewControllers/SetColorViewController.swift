//
//  ViewController.swift
//  SliderRGB
//
//  Created by Ast on 31.01.2025.
//

import UIKit

final class SetColorViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet private var screenView: UIView!
    @IBOutlet private var redValueLabel: UILabel!
    @IBOutlet private var greenValueLabel: UILabel!
    
    @IBOutlet private var blueValueLabel: UILabel!
    @IBOutlet private var redSlider: UISlider!
    @IBOutlet private var greenSlider: UISlider!
    
    @IBOutlet private var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenView.layer.cornerRadius = 20
        // Первичное состояние
        screenView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
        
        redValueLabel.text = String(format: "%.2f", redSlider.value)
        greenValueLabel.text = String(format: "%.2f", greenSlider.value)
        blueValueLabel.text = String(format: "%.2f", blueSlider.value)
    }
    // MARK: - IB Actions
    @IBAction private func sliderAction() {
        screenView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
        
        redValueLabel.text = String(format: "%.2f", redSlider.value)
        greenValueLabel.text = String(format: "%.2f", greenSlider.value)
        blueValueLabel.text = String(format: "%.2f", blueSlider.value)
    }
}
