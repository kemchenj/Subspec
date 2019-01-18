//
//  ViewController.swift
//  Subspec
//
//  Created by kemchenj on 2019/1/18.
//  Copyright © 2019 kemchenj. All rights reserved.
//

import UIKit
import RxSwift
import Moya

enum GitHub: TargetType {
    case homePage

    var baseURL: URL { return URL(string: "github.com")! }
    var path: String { return "" }
    var method: Moya.Method { return .get }
    var sampleData: Data { return Data() }
    var task: Task { return Task.requestPlain }
    var headers: [String : String]? { return nil }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let disposeBag = DisposeBag()

        let provider = MoyaProvider<GitHub>()

        provider.rx
            .request(.homePage)
            .disposed(by: disposeBag)
    }
}

