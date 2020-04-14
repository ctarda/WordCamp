//
//  VideoPlayer.swift
//  WordCamps
//
//  Created by Cesar Tardaguila on 14/4/2020.
//  Copyright © 2020 automattic. All rights reserved.
//

import SwiftUI
import AVFoundation

struct VideoPlayer: UIViewRepresentable {
    let url: URL
    
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> some UIView {
        return PlayerUIView(url: url)
    }
}

final class PlayerUIView: UIView {
    private let playerLayer = AVPlayerLayer()
    private let url: URL
    
    init(url: URL) {
        self.url = url
        super.init(frame: .zero)
        
        let player = AVPlayer(url: url)
        player.play()
        
        playerLayer.player = player
        layer.addSublayer(playerLayer)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}
