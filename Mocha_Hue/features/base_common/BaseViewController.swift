//
//  BaseViewController.swift
//  Mocha_Hue
//
//  Created by ChinhPV on 3/23/20.
//  Copyright © 2020 ChinhPV. All rights reserved.
//

import RxSwift
import UIKit
import SafariServices
import Reachability

class BaseViewController: UIViewController, ErrorDecorator {

    var disposeBag = DisposeBag()
    var navigator: Navigator?
    var onDisappearDisposables = [Disposable]()
    var isShowing = false
    var isShowLoading = false
    var progressHUB: MBProgressHUD?

    static let notificationName = "com.apple.system.config.network_change"
    let closeActivityVC = PublishSubject<Void>()

    @IBOutlet weak private var constraintTopScrollView: NSLayoutConstraint!

    private var startTime: TimeInterval = 0

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        isShowing = true
        let className = "\(type(of: self))"
        NSLog("VIEW : \(self.title ?? self.navigationController?.title ?? className)")
        startTime = Date().timeIntervalSince1970
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        isShowing = false
    }


    func showError(message: String, completed: (() -> Void)?) {
        if isShowLoading {
            progressHUB?.hide(animated: true)
            if !message.isEmpty {
                alert(title: nil, message: message, completed: completed)
            }
        } else {
            if !message.isEmpty {
                alert(title: nil, message: message, completed: completed)
            }
        }
    }

    func showMessage(message: String) {
        if isShowLoading {
            progressHUB?.hide(animated: true)
            alert(title: nil, message: message, completed: nil)
        } else {
            alert(title: nil, message: message, completed: nil)
        }
    }

    func showConfirm(message: String, leftAction: AlertAction, rightAction: AlertAction) {
        let alert = UIAlertController(title: "Message",
                                      message: message, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: leftAction.title,
                                          style: .default, handler: { _ in leftAction.handler() }))

        alert.addAction(UIAlertAction(title: rightAction.title,
                                      style: .default, handler: { _ in rightAction.handler() }))

        self.present(alert, animated: true, completion: nil)
    }

    func showLoading(status: String, showInView: UIView?) {
        isShowLoading = true
        var viewContent: UIView = self.view

        if let view = showInView {
            viewContent = view
        }

        if status.isEmpty {
            let hub = MBProgressHUD.showAdded(to: viewContent, animated: true) as MBProgressHUD
            hub.mode = MBProgressHUDMode.indeterminate
            progressHUB = hub
        } else {
            let hub = MBProgressHUD.showAdded(to: viewContent, animated: true) as MBProgressHUD
            hub.mode = MBProgressHUDMode.text
            hub.label.text = status
            progressHUB = hub
        }
    }

    func hideLoading(showInView: UIView?) {
        isShowLoading = false
        var viewContent: UIView = self.view

        if let view = showInView {
            viewContent = view
        }

        MBProgressHUD.hide(for: viewContent, animated: true)
    }

    func alert(title: String?, message: String, action: AlertAction) {
        let alert = UIAlertController(title: title ?? "Message",
                                      message: message, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: action.title,
                                      style: .default, handler: { _ in action.handler() }))

        self.present(alert, animated: true, completion: nil)
    }

    func alert(title: String?, message: String, actions: [AlertAction]) {
        let alert = UIAlertController(title: title ?? "Message",
                                      message: message, preferredStyle: .alert)

        for action in actions {
            alert.addAction(UIAlertAction(title: action.title,
                                          style: .default, handler: { _ in action.handler() }))
        }

        self.present(alert, animated: true, completion: nil)
    }

    func alert(title: String?, message: String, completed: (() -> Void)?) {
        let okAction = AlertAction(title: "OK",
                                   handler: { completed?() })

        alert(title: title, message: message, action: okAction)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        Common.setStatusBarColor(Colors.dark.color())
        if #available(iOS 11.0, *) { } else {
            if let constraint = constraintTopScrollView {
                constraint.constant += Constants.DeviceMetric.statusBarHeight
            }
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let duration = Date().timeIntervalSince1970 - startTime
        NSLog("DID APPEAR in : \(String(format: "%.3f", duration)) seconds")

        subscribeOnAppear()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        disposeOnDisappear()
    }

    func subscribeOnAppear() {

    }

    private func disposeOnDisappear() {
        onDisappearDisposables.forEach { disposable in
            disposable.dispose()
        }
    }

    func insertToClearOnDisappear(disposable: Disposable) {
        onDisappearDisposables.append(disposable)
        disposeBag.insert(disposable)
    }

    func showHideNavigationBar(shouldHide: Bool, animated: Bool = true) {
        if Constants.Singleton.isiPad { return }
        self.navigationController?.setNavigationBarHidden(shouldHide, animated: animated)
    }

    // Use in Login VC, Sign up VC, Forgot password VC
    func setErrorTextAndErrorStatus(errorLabel: UILabel, textField: UITextField, text: String) {
        errorLabel.text = text
        let color = text.isEmpty ? Colors.unselectedTabbarItem.color().cgColor
            : Colors.defaultAccentColor.color().cgColor
        textField.layer.borderColor = color
    }

    // TO BE REMOVED
    func createDummyCellWith(title: String) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = Colors.defaultBg.color(alpha: 0.5)
        cell.textLabel?.text = title
        return cell
    }

    func addBackButton() {
        let backButton = UIBarButtonItem(image: UIImage(named: "ic_arrow_back"), style: .plain, target: self,
                                         action: #selector(self.backButtonPressed))
         navigationItem.leftBarButtonItem = backButton
    }

    @objc
    func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }

    // MARK: Close button

    func addCloseButton() {
        let backButton = UIBarButtonItem(image: UIImage(named: "ic_close"), style: .plain, target: self,
                                         action: #selector(self.closeButtonPressed))
        navigationItem.leftBarButtonItem = backButton
    }

    func addLargeCloseButton() {
        let backButton = UIBarButtonItem(image: UIImage(named: "ic_close_large"), style: .plain, target: self,
                                         action: #selector(self.closeButtonPressed))
        navigationItem.leftBarButtonItem = backButton
    }

    @objc
    func closeButtonPressed() {
        navigationController?.dismiss(animated: true, completion: nil)
    }

    // MARK: Open In App Browser

    func openInAppBrowser(url: URL) {
        let safariVC = SFSafariViewController(url: url)
        safariVC.delegate = self
        present(safariVC, animated: true, completion: nil)
        Common.setStatusBarColor(Colors.lightGrayStatusbar.color())
    }

    // MARK: Other methods

	func listenToggleScroll(toggleSubject: BehaviorSubject<(Bool, Bool)>) {
	}

    @objc
    func onNetworkChange(name: String) {
        if name == BaseViewController.notificationName {
            // Do your stuff
            print("Network was changed")
            if let reach = try? Reachability() {
                if reach.connection == .unavailable {
                    NSLog("no connecttion")
                } else if reach.connection == .wifi {
                    NSLog("wifi")
                } else {
                    NSLog("cellular")
                }
            }
        }
    }
}

extension BaseViewController: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        Common.setStatusBarColor(Colors.dark.color())
    }
}

