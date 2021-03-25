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
    @IBOutlet weak var guideLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = dateData
        backButton.addTarget(self, action: #selector(onBackBtnClicked(_:)), for: .touchUpInside)
        completeButton.addTarget(self, action: #selector(onCompletedBtnClicked(_:)), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Second: viewDidAppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("Second: viewDidDisappear")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Second: viewWillAppear")
        if(view2StatusCheck == 2){
            self.dismiss(animated: false)
        }
        else{
            if(view2StatusCheck == 0){guideLabel.text = "일기 작성중!"}
            else if(view2StatusCheck == 1){guideLabel.text = "빈칸으로 왜 넘어갔나요?"}
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("Second: viewWillDisappear")
        
        if(view2StatusCheck == 2){
            view1StatusCheck = 2
            return
        }
        
        if(titleTextField.text == "" || contentTextView.text == ""){
            view2StatusCheck = 1
        }
        else{
            view2StatusCheck = 0
        }
 
        view1StatusCheck = 1
    }

    
    // willappear과 willDisappear 기능에 맞게 설정을 할 수 있음
    // SceneDelegate 기능도 검토
    // 백그라운드로 갔을 때 화면이 흐려지게 되는 기능, 돌아왔을 때 복구
    
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
