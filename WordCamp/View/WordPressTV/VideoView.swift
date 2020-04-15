//
//  VideoPlayer.swift
//  WordCamps
//
//  Created by Cesar Tardaguila on 14/4/2020.
//  Copyright © 2020 automattic. All rights reserved.
//

import SwiftUI
import AVFoundation
import AVKit

struct VideoPreviewView: View {
    @State var maxHeight:CGFloat = 200
    let video: VideoViewModel
    @State var showPlayIcon:Bool
    @EnvironmentObject var playerState : PlayerState
    @State private var showVideoPlayer = false
    
    private var tap: some Gesture {
        TapGesture(count: 1)
            .onEnded { _ in self.showVideoPlayer = !self.showVideoPlayer }
    }
    
    var body: some View {
        VStack {
            VideoView(url: video.videoURL, volume: 0)
                .cornerRadius(15)
                .frame(width: nil, height: maxHeight, alignment: .center)
                .shadow(color: Color.black.opacity(0.7), radius: 10, x: 0, y: 2)
                .padding(.horizontal, 20)
                .padding(.top, 20)
            if showPlayIcon {
                    Image(systemName: "play.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40, alignment: .center)
                        .offset(x: 0, y: -1 * (maxHeight / 2) - 20)
                        .foregroundColor(Color.white)
            }
        }.gesture(tap)
        .sheet(isPresented: self.$showVideoPlayer, onDismiss: { self.playerState.currentPlayer?.pause() }) {
            AVPlayerView(videoURL: self.video.videoURL)
                 .edgesIgnoringSafeArea(.all)
                 .environmentObject(self.playerState)
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


struct AVPlayerView: UIViewControllerRepresentable {
    let videoURL: URL
    @EnvironmentObject var playerState : PlayerState

    private var player: AVPlayer {
        return AVPlayer(url: videoURL)
    }

    func updateUIViewController(_ playerController: AVPlayerViewController, context: Context) {
        playerController.player = player
        playerController.player?.play()
    }

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let playerController = AVPlayerViewController()
        playerController.modalPresentationStyle = .fullScreen
        playerController.player = playerState.player(for: videoURL)
        playerController.player?.play()
        return playerController
    }
}

final class PlayerState: ObservableObject {

    public var currentPlayer: AVPlayer?
    private var videoUrl : URL?

    public func player(for url: URL) -> AVPlayer {
        if let player = currentPlayer, url == videoUrl {
            return player
        }
        currentPlayer = AVPlayer(url: url)
        videoUrl = url
        return currentPlayer!
    }
}
