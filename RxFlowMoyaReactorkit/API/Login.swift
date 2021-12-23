//
//  CoronaAPI.swift
//  RxFlowMoyaReactorkit
//
//  Created by 진시윤 on 2021/12/23.
//

import Foundation
import Moya

enum Login {
    case Logins(_ fullName: String, _ email: String, _ password: String)
}


extension Login: TargetType {
    var baseURL: URL {
        return URL(string: "http://10.53.68.75:3306")!
    }
    
    var path: String {
            switch self {
            case.Logins(_, _, _):
                return "/api/v1/register"
            }
    }
    
    var method: Moya.Method {
            switch self {
            case .Logins(_, _, _):
                return .post
            }
    }
    var smapledata: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .Logins(let fullname, let email, let password):
            let prams: [String:Any] = [
                "fullname":fullname,
                "email":email,
                "password":password
            ]
            return .requestParameters(parameters: prams, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
}
    
  
