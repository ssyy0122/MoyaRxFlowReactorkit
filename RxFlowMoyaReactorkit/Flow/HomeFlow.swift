//
//  HomeFlow.swift
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

class HomeFlow: Flow {
    var root: Presentable {
       return self.rootViewController
    }
    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()
    init() {}
    func navigate(to step: Step) -> FlowContributors {
            guard let step = step as? Steps else { return .none }
            switch step {
            case .HomeIsRequired:
                return self.navigateToHome()
            case .loginIsRequired:
                return .end(forwardToParentFlowWithStep: Steps.loginIsRequired)
            }
        }
        
        private func navigateToHome() -> FlowContributors {
            let viewController = HomeViewController()
            self.rootViewController.setViewControllers([viewController], animated: false)
            return .one(flowContributor: .contribute(withNext: viewController))
        }
}
