//
//  HostingController.swift
//  WordCampsWatch Extension
//
//  Created by Cesar Tardaguila on 19/10/2019.
//  Copyright © 2019 automattic. All rights reserved.
//

import WatchKit
import Foundation
import SwiftUI

class HostingController: WKHostingController<WordCampList> {
    override var body: WordCampList {
        return WordCampList()
    }
}
