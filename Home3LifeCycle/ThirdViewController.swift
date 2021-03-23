//
//  ThirdViewController.swift
//  Home3LifeCycle
//
//  Created by 김민백 on 2021/03/23.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    var dateData : String = ""
    var titleData : String = ""
    var contentData : String = ""


    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel.text = dateData
        titleLabel.text = titleData
        contentLabel.text = contentData
        
        backButton.addTarget(self, action: #selector(onBackBtnClicked(_:)), for: .touchUpInside)
        
    }
    
    @objc fileprivate func onBackBtnClicked(_ sender: UIButton){
        self.dismiss(animated: true)
    }
}
