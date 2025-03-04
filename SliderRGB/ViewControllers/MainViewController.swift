//
//  BGViewController.swift
//  SliderRGB
//
//  Created by Ast on 02.03.2025.
//

import UIKit
// Определили протокол
protocol SettingsViewControllerDelegate: AnyObject {
    //вставляем метод в протокол
    func setColor(_ color: UIColor)
}

final class MainViewController: UIViewController {
    //Переход по сигвэю чтобы переопределить экз класса
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as? SettingsViewController
        // Инициализировали своим классом, обязательно чтоьф вызвать метод!!!
        settingsVC?.delegate = self
        settingsVC?.viewColor = view.backgroundColor
    }
}
// Подписались под протокол
// MARK: - SettingsViewControllerDelegate
extension MainViewController: SettingsViewControllerDelegate {
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
