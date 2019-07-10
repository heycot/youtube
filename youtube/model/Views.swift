//
//  Views.swift
//  youtube
//
//  Created by Tu (Callie) T. NGUYEN on 7/10/19.
//  Copyright © 2019 Tu (Callie) T. NGUYEN. All rights reserved.
//

import UIKit

class Video: NSObject {
    var thumbnailImageName: String?
    var title: String?
    var numberOfViews: NSNumber?
    var uploadDate: NSDate?
    
    var channel: Channel?
}


class Channel: NSObject {
    var name: String?
    var profileImageName : String?
}
