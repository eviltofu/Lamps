//
//  TestLauncher.swift
//  Lamps
//
//  Created by Jerome Chan on 14/6/23.
//

import Foundation
import UIKit

enum TestLauncherViewControllers: String {
    case PassCode = "PassCodeViewController"
}

enum TestLauncherModels: String {
    case PassCode1 = "PassCodeModel1"
    case PassCode2 = "PassCodeModel2"
    case PassCode3 = "PassCodeModel3"
}

enum TestLauncher {
    static let TestPhrase = "TestLauncher-testing"
    static let VCPhrase = "TestLauncher-VC"
    static let ModelPhrase = "TestLauncher-model"
}
