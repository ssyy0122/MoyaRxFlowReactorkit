//
//  Steps.swift
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

enum Steps: Step {
    case loginIsRequired
    case HomeIsRequired
}

