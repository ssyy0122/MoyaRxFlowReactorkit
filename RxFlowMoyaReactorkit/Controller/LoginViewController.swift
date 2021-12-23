//
//  LoginViewController.swift
//  RxFlowMoyaReactorkit
//
//  Created by 진시윤 on 2021/12/22.
//

import UIKit
import RxFlow
import RxRelay
import Moya
import RxSwift

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
            .subscribe(onNext: { [weak self] in
                self?.setupAPI()
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
    override func setupAPI() {
        let provider = MoyaProvider<Login>()
        provider.request(.Logins("zs32112321321z", "@12312312@", "zz12321ord")) {  result in
            
          switch result {
          case .success(let response):
            do {
              
                switch response.statusCode{
                case 200:
                    print("SUCCESS")
                    print(try response.mapJSON())
                case 400:
                    print("FAILURE")
                default:
                    print("w?")
                }
            } catch {
            }
          case .failure(let err):
              print(err)
          }
        }
    }
    
    @objc
        func loginButtonDidTap() {
            self.steps.accept(Steps.HomeIsRequired)
        }

    
}

