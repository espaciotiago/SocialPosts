//
//  DataManager.swift
//  SocialPosts
//
//  Created by Santiago Moreno on 6/13/19.
//  Copyright © 2019 Santiago Moreno. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct Api {
    static let BASE_URL = "https://storage.googleapis.com/cdn-og-test-api/test-task/social/"
}

class NetworkManager{
    private var _page: Int = 1
    
    var page: Int{
        get{return _page}
        set{_page = newValue}
    }
    
    init(){}
    
    func getDataFromApi(completion: @escaping(_ completed: Bool, _ posts: [Post])->Void){
        let url = Api.BASE_URL + "\(page).json"
        var posts:[Post] = [Post]()
        AF.request(url).responseJSON { response in
            do{
                if let data = response.data {
                    let dataSource = try JSON(data: data)
                    let jsonArray = dataSource.array
                    jsonArray?.forEach({ (jsonData) in
                        let authorData = jsonData["author"].dictionary
                        let textData = jsonData["text"].dictionary
                        
                        // Get Authors data
                        let account = authorData?["account"]?.stringValue ?? ""
                        let verify = authorData?["is-verified"]?.boolValue ?? false
                        let name = authorData?["name"]?.stringValue ?? ""
                        let authorLink = authorData?["picture-link"]?.stringValue ?? ""
                        let author = Author(account: account, verify: verify, name: name, link: authorLink)
                        
                        // Get Attachment data
                        var attachment:Attachment? = nil
                        if let attachmentData = jsonData["attachment"].dictionary{
                            let imagelink = attachmentData["picture-link"]?.stringValue ?? ""
                            let height = attachmentData["width"]?.intValue ?? 0
                            let width = attachmentData["height"]?.intValue ?? 0
                            attachment = Attachment(link: imagelink, width: width, height: height)
                        }
                        
                        // Get text data links
                        var links = [Link]()
                        let plain = textData?["plain"]?.stringValue ?? ""
                        let markup = textData?["markup"]?.array
                        markup?.forEach({ (textLinkData) in
                            let location = textLinkData["location"].intValue
                            let lenght = textLinkData["length"].intValue
                            let textLink = textLinkData["link"].stringValue
                            let embebedLink = Link(location: location, lenght: lenght, link: textLink)
                            links.append(embebedLink)
                        })
                        
                        // Get post data
                        let link = jsonData["link"].stringValue
                        let network = jsonData["network"].stringValue
                        let dateStr = jsonData["date"].stringValue
                        let date = Date(dateString: dateStr)
                        let post = Post(link: link, network: network, author: author, text: plain, date: date, attachment: attachment, links: links)
                        posts.append(post)
                    })
                    completion(true,posts)
                }
            }catch{
                completion(false,posts)
            }
        }
    }
    
}
