//
//  MainViewController.swift
//  Demo
//
//  Created by Кирилл on 03.11.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MainViewInput: AnyObject {
    func setProgress(progress: Double, at index: Int)
}

class MainViewController: UIViewController {
    
    var output: MainViewOutput!
    
    @IBOutlet private weak var headingLabel: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private var lastPageIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTheme()
        headingLabel.text = "main.heading.text".localized
        
        let cellNib = UINib(nibName: MainCollectionCell.nibName, bundle: .current)
        collectionView.register(cellNib, forCellWithReuseIdentifier: MainCollectionCell.reuseIdentifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.decelerationRate = .init(rawValue: 0.970)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.layer.masksToBounds = false
        
        updateCollectionLayout()
        
        output.viewIsReady()
    }
    
    func setupTheme() {
        
        headingLabel.font = Resources.Fonts.heading
        headingLabel.textColor = Resources.Colors.black
        view.backgroundColor = Resources.Colors.white
    }
    
    private func updateCollectionLayout() {
        view.layoutIfNeeded()
        collectionView.reloadData()
        let inset = collectionView.frame.width / 10
        collectionView.contentInset = .init(top: 0, left: inset, bottom: 0, right: inset)
        let cellSize = collectionView.frame
            .inset(by: collectionView.adjustedContentInset)
            .size
        let layout = MainCollectionViewLayout(pageSize: cellSize, lineSpacing: 0)
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        collectionView.collectionViewLayout.invalidateLayout()
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.page != lastPageIndex {
            output.didChangePage()
        }
        lastPageIndex = scrollView.page
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard !scrollView.isDragging else { return }
        output.didEndSwitchingToPage(at: collectionView.page)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        output.didTapCell(at: indexPath.row)
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        output.numberOfCells()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt index: IndexPath) -> UICollectionViewCell {
        let cell: MainCollectionCell? = collectionView.dequeueReusableCell(for: index)
        let viewModel = output.viewModel(for: index.item)
        cell?.setup(with: viewModel)
        cell?.progress = 0
        return cell ?? .init()
    }
}

extension MainViewController: MainViewInput {
    func setProgress(progress: Double, at index: Int) {
        let indexPath = IndexPath(item: index, section: 0)
        let cell = collectionView.cellForItem(at: indexPath) as? MainCollectionCell
        cell?.progress = progress
    }
}
