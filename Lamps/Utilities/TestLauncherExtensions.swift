//
//  File.swift
//  Lamps
//
//  Created by Jerome Chan on 14/6/23.
//

import UIKit

extension TestLauncherViewControllers {
    var storyboard: UIStoryboard {
        switch self {
        case .PassCode:
            return UIStoryboard(name: "PassCodeInput", bundle: nil)
        }
    }
}

extension TestLauncher {
    static func isTestModeOn() -> Bool {
        return ProcessInfo.processInfo.environment.keys.contains(TestLauncher.TestPhrase)
    }
    static func vcPhrase() -> String? {
        return ProcessInfo.processInfo.environment[TestLauncher.VCPhrase]
    }
    static func modelPhrase() -> String? {
        return ProcessInfo.processInfo.environment[TestLauncher.ModelPhrase]
    }
    static func storyboard() -> UIStoryboard? {
        if let sb = TestLauncherViewControllers(rawValue:  vcPhrase() ?? "") {
            return sb.storyboard
        } else {
            return nil
        }
    }
    static func viewController() -> UIViewController? {
        if
            let vcPhrase = TestLauncher.vcPhrase(),
            let modelPhrase = TestLauncher.modelPhrase(),
            let vcEnum = TestLauncherViewControllers(rawValue: vcPhrase),
            let modelEnum = TestLauncherModels(rawValue: modelPhrase),
            let vc = TestLauncher.storyboard()?.instantiateInitialViewController() {
            switch vcEnum {
            case .PassCode:
                if
                    let vc = vc as? PassCodeViewController {
                    switch modelEnum {
                    case .PassCode1:
                        vc.model = PassCodeModel(passCodeString: "yishuntoapayoh")
                        vc.mode = .createPassCode
                    case .PassCode2:
                        vc.model = PassCodeModel(passCodeString: "parislondon")
                        vc.mode = .validatePassCode
                    case .PassCode3:
                        vc.model = PassCodeModel(passCodeString: "marsvenus")
                        vc.mode = .editPassCode
                    }
                }
            }
            return vc
        } else {
            return nil
        }
    }
}
