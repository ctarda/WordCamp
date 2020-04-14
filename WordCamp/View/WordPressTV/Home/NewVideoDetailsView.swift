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
        ScrollView {
            VStack(alignment: .leading) {
                RemoteImageView(imageURL: video.thumbnail)
                    .frame(height: CGFloat(200), alignment: .center)
                
                Divider()
                
                Text(video.title)
                    .font(.title)
                    .lineLimit(2)
                
                Divider()
                
                Text(video.description)
                
            }.padding()
        }
    }
}
