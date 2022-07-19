//
//  ShoppingTableViewController.swift
//  TrendMedia
//
//  Created by 이동기 on 2022/07/19.
//

import UIKit

//enum SetOptions: Int, CaseIterable {
//    case a
//
//    var todo: [String] {
//        switch self {
//        case .a:
//            return ["그립톡 구매하기", "사이다 구매", "아이패드 케이스 최저가 알아보기", "양말"]
//        }
//    }
//
//    var imageViewimage : [UIImage] {
//        switch self {
//        case .a:
//            return ["checkmark.square", "checkmark.square", "checkmark.square", "checkmark.square"]
//        }
//    }
//}

class ShoppingTableViewController: UITableViewController {

    var todoList: [String] = ["그립톡 구매하기", "사이다 구매", "아이패드 케이스 최저가 알아보기", "양말"]
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var userTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 56
        viewSetting(addBtnBackColor: .systemGray5, userTextFieldBackColor: .systemGray6)

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! ShoppingTableViewCell
        
        if indexPath.row == 0 {
            cell.imageView?.image = UIImage(systemName: "checkmark.square.fill")
            cell.bookmarkButton.setImage(UIImage(systemName: "star.fill"), for: .normal)

        } else if indexPath.row == 1 {
            cell.imageView?.image = UIImage(systemName: "checkmark.square")
            cell.bookmarkButton.setImage(UIImage(systemName: "star"), for: .normal)

        } else if indexPath.row == 2 {
            cell.imageView?.image = UIImage(systemName: "checkmark.square")
            cell.bookmarkButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            cell.imageView?.image = UIImage(systemName: "checkmark.square")
            cell.bookmarkButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        }

//        cell.shoppingListLabel.text = SetOptions.allCases[indexPath.section].todo[indexPath.row]
//        cell.imageView?.image = UIImage(systemName: SetOptions.allCases.[indexPath.section].imageViewimage[indexPath.row])
        
        cell.shoppingListLabel.text = todoList[indexPath.row]
        cell.bookmarkButton.tintColor = .black
        cell.imageView?.tintColor = .black
        cell.backgroundColor = .systemGray6
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func viewSetting(addBtnBackColor: UIColor, userTextFieldBackColor: UIColor) {
        addButton.backgroundColor = addBtnBackColor
        addButton.setTitleColor(.black, for: .normal)
        userTextField.backgroundColor = userTextFieldBackColor
        userTextField.placeholder = "무엇을 구매하실 건가요?"
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            todoList.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    @IBAction func addButtonReturn(_ sender: UIButton) {
        todoList.append(userTextField.text!)
        tableView.reloadData()
        print(todoList)
    }
}
