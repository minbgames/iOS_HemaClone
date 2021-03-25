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
    @IBOutlet weak var guideLabel: UILabel!
    
    var dateData : String = ""
    var titleData : String = ""
    var contentData : String = ""


    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel.text = dateData
        titleLabel?.text = titleData
        contentLabel.text = contentData
        
        backButton.addTarget(self, action: #selector(onBackBtnClicked(_:)), for: .touchUpInside)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Third: viewDidAppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("Third: viewDidDisappear")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Third: viewWillAppear")
        
        if(view2StatusCheck == 0){
            guideLabel.text = "작성 완료!"
            view3StatusCheck = 0
        }
        else if(view2StatusCheck == 1){
            guideLabel.text = "빈칸이 있습니다."
            view3StatusCheck = 1
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("Third: viewWillDisappear")
        if(view3StatusCheck == 0){
            view2StatusCheck = 2
        }
        if(view3StatusCheck == 1){
            view2StatusCheck = 1
        }
    }
    
    @objc fileprivate func onBackBtnClicked(_ sender: UIButton){
        self.dismiss(animated: false)
    }
}
