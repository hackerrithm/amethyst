//
//  Post.swift
//  Light
//
//  Created by Kemar Galloway on 7/31/19.
//  Copyright © 2019 Kemar Galloway. All rights reserved.
//

import Foundation

class Post {
    var caption: String
    var photoURL: String
    
    init(captionText: String, photoURLString: String) {
        caption = captionText
        photoURL = photoURLString
    }
}
