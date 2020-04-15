//
//  VideoPlayer.swift
//  WordCamps
//
//  Created by Cesar Tardaguila on 14/4/2020.
//  Copyright © 2020 automattic. All rights reserved.
//

import SwiftUI
import AVFoundation

struct VideoPreviewView: View {
    @State var maxHeight:CGFloat = 200
    let video: VideoViewModel
    
    var body: some View {
        VStack{
            VideoView(url: video.videoURL, volume: 0)
                .cornerRadius(15)
                .frame(width: nil, height: maxHeight, alignment: .center)
                .shadow(color: Color.black.opacity(0.7), radius: 10, x: 0, y: 2)
                .padding(.horizontal, 20)
                .padding(.top, 20)
        }
    }
}

struct VideoCard: View {
    @State var videoURL:URL
    @State var showPlayIcon:Bool
    
    var body: some View {
        ZStack {
            VideoView(url: videoURL, volume: 0)
            if showPlayIcon {
                Image(systemName: "play.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(minWidth: 20, idealWidth: 40, maxWidth: 40, minHeight: 20, idealHeight: 40, maxHeight: 40, alignment: .center)
                .foregroundColor(Color.white)
            }
        }
    }
}

struct VideoView: UIViewRepresentable {
    let url: URL
    let volume: Float
    
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> some UIView {
        return PlayerUIView(url: url, previewLength: 15, initialVolume: volume)
    }
}

final class PlayerUIView: UIView {
    private let playerLayer = AVPlayerLayer()
    private var previewTimer:Timer?
    private let previewLength:Double
    private let url: URL
    
    init(url: URL, previewLength: Double, initialVolume: Float) {
        self.url = url
        self.previewLength = previewLength
        super.init(frame: .zero)
        
        let player = AVPlayer(url: url)
        player.play()
        player.volume = initialVolume
        
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.backgroundColor = UIColor.darkText.cgColor
        
        previewTimer = Timer.scheduledTimer(withTimeInterval: previewLength, repeats: true, block: { (timer) in
            player.seek(to: CMTime(seconds: 0, preferredTimescale: CMTimeScale(1)))
        })
        
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
