//
//  SetViewController + UIElementsConfiguration.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 14/10/2021.
//

import Foundation
import SnapKit

// MARK: - UI Elements Configuration
extension SetViewController {

    func configureElements() {
        configureTextFields()
        configureScrollView()
        configureContentView()
        configureStackView()
        configureButtons()
        makeLabelsConstraints()
    }

    // MARK: - TextFields Configuration
    private func configureTextFields() {
        topTextField.fieldSettings = .onlyLetters
        bottomTextField.fieldSettings = .onlyLetters
        maketxtFieldsConstraints()
    }

    private func maketxtFieldsConstraints() {
        view.addSubview(topTextField)
        topTextField.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().inset(80)
        }
        view.addSubview(bottomTextField)
        bottomTextField.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(topTextField).inset(80)
        }
    }

    // MARK: - ScrollView Configuration
    private func configureScrollView() {
        scrollView.addSubview(contentView)
        scrollView.showsHorizontalScrollIndicator = false
        makeScrollViewConstraints()
    }

    private func makeScrollViewConstraints() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(bottomTextField.snp_bottomMargin).offset(-16)
            make.right.left.bottom.equalToSuperview()
        }
    }

    // MARK: - ContentView Configuration
    private func configureContentView() {
        contentView.addSubview(stackView)
        makeContentViewConstraints()
    }

    private func makeContentViewConstraints() {
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView.snp.width)
        }
    }

    // MARK: - StackView Configuration
    private func configureStackView() {
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.addArrangedSubview(firstButton)
        stackView.addArrangedSubview(firstLabel)
        stackView.addArrangedSubview(middleButton)
        stackView.addArrangedSubview(middleLabel)
        stackView.addArrangedSubview(lastButton)
        stackView.addArrangedSubview(lastLabel)
        makeStackViewconstraints()
    }
    private func makeStackViewconstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }

    // MARK: - Buttons Configuration
    private func configureButtons() {
        firstButton.setTitle("All matching letters", for: .normal)
        middleButton.setTitle("All characters that do not match", for: .normal)
        lastButton.setTitle("All unique characters from the first text field that do not match in text fields", for: .normal)
        makeButtonsConstraints()
        addTargetsForButtons()
    }

    private func addTargetsForButtons() {
        firstButton.addTarget(self, action: #selector(firstButtonPressed), for: .touchUpInside)
        middleButton.addTarget(self, action: #selector(middleButtonPressed), for: .touchUpInside)
        lastButton.addTarget(self, action: #selector(lastButtonPressed), for: .touchUpInside)
    }

    private func makeButtonsConstraints() {
        firstButton.snp.makeConstraints { make in
            make.left.right.lessThanOrEqualTo(stackView).inset(60)
            make.centerX.equalToSuperview()
        }
        middleButton.snp.makeConstraints { make in
            make.left.right.lessThanOrEqualTo(stackView).inset(60)
            make.centerX.equalToSuperview()
        }
        lastButton.snp.makeConstraints { make in
            make.left.right.lessThanOrEqualTo(stackView).inset(60)
            make.height.equalTo(80)
            make.centerX.equalToSuperview()
        }
    }

    // MARK: - Result Labels Constraints
    private func makeLabelsConstraints() {
        firstLabel.snp.makeConstraints { make in
            make.left.right.equalTo(stackView).inset(20)
        }
        middleLabel.snp.makeConstraints { make in
            make.left.right.equalTo(stackView).inset(20)
        }
        lastLabel.snp.makeConstraints { make in
            make.left.right.equalTo(stackView).inset(20)
        }
    }
}
