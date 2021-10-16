//
//  CustomTextField.swift
//  textFields!
//
//  Created by Jevgenijs Jefrosinins on 22/09/2021.
//

import UIKit
import SnapKit

class CustomTextField: UITextField {

    var minOfCharactersRule = UILabel()
    var minOfDigitsRule = UILabel()
    var minOfLowercaseCharRule = UILabel()
    var minOfUppercaseCharRule = UILabel()

    var progressView = UIProgressView()
    
    private var progressLineHeight = 7
    private var progressLineCornerRadius: CGFloat = 10
    private var validationRulesTextSize: CGFloat = 13
    private var stepInPercentageTerms: Float = 0.25 /// Execution of one rule as a percentage

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        layer.borderWidth = 1
        layer.cornerRadius = 10
        layer.borderColor = UIColor.gray.cgColor
        self.clipsToBounds = true
    }
    /// When progress has changed, we change progress line length and progressTintColor with animation
    private var progress: Float = 0 {
        didSet {
            let rules = [isMinOfCharRuleDone, isMinOfDigitsRuleDone, isMinOfLowercaseCharRuleDone, isMinOfUppercaseCharRuleDone]
            let completedRules = rules.filter { $0 == true } .count
            progress = Float(completedRules) * stepInPercentageTerms

            UIView.animate(withDuration: 0.9) {
                self.progressView.setProgress(self.progress, animated: true)
                self.updateProgressViewTintColor()
            }
        }
    }

    @IBInspectable var hasValidationRules: Bool = false {
        didSet {
            if hasValidationRules {
                makeValidationLabelsConstraints()
                makeProgressViewConstraints()
            }
        }
    }

    @IBInspectable var isLimited: Bool = false {
        didSet {
            self.layer.borderColor = isLimited ? R.color.tfRed()!.cgColor : R.color.tfBlue()!.cgColor
        }
    }

    override var isSelected: Bool {
        didSet {
            self.layer.borderColor = !isSelected ? UIColor.gray.cgColor : R.color.tfBlue()!.cgColor
        }
    }

    private func updateProgressViewTintColor() {
        if progressView.progress <= 0.25 {
            progressView.progressTintColor = R.color.tfRed()
        } else if progressView.progress <= 0.75 {
            progressView.progressTintColor = R.color.tfOrange()
        } else {
            progressView.progressTintColor = R.color.tfGreen()
        }
    }

    private func makeProgressViewConstraints() {
        progressView.trackTintColor = UIColor.clear
        progressView.clipsToBounds = true
        progressView.layer.cornerRadius = progressLineCornerRadius

        superview?.addSubview(progressView)
        progressView.snp.makeConstraints { make in
            make.height.equalTo(progressLineHeight)
            make.bottom.leading.trailing.equalTo(self)
        }
    }

    // MARK: - Validation Rules Settings
    @IBInspectable var isMinOfCharRuleDone: Bool = false {
        didSet {
            if isMinOfCharRuleDone {
                minOfCharactersRule.textColor = R.color.tfGreen()
                minOfCharactersRule.text = "✓ Min length 8 characters."
                progress += 1
            } else {
                minOfCharactersRule.textColor = R.color.tfTextColor()
                minOfCharactersRule.text = "- Min length 8 characters."
                progress -= 1
            }
        }
    }

    @IBInspectable var isMinOfDigitsRuleDone: Bool = false {
        didSet {
            if isMinOfDigitsRuleDone {
                minOfDigitsRule.textColor = R.color.tfGreen()
                minOfDigitsRule.text = "✓ Min 1 digit,"
                progress += 1
            } else {
                minOfDigitsRule.textColor = R.color.tfTextColor()
                minOfDigitsRule.text = "- Min 1 digit,"
                progress -= 1
            }
        }
    }

    @IBInspectable var isMinOfLowercaseCharRuleDone: Bool = false {
        didSet {
            if isMinOfLowercaseCharRuleDone {
                minOfLowercaseCharRule.textColor = R.color.tfGreen()
                minOfLowercaseCharRule.text = "✓ Min 1 lowercase,"
                progress += 1
            } else {
                minOfLowercaseCharRule.textColor = R.color.tfTextColor()
                minOfLowercaseCharRule.text = "- Min 1 lowercase,"
                progress -= 1
            }
        }
    }

    @IBInspectable var isMinOfUppercaseCharRuleDone: Bool = false {
        didSet {
            if isMinOfUppercaseCharRuleDone {
                minOfUppercaseCharRule.textColor = R.color.tfGreen()
                minOfUppercaseCharRule.text = "✓ Min 1 capital required."
                progress += 1
            } else {
                minOfUppercaseCharRule.textColor = R.color.tfTextColor()
                minOfUppercaseCharRule.text = "- Min 1 capital required."
                progress -= 1
            }
        }
    }

    // MARK: - Validation Labels Constraints
    private func makeValidationLabelsConstraints() {
        let labelFont = R.font.sfProDisplayRegular(size: validationRulesTextSize)
        let leadingConstraints = 24
        let topConstraints = -21

        minOfCharactersRule.text = "- Min length 8 characters."
        minOfCharactersRule.font = labelFont
        superview?.addSubview(minOfCharactersRule)
        minOfCharactersRule.snp.makeConstraints { make in
            make.bottom.equalTo(self).inset(topConstraints)
            make.leading.equalToSuperview().inset(leadingConstraints)
        }

        minOfDigitsRule.text = "- Min 1 digit,"
        minOfDigitsRule.font = labelFont
        superview?.addSubview(minOfDigitsRule)
        minOfDigitsRule.snp.makeConstraints { make in
            make.bottom.equalTo(minOfCharactersRule).inset(topConstraints)
            make.leading.equalToSuperview().inset(leadingConstraints)
        }

        minOfLowercaseCharRule.text = "- Min 1 lowercase,"
        minOfLowercaseCharRule.font = labelFont
        superview?.addSubview(minOfLowercaseCharRule)
        minOfLowercaseCharRule.snp.makeConstraints { make in
            make.bottom.equalTo(minOfDigitsRule).inset(topConstraints)
            make.leading.equalToSuperview().inset(leadingConstraints)
        }

        minOfUppercaseCharRule.text = "- Min 1 capital required."
        minOfUppercaseCharRule.font = labelFont
        superview?.addSubview(minOfUppercaseCharRule)
        minOfUppercaseCharRule.snp.makeConstraints { make in
            make.bottom.equalTo(minOfLowercaseCharRule).inset(topConstraints)
            make.leading.equalToSuperview().inset(leadingConstraints)
        }
    }
}
