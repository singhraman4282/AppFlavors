//
//  ViewController.swift
//  AppFlavors
//
//  Created by Raman Singh on 2022-09-06.
//

import UIKit

class ViewController: UIViewController {

    lazy private var viewModel: ViewModel = {
        ViewModel.default
    }()

    lazy private var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(ImageTableViewCell.self, forCellReuseIdentifier: ImageTableViewCell.reuseIdentifier)
        table.dataSource = self
        table.estimatedRowHeight = 100
        table.rowHeight = UITableView.automaticDimension
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.cellModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.reuseIdentifier, for: indexPath) as? ImageTableViewCell else {
            fatalError()
        }

        let cellModel = viewModel.cellModels[indexPath.row]
        cell.bind(cellModel: cellModel)
        return cell
    }

}

private struct ViewModel {
    let cellModels: [ImageTableViewCellModel]

    /*
     Note:
     When building for Marvel Scheme, Asset.DCAssets.someAsset shows the Marvel version of that asset since that's the file that gets included.
     It works as expected but it still feels a bit weird.

     One option here would be creating typealiases and compiler flags

     #if DC
        typealias FlavoredAsset = Asset.DCAssets
     #else
        typealias FlavoredAsset = Asset.MarvelAssets
     #endif
     */

    static let `default`: ViewModel = {
        ViewModel(
            cellModels: [
                ImageTableViewCellModel(title: L10n.Localizations.App.banner, imageAsset: Asset.Assets.appBanner),
                ImageTableViewCellModel(title: L10n.Localizations.richMan, imageAsset: Asset.DCAssets.richGuy),
                ImageTableViewCellModel(title: L10n.Localizations.flyingMan, imageAsset: Asset.DCAssets.flyingMan),
                ImageTableViewCellModel(title: L10n.Localizations.femaleSuperhero, imageAsset: Asset.DCAssets.femaleSuperhero),
            ])
    }()
}

extension L10n.Localizations {
    static let richMan: String = {
#if DC
        L10n.DCLocalizations.richMan
#elseif Marvel
        L10n.MarvelLocalizations.richMan
#else
        ""
#endif
    }()

    static let flyingMan: String = {
#if DC
        L10n.DCLocalizations.flyingMan
#elseif Marvel
        L10n.MarvelLocalizations.flyingMan
#else
        ""
#endif
    }()

    static let femaleSuperhero: String = {
#if DC
        L10n.DCLocalizations.femaleSuperhero
#elseif Marvel
        L10n.MarvelLocalizations.femaleSuperhero
#else
        ""
#endif
    }()
}

private final class ImageTableViewCell: UITableViewCell {

    static let reuseIdentifier: String = "ImageTableViewCell"

    lazy private var mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    lazy private var titleLabel: UILabel = {
        let someLabel = UILabel()
        someLabel.numberOfLines = 0
        someLabel.textAlignment = .center
        someLabel.translatesAutoresizingMaskIntoConstraints = false
        return someLabel
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(mainImageView)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            mainImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    func bind(cellModel: ImageTableViewCellModel) {
        mainImageView.image = cellModel.imageAsset.image
        titleLabel.text = cellModel.title
    }
}

private struct ImageTableViewCellModel {
    let title: String
    let cellType: UITableViewCell.Type = ImageTableViewCell.self
    let imageAsset: ImageAsset
}
