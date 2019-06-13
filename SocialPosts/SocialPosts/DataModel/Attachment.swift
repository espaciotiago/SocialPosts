//
//  Attachment.swift
//  SocialPosts
//
//  Created by Santiago Moreno on 6/13/19.
//  Copyright © 2019 Santiago Moreno. All rights reserved.
//

import Foundation

class Attachment {
    private var _link: String
    private var _width: Int
    private var _height: Int
    
    var link: String {
        get{ return _link }
        set{ _link = newValue }
    }
    var width: Int {
        get{ return _width }
        set{ _width = newValue }
    }
    var height: Int {
        get{ return _height }
        set{ _height = newValue }
    }
    
    init(link: String, width: Int, height: Int){
        self._link = link
        self._width = width
        self._height = height
    }
}
