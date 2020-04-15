//
//  NewVideoDetailsView.swift
//  WordCamps
//
//  Created by Cesar Tardaguila on 14/4/2020.
//  Copyright © 2020 automattic. All rights reserved.
//

import SwiftUI

struct NewVideoDetailsView: View {
    let video: VideoViewModel
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    VideoPreviewView(maxHeight: 200, video: video, showPlayIcon: true)
                    
                    Text(video.title)
                        .font(.title)
                        .lineLimit(2)
                    
                    Divider()
                    
                    Text(video.description)
                    
                }.padding()
            }            
        }.navigationBarTitle(Text(video.title), displayMode: .inline)
    }
}
