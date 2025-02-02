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
        sliderSetup()
    }
    // MARK: - IB Actions
    @IBAction private func redSliderAction() {
        redValueLabel.text = String(format: "%.2f", redSlider.value/maxValue)
        screenAction()
    }
    @IBAction private func greenSliderAction() {
        greenValueLabel.text = String(format: "%.2f", greenSlider.value/maxValue)
        screenAction()
    }
    @IBAction private func blueSliderAction() {
        blueValueLabel.text = String(format: "%.2f", blueSlider.value/maxValue)
        screenAction()
    }
    
    // MARK: - Private Properties
    private var minValue: Float = 0
    private var maxValue: Float = 255
    
    private func screenAction() {
        screenView.backgroundColor = .init(red: CGFloat(redSlider.value)/255, green: CGFloat(greenSlider.value)/255, blue: CGFloat(blueSlider.value)/255, alpha: 1)
    }
    private func sliderSetup() {
        redSlider.minimumValue = minValue
        redSlider.maximumValue = maxValue
        greenSlider.minimumValue = minValue
        greenSlider.maximumValue = maxValue
        blueSlider.minimumValue = minValue
        blueSlider.maximumValue = maxValue
    }
}


