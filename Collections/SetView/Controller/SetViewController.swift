//
//  SetViewController.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 05/10/2021.
//

import UIKit
import SnapKit

class SetViewController: UIViewController {

    var topTextField = TextFieldView(frame: .zero)
    var bottomTextField = TextFieldView(frame: .zero)

    var firstButton = CustomButton(frame: .zero)
    var middleButton = CustomButton(frame: .zero)
    var lastButton = CustomButton(frame: .zero)

    var firstLabel = ResultLabel(frame: .zero)
    var middleLabel = ResultLabel(frame: .zero)
    var lastLabel = ResultLabel(frame: .zero)

    var stackView = UIStackView()
    var scrollView = UIScrollView()
    var contentView = UIView()

    var model = SetViewModel()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = R.color.setViewBackgroundColor()
        configureElements()
        createAccessibilityIdentifiers()
    }

    @objc func firstButtonPressed(sender: CustomButton!) {
        firstLabel.text = model.findAllMatchingLetters(
            firstInput: topTextField.txtField.text!,
            secondInput: bottomTextField.txtField.text!
        )
    }

    @objc func middleButtonPressed(sender: CustomButton!) {
        middleLabel.text = model.findUnmathingLetters(
            firstInput: topTextField.txtField.text!,
            secondInput: bottomTextField.txtField.text!
        )
    }

    @objc func lastButtonPressed(sender: CustomButton!) {
        lastLabel.text = model.findUniqueLetters(
            firstInput: topTextField.txtField.text!,
            secondInput: bottomTextField.txtField.text!
        )
    }
}
