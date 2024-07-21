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
    func updateWeatherView(for weatherEvent: WeatherEvent)
}

enum Section {
    case main
}

final class WeatherCollectionViewController: UIViewController, WeatherCollectionViewProtocol {

    // MARK: - Public Properties

    var presenter: WeatherCollectionPresenterProtocol?

    // MARK: - Private Properties

    private var dataSource: UICollectionViewDiffableDataSource<Section, WeatherEvent>?
    private var weatherCollectionView: UICollectionView?
    private var selectedIndexPath: IndexPath?

    private lazy var weatherUIView: WeatherViewProtocol = {
        let weatherUIView = WeatherView()
        weatherUIView.translatesAutoresizingMaskIntoConstraints = false
        return weatherUIView
    }()

    // MARK: - Overrides Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        let weatherCollectionPresenter = WeatherCollectionPresenter()
        self.presenter = weatherCollectionPresenter
        weatherCollectionPresenter.view = self

        setupWeatherUIView()
        setupWeatherCollectionView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        applyInitialSnapshot()
        selectRandomEvent()
    }

    // MARK: - Public Methods

    func didSelectWeatherEvent() {
        guard let selectedIndexPath = selectedIndexPath else { return }
        weatherCollectionView?.selectItem(at: selectedIndexPath, animated: true, scrollPosition: .centeredHorizontally)
        presenter?.didSelectWeatherEvent(selectedIndexPath)
    }

    func updateWeatherView(for weatherEvent: WeatherEvent) {
        UIView.transition(with: weatherUIView,
                          duration: 0.5,
                          options: [.transitionCrossDissolve, .curveEaseInOut],
                          animations: { self.presenter?.changeAnimate(on: self.weatherUIView)},
                          completion: nil
        )
       weatherCollectionView?.reloadData()
   }

    // MARK: - Private Methods

    private func selectRandomEvent() {
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

    private func setupWeatherCollectionView() {
        configureCollectionView()
        configureDataSource()

        guard let weatherCollectionView = weatherCollectionView else { return }

        weatherCollectionView.translatesAutoresizingMaskIntoConstraints = false
        weatherCollectionView.register(WeatherViewCell.self, forCellWithReuseIdentifier: WeatherViewCell.reuseIdent)
        weatherCollectionView.backgroundColor = .clear
        weatherCollectionView.delegate = self

        view.addSubview(weatherCollectionView)

        weatherCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        weatherCollectionView.heightAnchor.constraint(equalToConstant:  UIScreen.main.bounds.size.height / 3).isActive = true
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
            widthDimension: .fractionalWidth(0.3),
            heightDimension: .fractionalHeight(0.6)
        )

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: item,
            count: 1
        )

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10)

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

            cell.configCell(with: item, isSelected: isSelected)

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
