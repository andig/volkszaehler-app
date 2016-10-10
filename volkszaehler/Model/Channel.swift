//
//  Channel.swift
//  volkszaehler
//
//  Created by Andreas Götz on 08/10/2016.
//  Copyright © 2016 Andreas Götz. All rights reserved.
//

import Foundation

class Channel {
    
    var uuid: String
    var title: String?
    
    init(uuid: String) {
        self.uuid = uuid
        self.title = ""
        
        // populate missing attributes
        loadChannelDetails()
    }
    
    init(uuid: String, title: String) {
        self.uuid = uuid
        self.title = title
    }
    
    func loadChannelDetails() {
        
    }
}
