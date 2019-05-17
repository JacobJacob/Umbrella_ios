//
//  WebViewController.swift
//  Umbrella
//
//  Created by Lucas Correa on 30/08/2018.
//  Copyright © 2018 Security First. All rights reserved.
//

import UIKit
import WebKit
import FeedKit

class WebViewController: UIViewController {

    //
    // MARK: - Properties
    @IBOutlet weak var detailWebView: WKWebView!
    lazy var webViewModel: WebViewModel = {
        let webViewModel = WebViewModel()
        return webViewModel
    }()
    
    //
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.detailWebView.isHidden = true
        
        let shareBarButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.action, target: self, action: #selector(self.shareAction(_:)))
        self.navigationItem.rightBarButtonItem  = shareBarButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let link = webViewModel.link {
            print(link)
            let request = URLRequest(url: URL(string: link)!)
            self.detailWebView.navigationDelegate = self
            self.detailWebView.load(request)
            
            self.title = webViewModel.title
        }
    }

    //
    // MARK: - Actions
    
    @IBAction func shareAction(_ sender: UIBarButtonItem) {
        if let link = webViewModel.link {
            let objectsToShare = [URL(string: link)!]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            
            //New Excluded Activities Code
            activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList, UIActivity.ActivityType.saveToCameraRoll, UIActivity.ActivityType.copyToPasteboard]
            
            activityVC.completionWithItemsHandler = {(activityType: UIActivity.ActivityType?, completed: Bool, returnedItems: [Any]?, error: Error?) in
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

extension WebViewController: WKNavigationDelegate {

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.detailWebView.isHidden = false
    }
}
