//
//  Post.swift
//  SocialPosts
//
//  Created by Santiago Moreno on 6/13/19.
//  Copyright © 2019 Santiago Moreno. All rights reserved.
//

import Foundation

struct Network {
    static let TWITTER = "twitter"
    static let FACEBOOK = "facebook"
    static let INSTAGRAM = "instagram"
}

class Post {
    private var _link: String
    private var _network: String
    private var _author: Author
    private var _text: String
    private var _date: Date
    private var _links: [Link]
    private var _attachment: Attachment?
    
    var link: String{
        get{return _link}
        set{_link = newValue}
    }
    var network: String{
        get{return _network}
        set{_network = newValue}
    }
    var author: Author{
        get{return _author}
        set{_author = newValue}
    }
    var text: String{
        get{return _text}
        set{_text = newValue}
    }
    var date: Date{
        get{return _date}
        set{_date = newValue}
    }
    var links: [Link]{
        get{return _links}
        set{_links = newValue}
    }
    var attachment: Attachment? {
        get{return _attachment}
        set{_attachment = newValue}
    }
    
    init(link: String,network: String,author: Author,text: String,date: Date,attachment: Attachment?, links: [Link]) {
        self._link = link
        self._network = network
        self._author = author
        self._text = text
        self._date = date
        self._attachment = attachment
        self._links = links
    }
}
