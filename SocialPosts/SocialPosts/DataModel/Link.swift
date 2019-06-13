//
//  Link.swift
//  SocialPosts
//
//  Created by Santiago Moreno on 6/13/19.
//  Copyright © 2019 Santiago Moreno. All rights reserved.
//

import Foundation

class Link {
    private var _location: Int
    private var _lenght: Int
    private var _link: String
    
    var location: Int {
        get{ return _location }
        set{ _location = newValue }
    }
    var lenght: Int {
        get{ return _lenght }
        set{ _lenght = newValue }
    }
    var link: String {
        get{ return _link }
        set{ _link = newValue }
    }
    
    init(location: Int, lenght: Int, link: String){
        self._location = location
        self._lenght = lenght
        self._link = link
    }
}
