//
//  ViewController.swift
//  Home3LifeCycle
//
//  Created by 김민백 on 2021/03/22.
//

import FSCalendar
import UIKit


class ViewController: UIViewController, FSCalendarDelegate {
    
    @IBOutlet var calendar: FSCalendar!
    @IBOutlet weak var guideLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.delegate = self
        view1StatusCheck = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("first: viewDidAppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("first: viewDidDisappear")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("first: viewWillAppear")
        
        if(view1StatusCheck == 0){guideLabel.text = "처음 방문하셨군요"}
        else if(view1StatusCheck == 1){guideLabel.text = "끝까지 작성해주세요"}
        else if(view1StatusCheck == 2){guideLabel.text = "일기를 더 작성!"}
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("first: viewWillDisappear")
        view2StatusCheck = 0
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        // 한국 시간으로 표시
        formatter.locale = Locale(identifier: "ko_kr")
        formatter.timeZone = TimeZone(abbreviation: "kst")
        // 날짜의 형태를 변환
        formatter.dateFormat = "YYYY년 MM월 dd일 EEEE"
        // String을 date 타입으로 변경
        let output = formatter.string(from: date)
        print("\(output)")
        
        let vc = self.storyboard?.instantiateViewController(identifier: "SecondViewController") as! SecondViewController
        
        vc.dateData = output
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}

