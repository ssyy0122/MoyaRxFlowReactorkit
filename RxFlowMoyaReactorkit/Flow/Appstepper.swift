//
//  Appstepper.swift
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

class Appstepper: Stepper {
    let steps = PublishRelay<Step>()
    
    let disposgBag: DisposeBag = .init()
    init(){
        var initialStep: Step {
            return Steps.loginIsRequired
        }
    }
    
    func readyToEmitSteps() {
        Observable.just(Steps.loginIsRequired)
            .bind(to: steps)
            .disposed(by: disposgBag)
    }
}
