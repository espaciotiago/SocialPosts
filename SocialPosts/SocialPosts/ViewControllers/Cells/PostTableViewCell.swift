//
//  PostTableViewCell.swift
//  SocialPosts
//
//  Created by Santiago Moreno on 6/13/19.
//  Copyright © 2019 Santiago Moreno. All rights reserved.
//

import UIKit
import PINRemoteImage

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgAuthor: UIImageView!
    @IBOutlet weak var imgSocialNetwork: UIImageView!
    @IBOutlet weak var imgAttachment: UIImageView!
    @IBOutlet weak var lblAccount: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var txtText: UITextView!
    @IBOutlet weak var imgVerify: UIImageView!
    
    var account: String? {
        didSet{
            if let acc = account{
                lblAccount.text = "@" + acc
            }
        }
        willSet(value){
            if let val = value {
                if(val.isEmpty){
                    lblAccount.isHidden = true
                }else{
                    lblAccount.isHidden = false
                }
            }
        }
    }
    var attachmentLink: String? {
        didSet{
            if let attach = self.attachmentLink{
                // Load image
                imgAttachment.pin_setImage(from: URL(string: attach))
            }
        }
        willSet(value){
            if let val = value {
                if(val.isEmpty){
                    imgAttachment.isHidden = true
                }
            }
        }
    }
    var profileLink: String? {
        didSet{
            if let attach = self.profileLink{
                // Load image
                imgAuthor.pin_setImage(from: URL(string: attach))
            }
        }
    }
    var attributedTxt:NSAttributedString?{
        didSet{
            if let txt = self.attributedTxt {
                txtText.attributedText = txt
                adjustUITextViewHeight(arg: txtText)
            }
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //adjustUITextViewHeight(arg: txtText)
        txtText.isUserInteractionEnabled = true
        txtText.isEditable = false        
        txtText.linkTextAttributes = [
            .foregroundColor: UIColor.blue,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        imgAuthor.image = #imageLiteral(resourceName: "default_user")
        imgAttachment.image = #imageLiteral(resourceName: "default")
        imgAttachment.isHidden = false
        lblAccount.isHidden = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func adjustUITextViewHeight(arg : UITextView)
    {
        arg.translatesAutoresizingMaskIntoConstraints = true
        arg.sizeToFit()
        arg.isScrollEnabled = false
    }

}
