//
//  LoginViewController.swift
//  RxFlowMoyaReactorkit
//
//  Created by 진시윤 on 2021/12/22.
//

import UIKit
import RxFlow
import RxRelay

class LoginViewController: baseVC ,Stepper {
    
    var steps = PublishRelay<Step>()

    
    // MARK:- UI
    let button1 = UIButton().then {
        $0.setTitle("뷰2로 가기", for: .normal)
        $0.setTitleColor( .darkGray, for: .normal)
        $0.backgroundColor = .blue
        $0.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
    let label1 = UILabel().then {
        $0.text = "ㅎㅇ"
        $0.textColor = .brown
    }
    
    
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func setupBinding() {
        button1.rx.tap
            .subscribe(onNext: {
                print("버튼을 누름.")
            })
            .disposed(by: disposBag)
    }
    
    override func setupLayout() {
        view.addSubview(button1)
        view.addSubview(label1)
    }
    override func setupConstraints() {
        
        button1.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        label1.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.bottom.equalTo(button1.snp.top).inset(30)
        }
    }
    @objc
        func loginButtonDidTap() {
            self.steps.accept(Steps.HomeIsRequired)
        }
    
}

