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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.delegate = self
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

