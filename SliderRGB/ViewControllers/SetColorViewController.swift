//
//  SetColorViewController.swift
//  SliderRGB
//
//  Created by Ast on 31.01.2025.
//

import UIKit

protocol BGViewControllerDelegate: AnyObject {
    func setBGColor()
}

final class SetColorViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet private var colorView: UIView!
    
    @IBOutlet private var redLabel: UILabel!
    @IBOutlet private var greenLabel: UILabel!
    @IBOutlet private var blueLabel: UILabel!
    
    @IBOutlet private var redSlider: UISlider!
    @IBOutlet private var greenSlider: UISlider!
    @IBOutlet private var blueSlider: UISlider!
    
    @IBAction func doneButtonPressed() {
        dismiss(animated: true)
    }
    
    // MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 15
        setColor()
        
        redLabel.text = string(from: redSlider)
        greenLabel.text = string(from: greenSlider)
        blueLabel.text = string(from: blueSlider)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let bgVC = segue.destination as? BGViewController
        bgVC?.delegate = self
    }
    
    // MARK: - IB Actions
    @IBAction private func sliderAction() {
        setColor()
        
        redLabel.text = string(from: redSlider)
        greenLabel.text = string(from: greenSlider)
        blueLabel.text = string(from: blueSlider)
    }
    
    @IBAction private func unwind(for segue: UIStoryboardSegue){
        setBGColor()
    }

    internal func setColor() {
        colorView.backgroundColor = UIColor(
            red: redSlider.value.cgFloat(),
            green: greenSlider.value.cgFloat(),
            blue: blueSlider.value.cgFloat(),
            alpha: 1
        )
        let _: Color = .init(red: redSlider.value.cgFloat(), green: greenSlider.value.cgFloat(), blue: blueSlider.value.cgFloat(), alpha: 1)
        
    }
    
    // MARK: - Private Methods
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}

// MARK: - Extentions
extension Float {
    func cgFloat() -> CGFloat {
        CGFloat(self)
    }
}

// MARK: - SetColorViewController
extension SetColorViewController: BGViewControllerDelegate {
    func setBGColor() {
    }
}
