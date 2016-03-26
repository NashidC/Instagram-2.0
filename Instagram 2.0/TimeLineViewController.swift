//
//  TimelineViewController.swift
//  Instagram 2.0
//
//  Created by Nashid  on 3/26/16.
//  Copyright © 2016 CodePath. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class TimeLineViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    var posts: [PFObject]?
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        fetchData()

        // Do any additional setup after loading the view.
    }
    
    func fetchData() {
        // construct PFQuery
        let query = PFQuery(className: "Post")
        query.orderByDescending("createdAt")
        query.includeKey("author")
        query.limit = 20
        
        // fetch data asynchronously
        query.findObjectsInBackgroundWithBlock { (posts: [PFObject]?, error: NSError?) -> Void in
            if let posts = posts {
                // do something with the data fetched
                print((posts[0]["author"] as! PFUser).username)
                self.posts = posts
                self.tableView.reloadData()
                
            } else {
                // handle error
            }
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        fetchData()
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let posts = posts {
            print(posts.count)
            return posts.count
        } else {
            return 0
        }
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TimeLineCell", forIndexPath: indexPath) as! TimeLineCell
        let postsArray = posts![indexPath.row]
        let author = postsArray["author"] as! PFUser
        cell.pictureView.file = (postsArray["media"] as! PFFile)
        cell.pictureView.loadInBackground()
        cell.captionLabel.text = postsArray["caption"] as! String
        return cell
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
