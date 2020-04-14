//
//  NewVideoCell.swift
//  WordCamps
//
//  Created by Cesar Tardaguila on 14/4/2020.
//  Copyright © 2020 automattic. All rights reserved.
//

import SwiftUI

struct NewVideoListView: View {
    let video: VideoViewModel
    
    var body: some View {
        HStack {
            RemoteImageView(imageURL: video.thumbnail)
                .frame(width: 100, height: 60, alignment: .center)
            Text(video.title)
        }
    }
}
