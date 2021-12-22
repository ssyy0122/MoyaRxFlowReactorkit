//
//  LoginStepper.swift
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

class LoginStepper: Stepper {
    let steps = PublishRelay<Step>()
       private let disposeBag = DisposeBag()

       init() {
       }

       var initialStep: Step {
           return Steps.loginIsRequired
       }
   }

class HomeStepper: Stepper {

    let steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()

    init() {
    }

    var initialStep: Step {
        return Steps.HomeIsRequired
    }
}
