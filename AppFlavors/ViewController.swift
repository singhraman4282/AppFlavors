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



typealias FlavoredAsset = Asset.DCAssets

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
                ImageTableViewCellModel(imageAsset: Asset.Assets.appBanner),
                ImageTableViewCellModel(imageAsset: Asset.DCAssets.richGuy),
                ImageTableViewCellModel(imageAsset: Asset.DCAssets.flyingMan),
                ImageTableViewCellModel(imageAsset: Asset.DCAssets.femaleSuperhero),
            ])
    }()
}



private final class ImageTableViewCell: UITableViewCell {

    static let reuseIdentifier: String = "ImageTableViewCell"

    lazy private var mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        contentView.addSubview(mainImageView)
        NSLayoutConstraint.activate([
            mainImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    func bind(cellModel: ImageTableViewCellModel) {
        self.mainImageView.image = cellModel.imageAsset.image
    }
}

private struct ImageTableViewCellModel {
    let cellType: UITableViewCell.Type = ImageTableViewCell.self
    let imageAsset: ImageAsset
}
