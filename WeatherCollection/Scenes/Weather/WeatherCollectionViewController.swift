//
//  WeatherCollectionViewController.swift
//  WeatherCollection
//
//  Created by Artem Krasnov on 16.07.2024.
//

import UIKit

protocol WeatherCollectionViewProtocol: AnyObject {
    var presenter: WeatherCollectionPresenterProtocol? { get set }

    func didSelectWeatherEvent()
    func selectWeatherEvent(at weatherEvent: WeatherEvent)
}

final class WeatherCollectionViewController: UIViewController, WeatherCollectionViewProtocol {

    // MARK: - Public Properties

    var presenter: WeatherCollectionPresenterProtocol?

    // MARK: - Private Properties

    private var dataSource: UICollectionViewDiffableDataSource<Section, WeatherEvent>?

    private var weatherCollectionView: UICollectionView?
    private var selectedIndexPath: IndexPath?

    private lazy var weatherUIView: UIView = {

        let weatherUIView = UIView()
        weatherUIView.translatesAutoresizingMaskIntoConstraints = false
        return weatherUIView
    }()

    private lazy var weatherUIImageView: UIImageView = {

        let weatherUIImageView = UIImageView()
        weatherUIImageView.translatesAutoresizingMaskIntoConstraints = false
        return weatherUIImageView
    }()

    // MARK: - Overrides Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red

        let weatherCollectionPresenter = WeatherCollectionPresenter()
        self.presenter = weatherCollectionPresenter
        weatherCollectionPresenter.view = self

        setupWeatherUIView()
        setupWeatherUIImageView()
        setupWeatherCollectionView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        applyInitialSnapshot()
        selectFirstEvent()
    }

    // MARK: - Public Methods

    func didSelectWeatherEvent() {
        guard let selectedIndexPath = selectedIndexPath else { return }
        weatherCollectionView?.selectItem(at: selectedIndexPath, animated: true, scrollPosition: .centeredHorizontally)
        presenter?.didSelectWeatherEvent(selectedIndexPath)
    }

    func selectWeatherEvent(at weatherEvent: WeatherEvent) {
        weatherUIView.backgroundColor = weatherEvent.backgroundColor
        weatherUIImageView.image = weatherEvent.image
        weatherCollectionView?.reloadData()
    }

    // MARK: - Private Methods

    private func selectFirstEvent() {
        guard let events = presenter?.events,
              !events.isEmpty else { return }

        let item = Int.random(in: 0..<events.count)

        selectedIndexPath = IndexPath(item: item, section: 0)

        didSelectWeatherEvent()
    }

    private func setupWeatherUIView() {
        view.addSubview(weatherUIView)

        weatherUIView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        weatherUIView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        weatherUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        weatherUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

    private func setupWeatherUIImageView() {
        weatherUIView.addSubview(weatherUIImageView)

        weatherUIImageView.centerXAnchor.constraint(equalTo: weatherUIView.centerXAnchor).isActive = true
        weatherUIImageView.centerYAnchor.constraint(equalTo: weatherUIView.centerYAnchor).isActive = true
        weatherUIImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        weatherUIImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

    private func setupWeatherCollectionView() {
        configureCollectionView()
        configureDataSource()

        guard let weatherCollectionView = weatherCollectionView else { return }

        weatherCollectionView.translatesAutoresizingMaskIntoConstraints = false
        weatherCollectionView.register(WeatherViewCell.self, forCellWithReuseIdentifier: WeatherViewCell.reuseIdent)
        weatherCollectionView.backgroundColor = .white
        weatherCollectionView.delegate = self

        weatherUIView.addSubview(weatherCollectionView)

        weatherCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        weatherCollectionView.bottomAnchor.constraint(equalTo: weatherUIImageView.topAnchor, constant: -40).isActive = true
        weatherCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        weatherCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

// MARK: - UICollectionViewCompositionalLayout

extension WeatherCollectionViewController {

    private func configureCollectionView() {

        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
        )

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(0.5)
        )

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: item,
            count: 3
        )

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous

        let layout = UICollectionViewCompositionalLayout(section: section)

        weatherCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    }

    private func configureDataSource() {
        guard let weatherCollectionView = weatherCollectionView else { return }

        dataSource = UICollectionViewDiffableDataSource<Section, WeatherEvent>(
            collectionView: weatherCollectionView
        ) { (collectionView, indexPath, item) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: WeatherViewCell.reuseIdent,
                for: indexPath
            ) as? WeatherViewCell else {
                fatalError("Cannot create new cell")
            }

            let isSelected = self.selectedIndexPath == indexPath

            if (self.selectedIndexPath == indexPath) {
                cell.isSelected = isSelected
                cell.backgroundColor = .brown
            } else {
                cell.isSelected = !isSelected
                cell.backgroundColor = .clear
            }

            cell.configCell(with: item.title)

            return cell
        }
    }

    private func applyInitialSnapshot() {
        guard let dataSource = dataSource else { return }

        var snapshot = NSDiffableDataSourceSnapshot<Section, WeatherEvent>()
        snapshot.appendSections([.main])
        snapshot.appendItems(presenter?.events ?? [], toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

// MARK: - UICollectionViewDelegate

extension WeatherCollectionViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        selectedIndexPath = indexPath
        didSelectWeatherEvent()
    }
}
