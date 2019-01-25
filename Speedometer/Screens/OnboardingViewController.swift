import UIKit

class OnboardingViewController: UIViewController {
    private var headlineSeparatorView: UIView!
    private var informationView: UIView!
    private var buttonSeparatorView: UIView!
    private var authorizationButtonView: UIView!

    init() {
        super.init(nibName: nil, bundle: nil)

        view.backgroundColor = .white
        setupPrimarySeparatorView()
        setupInformationView()
        setupSecondarySeparatorView()
        setupAuthorizationButton()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension OnboardingViewController {
    func setupPrimarySeparatorView() {
        let separatorViewController = SeparatorViewController()
        addChild(separatorViewController)

        headlineSeparatorView = separatorViewController.view!
        view.addSubview(headlineSeparatorView)

        headlineSeparatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headlineSeparatorView.heightAnchor.constraint(equalToConstant: 10.0),
            headlineSeparatorView.widthAnchor.constraint(equalToConstant: 180.0),
            headlineSeparatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -40.0),
            headlineSeparatorView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40.0)
            ])
    }

    func setupInformationView() {
        let informationViewController = InformationViewController(informationType: .onboardingInformation)
        addChild(informationViewController)

        informationView = informationViewController.view!
        view.addSubview(informationView)

        informationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            informationView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40.0),
            informationView.topAnchor.constraint(equalTo: headlineSeparatorView.bottomAnchor, constant: 40.0),
            informationView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40.0),
            ])
        informationViewController.didMove(toParent: self)
    }

    func setupSecondarySeparatorView() {
        let separatorViewController = SeparatorViewController()
        addChild(separatorViewController)

        buttonSeparatorView = separatorViewController.view!
        view.addSubview(buttonSeparatorView)

        buttonSeparatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonSeparatorView.heightAnchor.constraint(equalToConstant: 5.0),
            buttonSeparatorView.widthAnchor.constraint(equalToConstant: 90.0),
            buttonSeparatorView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            buttonSeparatorView.topAnchor.constraint(equalTo: informationView.bottomAnchor, constant: 40.0)
            ])
    }

    func setupAuthorizationButton() {
        let authorizationButtonViewController = AuthorizationButtonViewController()
        addChild(authorizationButtonViewController)

        authorizationButtonView = authorizationButtonViewController.view!
        view.addSubview(authorizationButtonView)

        authorizationButtonView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            authorizationButtonView.topAnchor.constraint(equalTo: buttonSeparatorView.bottomAnchor, constant: 40.0),
            authorizationButtonView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            ])
    }
}