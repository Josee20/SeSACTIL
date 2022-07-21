//
//  moreInfoViewController.swift
//  LibraryProject
//
//  Created by 이동기 on 2022/07/21.
//

import UIKit

class moreInfoViewController: UIViewController {

    static let identifier = "moreInfoViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func moveWebPageButtonClicked(_ sender: Any) {
        
        let sb = UIStoryboard(name: "WebScreen", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: WebScreenViewController.identifier) as! WebScreenViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
}
