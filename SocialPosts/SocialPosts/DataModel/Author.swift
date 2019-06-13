//
//  Author.swift
//  SocialPosts
//
//  Created by Santiago Moreno on 6/13/19.
//  Copyright © 2019 Santiago Moreno. All rights reserved.
//

import Foundation

class Author {
    private var _account: String
    private var _verify: Bool
    private var _name: String
    private var _link: String
    
    var account:String{
        get{return _account}
        set{_account = newValue}
    }
    var verify:Bool{
        get{return _verify}
        set{_verify = newValue}
    }
    var name:String{
        get{return _name}
        set{_name = newValue}
    }
    var link:String{
        get{return _link}
        set{_link = newValue}
    }
    
    init(account: String, verify: Bool, name: String, link: String) {
        self._account = account
        self._verify = verify
        self._name = name
        self._link = link
    }
}
