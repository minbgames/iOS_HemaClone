//
//  ProtectionViewController.swift
//  Home3LifeCycle
//
//  Created by 김민백 on 2021/03/25.
//

import UIKit

class ProtectionViewController: UITableViewController {

    init() {
        super.init(style: .grouped)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        // In my opinion, it looks a bit better to position the label centred in the top two thirds of the screen rather than in the middle
        let labelHeight = view.bounds.height * 0.66
        (privacyLabel.frame, _) = view.bounds.divided(atDistance: labelHeight, from: .minYEdge)
    }

    private lazy var privacyLabel: UILabel = {
        let label = UILabel() // UILabel 클래스를 상속받음

        label.font = UIFont.preferredFont(forTextStyle: .title1) // Font 사이즈를 결정하는 코드
        
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true

        label.textAlignment = .center
        label.textColor = .gray

        label.numberOfLines = 0
        label.text = "Content hidden\nto protect\nyour privacy"

        self.view.addSubview(label)

        return label
    }()
}
