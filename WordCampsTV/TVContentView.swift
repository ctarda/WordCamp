//
//  ContentView.swift
//  WordCampsTV
//
//  Created by Cesar Tardaguila on 19/10/2019.
//  Copyright © 2019 automattic. All rights reserved.
//

import SwiftUI

struct TVContentView: View {
    @ObservedObject var viewModel: WordCampsViewModel<PhoneEventViewModel>
    
    var body: some View {
        NavigationView {
            VStack {
            List(viewModel.events) { event in
                NavigationLink(destination: TVWordCampDetail(event: event)) {
                    TVWordCampListView(event: event)
                }
            }
            .navigationBarTitle(Text("Upcoming WordCamps"))
            }
        }
    }

    init(viewModel: WordCampsViewModel<PhoneEventViewModel>) {
        self.viewModel = viewModel
    }
}
