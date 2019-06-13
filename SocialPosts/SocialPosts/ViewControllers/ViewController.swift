//
//  ViewController.swift
//  SocialPosts
//
//  Created by Santiago Moreno on 6/13/19.
//  Copyright © 2019 Santiago Moreno. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let networkManager = NetworkManager()
    var posts:[Post] = [Post]()
    
    @IBOutlet weak var tableViewPosts: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewPosts.delegate = self
        tableViewPosts.dataSource = self
        tableViewPosts.rowHeight = UITableView.automaticDimension
        tableViewPosts.estimatedRowHeight = 258
        getData()
    }
    
    func getData(){
        networkManager.getDataFromApi { (completed, posts) in
            if(completed){
                // Show the data
                self.posts.append(contentsOf: posts)
                self.tableViewPosts.reloadData()
            }else{
                // Show error message
            }
        }
    }
    
    // ----------------------------------------------------------------------------------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = posts[indexPath.row]
        guard let url = URL(string: post.link) else { return }
        UIApplication.shared.open(url)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
        let post = posts[indexPath.row]
        
        // Set optional or special values
        print("AUTHOR: \(post.author.account)")
        cell.account = post.author.account
        cell.profileLink = post.author.link
        if let attachment = post.attachment{
            cell.attachmentLink = attachment.link
        }else{
            cell.attachmentLink = ""
        }
        
        switch post.network {
        case Network.FACEBOOK:
            cell.imgSocialNetwork.image = #imageLiteral(resourceName: "fb")
            break
        case Network.TWITTER:
            cell.imgSocialNetwork.image = #imageLiteral(resourceName: "tw")
            break
        case Network.INSTAGRAM:
            cell.imgSocialNetwork.image = #imageLiteral(resourceName: "in")
            break
        default:
            break
        }
        cell.attributedTxt = getTextWithLinks(text: post.text, links: post.links)
        
        //Set regular values
        cell.lblName.text = post.author.name
        cell.lblDate.text = post.date.toString(dateFormat: "dd-MM-yyyy HH:mm:ss")
        cell.imgVerify.isHidden = post.author.verify
        
        //Last item
        if(indexPath.row == posts.count - 1){
            getData()
        }
        
        return cell
    }
    
    func getTextWithLinks(text: String, links: [Link])->NSMutableAttributedString{
        let attributedString = NSMutableAttributedString(string: text)
        
        links.forEach { (link) in
            attributedString.setAttributes([.link: link.link], range: NSMakeRange(link.location, link.lenght))
        }
        
        return attributedString
    }
    
}

