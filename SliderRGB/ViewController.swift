//
//  ViewController.swift
//  SliderRGB
//
//  Created by Ast on 31.01.2025.
//

import UIKit

final class ViewController: UIViewController {
    
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
        sliderSetup()
    }
    // MARK: - IB Actions
    @IBAction private func redSliderAction() {
        redValueLabel.text = String(format: "%.2f", redSlider.value/Float(maxValue))
        screenAction()
    }
    @IBAction private func greenSliderAction() {
        greenValueLabel.text = String(format: "%.2f", greenSlider.value/Float(maxValue))
        screenAction()
    }
    @IBAction private func blueSliderAction() {
        blueValueLabel.text = String(format: "%.2f", blueSlider.value/Float(maxValue))
        screenAction()
    }
    
    // MARK: - Private Properties
    private let minValue: Float = 0
    private let maxValue: Double = 255
    
    private func screenAction() {
        screenView.backgroundColor = .init(
            red: CGFloat(redSlider.value)/maxValue,
            green: CGFloat(greenSlider.value)/maxValue,
            blue: CGFloat(blueSlider.value)/maxValue,
            alpha: 1
        )
    }
    private func sliderSetup() {
        redSlider.minimumValue = minValue
        redSlider.maximumValue = Float(maxValue)
        greenSlider.minimumValue = redSlider.minimumValue
        greenSlider.maximumValue = redSlider.maximumValue
        blueSlider.minimumValue = redSlider.minimumValue
        blueSlider.maximumValue = redSlider.maximumValue
    }
}


