//
//  OpenVideoButton.swift
//  WordCamps
//
//  Created by Cesar Tardaguila on 14/4/2020.
//  Copyright © 2020 automattic. All rights reserved.
//

import SwiftUI

struct OpenVideoButton: View {
    @State private var showModal: Bool = false

    let video: VideoViewModel

    var body: some View {
        HStack(alignment: .center) {
            Spacer()

            Button(action: {
                self.showModal = true
            }) {
                Text("Open video player")
            }
            .sheet(isPresented: self.$showModal) {
                VideoPlayer(url: self.video.videoURL)
            }

            Spacer()
        }
    }
}
