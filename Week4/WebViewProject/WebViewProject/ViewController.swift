//
//  ViewController.swift
//  WebViewProject
//
//  Created by 이동기 on 2022/07/28.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var goBackButton: UIBarButtonItem!
    @IBOutlet weak var reloadButton: UIBarButtonItem!
    @IBOutlet weak var goForwardButton: UIBarButtonItem!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var webPage: WKWebView!
    
    var startingURL = "https://www.daum.net"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        openWebPage(url: startingURL)
        searchBar.delegate = self
    }
    
    func openWebPage(url: String) {
        guard let url = URL(string: url) else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        webPage.load(request)
    }
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
        
    }
    
    @IBAction func goBackButtonClicked(_ sender: Any) {
        webPage.goBack()
    }
    
    @IBAction func reloadButtonClicked(_ sender: Any) {
        webPage.reload()
    }
    
    @IBAction func goForwardButtonClicked(_ sender: Any) {
        webPage.goForward()
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        openWebPage(url: searchBar.text!)
    }
}

