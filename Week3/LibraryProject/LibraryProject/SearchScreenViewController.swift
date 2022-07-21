//
//  SearchScreenViewController.swift
//  LibraryProject
//
//  Created by 이동기 on 2022/07/21.
//

import UIKit

class SearchScreenViewController: UIViewController {

    static let identifier = "SearchScreenViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "찾기"

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonClicked))
    }
    
    @objc func closeButtonClicked() {
        self.dismiss(animated: true)
    }
    

    

}
