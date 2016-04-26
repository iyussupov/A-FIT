//
//  NewsVC.swift
//  xfit
//
//  Created by Ingwar on 3/5/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import UIKit
//import Parse

class NewsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
        
        
        @IBOutlet weak var tableView: UITableView!
        
        override func viewWillAppear(animated: Bool) {
            self.navigationController?.navigationBarHidden = true
            self.evo_drawerController?.openDrawerGestureModeMask = .All
        }
        
        var news = [News]()
        var category: Category!
        static var imageCache = NSCache()
        let newsLimit = 2
        var newsSkip = 0
        var newsCount = 0
        var refreshControl:UIRefreshControl!
        var loadMoreStatus = false
        var isRefreshing = false
        var preventAnimation = Set<NSIndexPath>()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
          
            self.refreshControl = UIRefreshControl()
            self.refreshControl.addTarget(self, action: #selector(NewsVC.refresh(_:)), forControlEvents: UIControlEvents.ValueChanged)
            self.tableView.addSubview(refreshControl)
            
            tableView.dataSource = self
            tableView.delegate = self
            
            tableView.estimatedRowHeight = tableView.rowHeight
            tableView.rowHeight = UITableViewAutomaticDimension
            
//            self.postsCount()
            self.parseDataFromParse()
        }
        
        func postsCount() {
            
        }
        
        func parseDataFromParse() {

                    
                   let objects = [[
                        "category":"News",
                        "comments":"5",
                        "featuredImage":"img2",
                        "content":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut at urna ut tortor facilisis volutpat. Quisque ac neque eu dui tincidunt ultricies et sit amet nisi.",
                        "title":"A-FIT & CB12 - DOUBLE OFFER"
                    ],[
                        "category":"Offers",
                        "comments":"20",
                        "content":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut at urna ut tortor facilisis volutpat. Quisque ac neque eu dui tincidunt ultricies et sit amet nisi.",
                        "featuredImage":"img1",
                        "title":"INDIVIDUAL AND FAMILY CARDS WITH DISCOUNT ATTENTION!"
                    ],[
                        "category":"Offers",
                        "comments":"15",
                        "content":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut at urna ut tortor facilisis volutpat. Quisque ac neque eu dui tincidunt ultricies et sit amet nisi.",
                        "featuredImage":"img3",
                        "title":"Getting ready to beach season with A-FIT"
                    ],[
                        "category":"News",
                        "comments":"10",
                        "content":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut at urna ut tortor facilisis volutpat. Quisque ac neque eu dui tincidunt ultricies et sit amet nisi.",
                        "featuredImage":"img4",
                        "title":"New fitness club with seawater (swimming) pool"
                    ]]
            
                    for object in objects {
                        
                        let new = News(dictionary: object)
            
                        self.news.append(new)
                        
                    }
               
                
                self.tableView.reloadData()
        }
        
        func refresh(sender:AnyObject) {
            self.isRefreshing = true
            refreshBegin("Refresh",
                refreshEnd: {(x:Int) -> () in
                    self.refreshControl.endRefreshing()
                    self.isRefreshing = false
            })
            
        }
        
        func refreshBegin(newtext:String, refreshEnd:(Int) -> ()) {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
                dispatch_async(dispatch_get_main_queue()) {
                    self.preventAnimation.removeAll()
                    self.newsSkip = 0
//                    self.parseDataFromParse()
//                    self.tableView.reloadData()
                }
                sleep(2)
                
                dispatch_async(dispatch_get_main_queue()) {
                    refreshEnd(0)
                }
            }
        }
        
        func scrollViewDidScroll(scrollView: UIScrollView) {
            let currentOffset = scrollView.contentOffset.y
            let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
            if (maximumOffset - currentOffset) <= 0 {
//                loadMore()
            }
        }
        
        func loadMore() {
            if !loadMoreStatus && !isRefreshing {
                self.loadMoreStatus = true
                loadMoreBegin("Load more",
                    loadMoreEnd: {(x:Int) -> () in
                        self.loadMoreStatus = false
                })
            }
        }
        
        func loadMoreBegin(newtext:String, loadMoreEnd:(Int) -> ()) {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
                dispatch_async(dispatch_get_main_queue()) {
                    self.newsSkip += self.newsLimit
                    if self.newsSkip <= self.newsCount {
                        self.parseDataFromParse()
                    } else {
                        self.loadMoreStatus = true
                    }
                }
                sleep(2)
                
                dispatch_async(dispatch_get_main_queue()) {
                    loadMoreEnd(0)
                }
            }
        }
        
        func numberOfSectionsInTableView(tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return news.count
        }
        
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            
            let news = self.news[indexPath.row]
            
            if let cell = tableView.dequeueReusableCellWithIdentifier("NewsCell") as? NewsCell {
                
                var img: UIImage?
                
                if let url = news.featuredImg {
                    
                    img = NewsVC.imageCache.objectForKey(url) as? UIImage
                    
                }
                
                cell.configureCell(news, img: img)
                
                return cell
            } else {
                return NewsCell()
            }
            
        }
        
        func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
            if !preventAnimation.contains(indexPath) {
                preventAnimation.insert(indexPath)
                cell.alpha = 0
                UIView.animateWithDuration(1.0, animations: { () -> Void in
                    cell.alpha = 1
                })
            }
        }
    
        func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            
            let news = self.news[indexPath.row]
            performSegueWithIdentifier("NewsDetailVC", sender: news)
            
        }

        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if segue.identifier == "NewsDetailVC" {
                if let newsDetailVC = segue.destinationViewController as? NewsDetailVC {
                    if let news = sender as? News {
                        newsDetailVC.news = news
                    }
                }
            }
        }

    @IBAction func openMenu(sender: AnyObject) {
        self.evo_drawerController?.toggleDrawerSide(.Left, animated: true, completion: nil)
        
    }
    
    @IBAction func openProfile(sender: AnyObject) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("ProfileVC") as! ProfileVC
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
}

