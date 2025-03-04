//
//  SetColorViewController.swift
//  SliderRGB
//
//  Created by Ast on 31.01.2025.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet private var colorView: UIView!
    
    @IBOutlet private var redLabel: UILabel!
    @IBOutlet private var greenLabel: UILabel!
    @IBOutlet private var blueLabel: UILabel!
    
    @IBOutlet private var redSlider: UISlider!
    @IBOutlet private var greenSlider: UISlider!
    @IBOutlet private var blueSlider: UISlider!
    
    @IBOutlet private var redTextField: UITextField!
    @IBOutlet private var greenTextField: UITextField!
    @IBOutlet private var blueTextField: UITextField!
    
    
    // MARK: - Public Properties
    //Экземпляр класса MainViewController weak-опционал(nil) "?" ,
    //может и без него unowned-обязательное св-во "!"
    // Инициал св-во при переходе
    unowned var delegate: SettingsViewControllerDelegate!
    var viewColor: UIColor!
    
    // MARK: - View Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        //Первичные настройки
        colorView.layer.cornerRadius = 15
        
        redSlider.tintColor = .red
        greenSlider.tintColor = .green
        //blueSlider.tintColor = .blue
        //переданный цвет ставим на мал прямоуг
        colorView.backgroundColor = viewColor
        
        //Один метод, но разные параметры
        setValue(for: redSlider, greenSlider, blueSlider)
        setValue(for: redLabel, greenLabel, blueLabel)
        setValue(for: redTextField, greenTextField, blueTextField)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       //tap to screen
        super.touchesBegan(touches, with: event)
        // hide keyboard
        view.endEditing(true)
    }
    
    // MARK: - IB Actions
    @IBAction private func rgbSlider(_ sender: UISlider) {
        switch sender {
        case redSlider:
            setValue(for: redSlider)
            setValue(for: redTextField)
        case greenSlider:
            setValue(for: greenSlider)
            setValue(for: greenTextField)
        default:
            setValue(for: blueSlider)
            setValue(for: blueTextField)
        }
        // Обновляем цвет вьюшки
        setColor()
    }

    @IBAction func doneButtonPressed() {
        // Обращаемся к Мэйн и вызвали метод, цвет передаем в параметр
        delegate.setColor(colorView.backgroundColor ?? .black)
        dismiss(animated: true)
    }
}

// MARK: - Private Methods
private extension SettingsViewController {
    func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    //arraay данные передаем по одному
    func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redLabel: label.text = string(from: redSlider)
            case greenLabel: label.text = string(from: greenSlider)
            default: label.text = string(from: blueSlider)
            }
        }
    }
    
    func setValue(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redTextField: textField.text = string(from: redSlider)
            case greenTextField: textField.text = string(from: greenSlider)
            default: textField.text = string(from: blueSlider)
            }
        }
    }
    
    func setValue(for colorSliders: UISlider...) {
        let ciColor = CIColor(color: viewColor)
        // Разбиваем цвет на компоненты
        colorSliders.forEach { slider in
            switch slider {
            case redSlider: slider.value = Float(ciColor.red)
            case greenSlider: slider.value = Float(ciColor.green)
            default: blueSlider.value = Float(ciColor.blue)
            }
        }
    }
    
    func string(from slider: UISlider) -> String {
        //Округляем значения слайдера
        String(format: "%.2f", slider.value)
    }
    //
    func showAlert(withTitle title: String, andMessage message: String, textField:
        UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        //По нажатию OK
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = "0.50"
            //show keyboard
            textField?.becomeFirstResponder()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension SettingsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // return для текстового поля
        textField.resignFirstResponder()
    }
    // Завершаем работу с текст полем
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        // Можно ли текст привести к флоат
        guard let currentValue = Float(text), (0...1).contains(currentValue) else {
            showAlert(
                withTitle: "Wrong format!",
                andMessage: "Enter correct value",
                textField: textField
            )
            return
        }
        
        textField.text = String(format: "%.2f", currentValue)
        // Обновляем слайдеры по текст полю анимированно
        switch textField {
        case redTextField:
            redSlider.setValue(currentValue, animated: true)
            setValue(for: redLabel)
        case greenTextField:
            greenSlider.setValue(currentValue, animated: true)
            setValue(for: greenLabel)
        default:
            blueSlider.setValue(currentValue, animated: true)
            setValue(for: blueLabel)
        }
        setColor()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //Если нужно, убираем кнопку Done
        //guard textField != redTextField else { return }
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        textField.inputAccessoryView = keyboardToolbar
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(resignFirstResponder)
        )
        
        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        keyboardToolbar.items = [flexBarButton, doneButton, flexBarButton]
    }
}
