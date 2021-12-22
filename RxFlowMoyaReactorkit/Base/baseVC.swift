//
//  baseVC.swift
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

class baseVC: UIViewController {
    // MARK: RxSwift
    var disposBag = DisposeBag()
    
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        self.view.backgroundColor = .green
    }
    func setupLayout() {
        
    }
    func setupData() {
        
    }
    func setupConstraints() {
        
    }
    func setupBinding() {
        
    }
}
