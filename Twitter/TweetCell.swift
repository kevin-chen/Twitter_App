//
//  TweetCell.swift
//  Twitter
//
//  Created by Kevin Chen on 3/9/2019.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var retweet: UIButton!
    @IBOutlet weak var favButton: UIButton!
    
    var favorited:Bool = false
    var tweetId:Int = -1
    var retweered:Bool = false
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let tobeFavorited = !favorited
        if (tobeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweedID: tweetId, success: {
                self.setFavorite(true)
            }, failure: { (error) in
                print("Favorite did not succeed: \(error)")
            })
        }
        else{
            TwitterAPICaller.client?.unfavoriteTweet(tweedID: tweetId, success: {
                self.setFavorite(false)
            }, failure: {(error) in
                print("Favorite did not succeed: \(error)")
            })
        }
    }
 
    
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client.
    }
   
    
    func setRetweeted(_ isRetweeted: Bool){
        if (isRetweeted){
            retweet.setImage(UIImage(named: "retweet-icon-green", for: UIControl.isEnabled), for: <#UIControl.State#> )
        }
        else{
            retweet.setImage(UIImage(named: "retweet-icon-g", for: UIControl.isEnabled), for: <#UIControl.State#>)
        }
    }
    
    func setFavorite (_ isFavoriated:Bool){
        favorited = isFavoriated
        if(favorited){
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        else{
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
