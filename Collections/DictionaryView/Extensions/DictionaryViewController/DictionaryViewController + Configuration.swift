//
//  DictionaryViewController + Configuration.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 18/10/2021.
//

import UIKit
import SnapKit

extension DictionaryViewController {

    func configureElements() {
        configureStackView()
        configureTextLabels()
        configureCollectionView()
        configureLoadingView()
    }

    // MARK: - LoadingView Configuration
    private func configureLoadingView() {
        let blurView: UIVisualEffectView = {
            var blur = UIBlurEffect()
            let darkBlur = UIBlurEffect(style: .systemUltraThinMaterialDark)
            let lightBlur = UIBlurEffect(style: .systemUltraThinMaterialLight)
            blur = traitCollection.userInterfaceStyle == .dark ? darkBlur : lightBlur
            let blurView = UIVisualEffectView(effect: blur)
            blurView.frame = UIScreen.main.bounds
            return blurView
        }()
        makeLoadingViewConstraints()
        loadingView.addSubview(blurView)

        blurView.snp.makeConstraints { make in
            make.edges.equalTo(loadingView)
        }
        makeSpinnerConstraints()
    }

    private func makeLoadingViewConstraints() {
        view.addSubview(loadingView)
        loadingView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }

    private func makeSpinnerConstraints() {
        loadingView.addSubview(spinner)
        spinner.snp.makeConstraints { make in
            make.center.equalTo(loadingView.snp.center)
            make.height.width.equalTo(80)
        }
    }

    // MARK: - UIStackView Configuration
    private func configureStackView() {
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.addArrangedSubview(arrayLabel)
        stackView.addArrangedSubview(dictionaryLabel)
        stackView.backgroundColor = view.backgroundColor
        makeStackViewConstraints()
    }

    private func makeStackViewConstraints() {
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.right.left.equalToSuperview()
            make.height.equalTo(70)
        }
    }

    // MARK: - Text Labels Configuration
    private func configureTextLabels() {
        arrayLabel.backgroundColor = .clear
        arrayLabel.font = R.font.sfProDisplayBold(size: 17)
        arrayLabel.text = "Array"
        arrayLabel.textAlignment = .center
        arrayLabel.textColor = R.color.dictionaryViewTextColor()
        dictionaryLabel.backgroundColor = .clear
        dictionaryLabel.font = R.font.sfProDisplayBold(size: 17)
        dictionaryLabel.text = "Dictionary"
        dictionaryLabel.textAlignment = .center
        dictionaryLabel.textColor = R.color.dictionaryViewTextColor()
        makeLabelsConstraints()
    }

    private func makeLabelsConstraints() {
        arrayLabel.snp.makeConstraints { make in
            make.width.equalTo(view.bounds.size.width/2)
        }
        dictionaryLabel.snp.makeConstraints { make in
            make.width.equalTo(view.bounds.size.width/2)
        }
    }

    // MARK: - UICollectionView Configuration
    private func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = layout.minimumLineSpacing
        collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout)
        collectionView.backgroundColor = view.backgroundColor
        collectionView.register(
            DictionaryVCollectionViewCell.self,
            forCellWithReuseIdentifier: DictionaryVCollectionViewCell.identifier)
        makeCollectionViewConstraints()
        bind()
    }

    private func makeCollectionViewConstraints() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
    }

    private func bind() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
