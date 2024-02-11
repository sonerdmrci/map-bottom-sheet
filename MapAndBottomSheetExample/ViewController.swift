//
//  ViewController.swift
//  MapAndBottomSheetExample
//
//  Created by Soner Demirci on 3.01.2024.
//

import UIKit
import MapKit

class ViewController: UIViewController {

     let mapView = MKMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemPink
        
        configureMap()
        configureSheet()
    }
    
    private func configureMap(){
        view.addSubview(mapView)
        mapView.overrideUserInterfaceStyle = .dark //daha koyu bir harita yapti
        mapView.frame = view.bounds
    }
    
    private func configureSheet(){
        let vc = BottomSheetViewController()
        let navCon = UINavigationController(rootViewController: vc)
        
        navCon.isModalInPresentation = true
        if let sheet = navCon.sheetPresentationController {
            sheet.preferredCornerRadius = 40
            sheet.detents = [.custom(resolver: { context in
                0.1 * context.maximumDetentValue
            }), .medium()]
            sheet.largestUndimmedDetentIdentifier = .medium
        }
        navigationController?.present(navCon, animated: true)
    }


}

