//
//  AppFlow.swift
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

class AppFlow: Flow {
    
    var window: UIWindow
    
    var root: Presentable{
        return self.window
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? Steps else { return .none }
                switch step {
                case .loginIsRequired:
                    return self.navigateToLogin()
                case .HomeIsRequired:
                    return self.navigateToHome()
                }
    }
    
    init(window: UIWindow) {
           self.window = window
       }
    private func navigateToLogin() -> FlowContributors {
        let loginflow = LoginFlow()
        Flows.use(loginflow, when: .created) {[unowned self] root in
            self.window.rootViewController = root
        }
        return .one(flowContributor: .contribute(withNextPresentable: loginflow, withNextStepper: OneStepper(withSingleStep: Steps.loginIsRequired)))

    }
    private func navigateToHome() -> FlowContributors {
        let homeflow = HomeFlow()
        Flows.use(homeflow, when: .created) {[unowned self] root in
            self.window.rootViewController = root
        }
        return .one(flowContributor: .contribute(withNextPresentable: homeflow, withNextStepper: OneStepper(withSingleStep: Steps.HomeIsRequired)))
    }
}
