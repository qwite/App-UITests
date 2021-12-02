//
//  MainPresenter.swift
//  Demo
//
//  Created by Кирилл on 03.11.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import AVFoundation

protocol MainViewOutput {
    func viewIsReady()
    
    func numberOfCells() -> Int
    func viewModel(for index: Int) -> MainCollectionCellViewModel?
    
    func didChangePage()
    func didEndSwitchingToPage(at index: Int)
    func didTapCell(at index: Int)
}

class MainPresenter {
    weak var view: MainViewInput?
    
    private let models: [MainCollectionCellViewModel] = [
        .init(title: "Voice example 1", color: .blue, file: Resources.Files.voiceExample1),
        .init(title: "Voice example 2", color: .green, file: Resources.Files.voiceExample2),
        .init(title: "Voice example 3", color: .blue, file: Resources.Files.voiceExample3),
        .init(title: "Voice example 4", color: .orange, file: Resources.Files.voiceExample4),
        .init(title: "Voice example 5", color: .purple, file: Resources.Files.voiceExample5),
        .init(title: "Voice example 6", color: .green, file: Resources.Files.voiceExample6),
        .init(title: "Voice example 7", color: .orange, file: Resources.Files.voiceExample7),
    ]
    
    private var currentIndex = 0
    private var player: AVAudioPlayer?
    
    private lazy var displayLink = CADisplayLink(target: self, selector: #selector(displayUpdate))
    
    private func setupPlayer(for url: URL) {
        player = nil
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
            let player = try AVAudioPlayer(contentsOf: url)
            player.currentTime = 0
            player.prepareToPlay()
            self.player = player
        } catch {
            print(error)
        }
    }
    
    @objc private func displayUpdate() {
        guard let player = player else { return }
        let progress = player.currentTime / player.duration
        self.view?.setProgress(progress: progress, at: self.currentIndex)
    }
}

extension MainPresenter: MainViewOutput {
    func viewIsReady() {
        if let url = models.at(currentIndex)?.file {
            setupPlayer(for: url)
        }
        displayLink.add(to: .current, forMode: .common)
    }
    
    func numberOfCells() -> Int { models.count }
    
    func viewModel(for index: Int) -> MainCollectionCellViewModel? {
        models.at(index)
    }
    
    func didChangePage() {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
    }
    
    func didEndSwitchingToPage(at index: Int) {
        guard
            let url = models.at(index)?.file,
            currentIndex != index
        else { return }
        currentIndex = index
        player?.stop()
        setupPlayer(for: url)
        player?.play()
    }
    
    func didTapCell(at index: Int) {
        guard currentIndex == index else { return }
        if player?.isPlaying == true {
            player?.stop()
        } else {
            player?.play()
        }
    }
}
