//
//  LoginFlow.swift
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

class LoginFlow: Flow {
    var root: Presentable{
        return self.rootViewController
    }
    
    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()
    
    init() {
        
    }
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? Steps else {return.none}
        switch step {
        case .loginIsRequired:
            return self.navigateToLogin()
        case .HomeIsRequired:
            return .end(forwardToParentFlowWithStep: Steps.HomeIsRequired)
        }
    }
    private func navigateToLogin() -> FlowContributors {
        let viewController = LoginViewController()
        self.rootViewController.setViewControllers([viewController], animated: false)
        return .one(flowContributor: .contribute(withNext: viewController))

    }
}
