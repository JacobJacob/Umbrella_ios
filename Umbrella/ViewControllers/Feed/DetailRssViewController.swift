//
//  DetailRssViewController.swift
//  Umbrella
//
//  Created by Lucas Correa on 30/08/2018.
//  Copyright © 2018 Security First. All rights reserved.
//

import UIKit
import WebKit
import FeedKit

class DetailRssViewController: UIViewController {

    @IBOutlet weak var detailWebView: UIWebView!
    lazy var detailRssViewModel: DetailRssViewModel = {
        let detailRssViewModel = DetailRssViewModel()
        return detailRssViewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let link = detailRssViewModel.item?.link {
            let request = URLRequest(url: URL(string: link)!)
            self.detailWebView.loadRequest(request)
            
            self.title = detailRssViewModel.item?.title
        }
        
        let shareBarButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.action, target: self, action: #selector(self.shareAction(_:)))
        self.navigationItem.rightBarButtonItem  = shareBarButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //
    // MARK: - Actions
    
    @IBAction func shareAction(_ sender: UIBarButtonItem) {
        if let link = detailRssViewModel.item?.link {
            let objectsToShare = [URL(string: link)!]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            
            //New Excluded Activities Code
            activityVC.excludedActivityTypes = [UIActivityType.airDrop, UIActivityType.addToReadingList, UIActivityType.saveToCameraRoll, UIActivityType.copyToPasteboard]
            
            activityVC.completionWithItemsHandler = {(activityType: UIActivityType?, completed: Bool, returnedItems: [Any]?, error: Error?) in
                if !completed {
                    // User canceled
                    return
                }
                // User completed activity
            }
            
            self.present(activityVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func rewindAction(_ sender: Any) {
        self.detailWebView.goBack()
    }
    
    @IBAction func forwardAction(_ sender: Any) {
        self.detailWebView.goForward()
    }
    
    @IBAction func refreshAction(_ sender: Any) {
        self.detailWebView.reload()
    }
}
