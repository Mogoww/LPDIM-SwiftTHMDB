//
//  MovieCategorieView.swift
//  FirstApp
//
//  Created by Mauche Gauthier on 10/05/2022.
//

import SwiftUI

//struct MovieCategorieView: View {
//    
//    @State private var willMoveToNextScreen = false
//    var body: some View {
//        
////        Button("Sign In", action: {
////            NavigationView(content: {
////                       ViewControllerWrapper(controller: MovieViewController.init())
////                   })
////                   .navigationTitle("View")
////        })
//
//   
//        
//
//
//    }
//}
//
//struct MovieCategorieView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieCategorieView()
//    }
//}


struct MovieCategorieView: View {
    var body: some View {
//        NavigationView(content: {
//            ViewControllerWrapper(controller: MyViewController.init())
//        })
//        .navigationTitle("View")
//        .navigationBarTitle("Text")
        
        Button("Sign In", action: {

               })
    }
}


struct ContentView1_Previews: PreviewProvider {
    static var previews: some View {
        MovieCategorieView()
    }
}

class MyViewController: UIViewController{
    lazy var goToAnotherViewButton: UIButton = {
        let button = UIButton(type: .custom)
        button.layer.cornerRadius = 5
        button.backgroundColor = .systemYellow
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        button.setTitle("Go", for: .normal)
        button.addTarget(self, action: #selector(goToAnotherView), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let stackView = UIStackView(arrangedSubviews: [goToAnotherViewButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalToSystemSpacingAfter: view.leftAnchor, multiplier: 2),
            view.rightAnchor.constraint(equalToSystemSpacingAfter: stackView.rightAnchor, multiplier: 2),
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 2),
        ])
    }
    
    @objc
    func goToAnotherView() {
        //from this function I want to go to Another View
        let vc = UINavigationController(rootViewController: MovieViewController())
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

struct ViewControllerWrapper: UIViewControllerRepresentable{
    func makeUIViewController(context: UIViewControllerRepresentableContext<ViewControllerWrapper>) -> UIViewController {
        guard let controller=controller else {
            return UIViewController()
        }
        return controller
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<ViewControllerWrapper>) {
    }
    let controller:UIViewController?
    typealias UIViewControllerType = UIViewController
}
