//
//  ViewController.swift
//  SliderRGB
//
//  Created by Ast on 31.01.2025.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private var screenView: UIView!
    @IBOutlet private var redValue: UILabel!
    @IBOutlet private var greenValue: UILabel!
    @IBOutlet private var redSlider: UISlider!
    @IBOutlet private var greenSlider: UISlider!
    @IBOutlet private var blueValue: UILabel!
    @IBOutlet private var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderSetup()
        
    }
    @IBAction private func redSliderAction() {
        redValue.text = redSlider.value.formatted()
        screenAction()
    }
    @IBAction private func greenSliderAction() {
        greenValue.text = greenSlider.value.formatted()
        screenAction()
    }
    
    @IBAction func blueSliderAction() {
        blueValue.text = blueSlider.value.formatted()
        screenAction()
    }
    
    private var maxValue: Float = 255
    private func screenAction() {
        screenView.backgroundColor = .init(red: CGFloat(redSlider.value)/255, green: CGFloat(greenSlider.value)/255, blue: CGFloat(blueSlider.value)/255, alpha: 1)
    }
    private func sliderSetup() {
        redSlider.minimumValue = 0
        redSlider.maximumValue = maxValue
        //redSlider.minimumTrackTintColor = .red
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = maxValue
        //greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = maxValue
        //blueSlider.minimumTrackTintColor = .blue
    }
}
//
//private extension Double {
//    func formatted() -> String {
//        return String(format: "%.1f", self)
//    }
//}
