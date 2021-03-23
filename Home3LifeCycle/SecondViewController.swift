//
//  SecondViewController.swift
//  Home3LifeCycle
//
//  Created by 김민백 on 2021/03/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    var dateData : String = ""
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var resultLabel : UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = dateData
        backButton.addTarget(self, action: #selector(onBackBtnClicked(_:)), for: .touchUpInside)
        completeButton.addTarget(self, action: #selector(onCompletedBtnClicked(_:)), for: .touchUpInside)
        
    }
    
    @objc fileprivate func onBackBtnClicked(_ sender: UIButton){
        self.dismiss(animated: true)
    }
    
    @objc fileprivate func onCompletedBtnClicked(_ sender: UIButton){
        
        let vc = self.storyboard?.instantiateViewController(identifier: "ThirdViewController") as! ThirdViewController
        
        vc.modalPresentationStyle = .fullScreen
        vc.dateData = resultLabel.text!
        vc.titleData = titleTextField.text!
        vc.contentData = contentTextView.text!
        
        self.present(vc, animated: true, completion: nil)
    }
    

}
