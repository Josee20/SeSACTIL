//
//  SearchTableViewController.swift
//  TrendMedia
//
//  Created by 이동기 on 2022/07/20.
//

import UIKit

class SearchTableViewController: UITableViewController {

    var harryPotterList = HarryPotterInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        
        let data = harryPotterList.info[indexPath.row]
        cell.configurationCell(data: data)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return harryPotterList.info.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 8
    }
}
