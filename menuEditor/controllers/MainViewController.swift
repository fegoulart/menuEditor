//
//  MainViewController.swift
//  menuEditor
//
//  Created by Fernando Goulart on 24/06/2018.
//  Copyright © 2018 Leapi. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces


class MainViewController: UIViewController,   CLLocationManagerDelegate,  GMSAutocompleteViewControllerDelegate, UITextFieldDelegate, UIImagePickerControllerDelegate,UIGestureRecognizerDelegate,UITextViewDelegate, UIScrollViewDelegate {
    
    
    
    

    // MARK: - Proprieties
    
    
    // MARK: - Outlets
    @IBOutlet weak var myScrollView: UIScrollView!
    
    @IBOutlet weak var mainSegmentedControl: UISegmentedControl!
    @IBOutlet weak var companyNameUITextField: UITextField!
    @IBOutlet weak var companyUIImageView: UIImageView!
    @IBOutlet weak var companyDescriptionUITextView: UITextView!
    @IBOutlet weak var companyLocationGMSMapView: GMSMapView!
    
    @IBOutlet weak var saveButton: UIButton!
    // MARK: - ViewLifeCycle
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Map
        
        self.companyLocationGMSMapView.camera = GMSCameraPosition.camera(withLatitude: self.festaConvidado.local.coordenadas.coordinate.latitude, longitude: self.festaConvidado.local.coordenadas.coordinate.longitude, zoom: 16.0)
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: self.festaConvidado.local.coordenadas.coordinate.latitude, longitude: self.festaConvidado.local.coordenadas.coordinate.longitude)
        marker.map = self.companyLocationGMSMapView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         super.viewDidLayoutSubviews()
        self.automaticallyAdjustsScrollViewInsets = false
        
        // Hide keyboard when tap in background
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tap(_:)))
        tap.delegate = self
        myScrollView.addGestureRecognizer(tap)
        
        //Keyboard notifications
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShown(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHiden(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)

        //delegates
        
        self.companyNameUITextField.delegate = self
        
        //self.defineCompanyTextView?.delegate = self
        
        self.myScrollView.delegate = self
        
        self.companyDescriptionUITextView.delegate = self
        
        //self.firmNameTextField?.delegate = self
        
        ///self.comercialContactTextField?.delegate = self
        
//        self.fullPhoneTextField?.delegate = self
//
//        self.emailTextField?.delegate = self
//
//        self.serviceTextField?.delegate = self
//
//        self.cityTextField?.delegate = self
//
//        self.regionTextField?.delegate = self
//
//        self.fullPriceTextField?.delegate = self
//
//        self.definePasswordTextField?.delegate = self
//
//        self.repeatPasswordTextField?.delegate = self
//
        
        //SegmentControl
//        self.mainSegmentedControl.addTarget(self, action: #selector(self.segmentControlClick(_:)) , for: .valueChanged)
//
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    // MARK: - Methods
    
    @objc func segmentControlClick(_ sender: UISegmentedControl) {
        
        
        switch sender.selectedSegmentIndex {
        case 0:
            
//            let myTabBarController = self.tabBarController as! myTabBarController
//            myTabBarController.forcaOrganizador = true
//            myTabBarController.forcaConvidado = false
//            _ = navigationController?.popViewController(animated: false)
//
            break
        case 1:
            print("Convidado")
            
            break
        default:
            
            
            
            break
        }
        
    }
    
    
    @objc func keyboardShown(notification: NSNotification ) {
        
        //print ("Keyboard Shown")
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            NSLayoutConstraint.deactivate([myKeyboardConstraint])
            
            myKeyboardConstraint2.constant = 0 - keyboardSize.height
            NSLayoutConstraint.activate([myKeyboardConstraint2])
        }
        
    }
    @objc func keyboardHiden(notification: NSNotification) {
        
        //print("Keyboard Hiden")
        
        NSLayoutConstraint.deactivate([self.myKeyboardConstraint2])
        NSLayoutConstraint.activate([self.myKeyboardConstraint])
        
        
        
        
        
    }
    
    
    @objc func tap(_ gestureRecognizer: UITapGestureRecognizer) {
        
        
        view.endEditing(true)
        
        
    }
    
    // MARK: - Actions

    
    // MARK: - GSMAutoCompleteViewControllerDelegate
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        
    }

}
