//
//  LoginViewController.swift
//  RxFlowMoyaReactorkit
//
//  Created by 진시윤 on 2021/12/22.
//

import UIKit

class LoginViewController: baseVC {
    
    
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
        label1.snp.makeConstraints {
            $0.centerY.equalToSuperview()
        }
        button1.snp.makeConstraints {
            $0.leading.equalTo(label1.snp.centerX).offset(30)
        }
    }
    @objc
        func loginButtonDidTap() {
            self.steps.accept(DemoStep.homeIsRequired)
        }
    
}

