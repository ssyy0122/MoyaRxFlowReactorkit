//
//  HomeViewController.swift
//  RxFlowMoyaReactorkit
//
//  Created by 진시윤 on 2021/12/22.
//

import UIKit
import Moya
import RxFlow
import RxSwift
import RxCocoa
import RxRelay
import SnapKit
import Then

    
import UIKit

class HomeViewController: baseVC ,Stepper {
    
    
    var steps = PublishRelay<Step>()

    // MARK:- UI
    let button2 = UIButton().then {
        $0.setTitle("뷰2로 가기", for: .normal)
        $0.setTitleColor( .darkGray, for: .normal)
        $0.backgroundColor = .blue
        $0.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
    let label2 = UILabel().then {
        $0.text = "ㅎㅇ"
        $0.textColor = .brown
    }
    
    
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func setupBinding() {
        button2.rx.tap
            .subscribe(onNext: {
                print("버튼을 누름.")
            })
            .disposed(by: disposBag)
    }
    
    override func setupLayout() {
        view.addSubview(button2)
        view.addSubview(label2)
    }
    override func setupConstraints() {
        label2.snp.makeConstraints {
            $0.centerY.equalToSuperview()
        }
        button2.snp.makeConstraints {
            $0.top.equalTo(label2.snp.bottom).offset(10)
        }
    }
    @objc
        func loginButtonDidTap() {
            self.steps.accept(Steps.loginIsRequired)
        }
    
}



