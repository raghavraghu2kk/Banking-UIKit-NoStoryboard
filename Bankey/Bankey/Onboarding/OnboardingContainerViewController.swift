//
//  OnboardingContainerViewController.swift
//  Bankey
//
//  Created by Raghavendra Mirajkar on 03/08/24.
//

import UIKit

protocol OnboardingContainerViewControllerDelegate : AnyObject {
    func didFinishOnboarding()
}

class OnboardingContainerViewController: UIViewController {

    var pageViewController: UIPageViewController
    
    var pages = [UIViewController]()
    
    var currentVC : UIViewController {
        didSet {
            guard let index = pages.firstIndex(of: currentVC) else { return }
            print(index)
            nextButton.isHidden = index == pages.count - 1 //Hide if its the last pages
            backButton.isHidden = index == 0 // Hide if its on the last page
            doneButton.isHidden = !(index == pages.count - 1) // Show if its on last page
        }
    }
    
    var closeButton = UIButton(type: .system)
    var doneButton = UIButton(type: .system)
    var nextButton = UIButton(type: .system)
    var backButton = UIButton(type: .system)
    
    weak var delegate : OnboardingContainerViewControllerDelegate?
    
    // MARK: - Init Method
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        let page1 = OnboardingViewController(heroImageName: "delorean", titleText: "Bankey is faster, easier to use, and has a brand new look and feel that will make you feel like you are back in the 80s.")
        let page2 = OnboardingViewController(heroImageName: "world", titleText: "Move your money around the world quickly and securely.")
        let page3 = OnboardingViewController(heroImageName: "thumbs", titleText: "Learn more at www.bankey.com.")
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        
        currentVC = pages.first!
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ViewDidLoad - Layout
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        style()
        layout()
    }
    
    private func setup() {
        view.backgroundColor = .systemPurple
        
        //Adding childViewController to the parentViewContoller - 3 steps
        // 1. addChild to parentviewcontroller
        addChild(pageViewController)
        // 2. takes child view and add it to the subview of parent view - parentview.addSubview(childVC.view)
        view.addSubview(pageViewController.view)
        // 3. All the UIViewcontroller lifecycles handled by the parent - childVC.didMove(toParent: self)
        pageViewController.didMove(toParent: self)
        
        pageViewController.dataSource = self
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: pageViewController.view.topAnchor),
            view.leadingAnchor.constraint(equalTo: pageViewController.view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: pageViewController.view.bottomAnchor)
        ])
        
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: true)
        currentVC = pages.first!
    }
    
    private func style() {
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setTitle("Close", for: [])
        closeButton.addTarget(self, action: #selector(closedTapped), for: .primaryActionTriggered)
        
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.setTitle("Done", for: [])
        doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .primaryActionTriggered)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setTitle("Back", for: [])
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .primaryActionTriggered)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("Next", for: [])
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .primaryActionTriggered)

        view.addSubview(closeButton)
        view.addSubview(doneButton)
        view.addSubview(backButton)
        view.addSubview(nextButton)
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            closeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            closeButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
            
            doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            doneButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
            
            backButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
        ])
    }
    
}

// MARK: - DataSource Methods - Pageview

extension OnboardingContainerViewController : UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return getPreviousViewController(from: viewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return getNextViewController(from: viewController)
    }
    
    private func getPreviousViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index - 1 >= 0 else { return nil }
        currentVC = pages[index - 1]
        return pages[index - 1]
    }
    
    private func getNextViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index + 1 < pages.count else { return nil }
        currentVC = pages[index + 1]
        return pages[index + 1]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return pages.firstIndex(of: self.currentVC) ?? 0
    }
}

    
// MARK: - Actions
extension OnboardingContainerViewController {
    @objc private func closedTapped() {
        print("Tapped")
        delegate?.didFinishOnboarding()
    }
    
    @objc private func doneButtonTapped() {
        print("Done Tapped")
        delegate?.didFinishOnboarding()
    }
    
    @objc private func backButtonTapped() {
        guard let previousVC = getPreviousViewController(from: currentVC) else { return }
        pageViewController.setViewControllers([previousVC], direction: .reverse, animated: true)
        print("Back Tapped")
    }
    
    @objc private func nextButtonTapped() {
        guard let nextVC = getNextViewController(from: currentVC) else { return }
        pageViewController.setViewControllers([nextVC], direction: .forward, animated: true)
        print("Next Tapped")
    }
}
