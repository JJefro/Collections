//
//  DictionaryViewController.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 05/10/2021.
//

import UIKit
import NVActivityIndicatorView

class DictionaryViewController: UIViewController {

    var collectionView: UICollectionView!
    let model = DictionaryViewModel()

    var arrayLabel = UILabel()
    var dictionaryLabel = UILabel()
    var stackView = UIStackView()
    private var arrayWithContacts = [Contact]()
    private var dictionaryWithContacts = [String: String]()

    var spinner = NVActivityIndicatorView(
        frame: .zero,
        type: .pacman,
        color: UITraitCollection.current.userInterfaceStyle == .dark ? .white : .black,
        padding: 0
    )
    var loadingView = UIView()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = R.color.dictionaryViewBackground()
        configureElements()
        generateCollections()
        createAccessibilityIdentifiers()
    }

    private func generateCollections() {
        if model.arrayWithContacts.isEmpty, model.dictionaryWithContacts.isEmpty {
            loadingView.isHidden = false
            spinner.startAnimating()
            model.generateCollections(completion: { [self] in
                loadingView.isHidden = true
                spinner.stopAnimating()
            })
        }
    }
}
