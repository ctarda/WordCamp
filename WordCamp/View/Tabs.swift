//
//  Tabs.swift
//  WordCamps
//
//  Created by Cesar Tardaguila on 10/4/2020.
//  Copyright © 2020 automattic. All rights reserved.
//

import SwiftUI

struct Tabs: View {
    var body: some View {
        TabView {
            ScheduleList(viewModel: WordCampsViewModel<PhoneEventViewModel>())
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Events")
            }
            
            Text("Videos").tabItem {
                Image(systemName: "tv")
                Text("Videos")
            }
        }
    }
}
