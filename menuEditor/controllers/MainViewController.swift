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
    
    var myLocation = CLLocationCoordinate2D()
    var gpsManager = CLLocationManager()
    var isAlreadyMarked = false
    var selectedPlaceName : String = ""
    var selectedPlaceCoordinates = CLLocation()
    var selectedPlaceAddress : String = ""
    var resultsViewController: GMSAutocompleteResultsViewController?
    var searchController: UISearchController?
    
    
    // MARK: - Outlets
    @IBOutlet weak var addressTextField: UITextField!
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
        
        self.companyLocationGMSMapView.isMyLocationEnabled = true
        
        // PEGAR A LOCALIZACAO ATUAL
        //self.gpsManager.startUpdatingLocation()
        
        /* self.companyLocationGMSMapView.camera = GMSCameraPosition.camera(withLatitude: 0, longitude:0 , zoom: 16.0)
         let marker = GMSMarker()
         
         marker.position = CLLocationCoordinate2D(latitude: self.festaConvidado.local.coordenadas.coordinate.latitude, longitude: self.festaConvidado.local.coordenadas.coordinate.longitude)
         marker.map = self.companyLocationGMSMapView*/
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLayoutSubviews()
        
        
        
        
        
        
        // Hide keyboard when tap in background
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tap(_:)))
        tap.delegate = self
        myScrollView.addGestureRecognizer(tap)
        
        //Keyboard notifications
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShown(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHiden(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        //delegates
        
        self.addressTextField.delegate = self
        self.gpsManager.delegate = self
        self.companyNameUITextField.delegate = self
        
        //self.defineCompanyTextView?.delegate = self
        
        self.myScrollView.delegate = self
        
        self.companyDescriptionUITextView.delegate = self
        
        
        
        //SegmentControl
        self.mainSegmentedControl.addTarget(self, action: #selector(self.segmentControlClick(_:)) , for: .valueChanged)
        
        
        
        // GOOGLEMAPS
        
        
        
        self.companyLocationGMSMapView.isMyLocationEnabled = true
        
        
        
        // PEGAR A LOCALIZACAO ATUAL
        // self.gpsManager.startUpdatingLocation()
        
        
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // MARK: - Methods
    
    @objc func segmentControlClick(_ sender: UISegmentedControl) {
        
        
        switch sender.selectedSegmentIndex {
        case 0:
            
            
            break
        case 1:
            
            performSegue(withIdentifier: "goToMenuSegue", sender: self)
            break
        default:
            
            
            
            break
        }
        
    }
    
    
    @objc func keyboardShown(notification: NSNotification ) {
        
        //print ("Keyboard Shown")
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            //NSLayoutConstraint.deactivate([myKeyboardConstraint])
            
            // myKeyboardConstraint2.constant = 0 - keyboardSize.height
            //NSLayoutConstraint.activate([myKeyboardConstraint2])
        }
        
    }
    
    
    @objc func keyboardHiden(notification: NSNotification) {
        
        //print("Keyboard Hiden")
        
        //NSLayoutConstraint.deactivate([self.myKeyboardConstraint2])
        //NSLayoutConstraint.activate([self.myKeyboardConstraint])
        
        
        
        
        
    }
    
    
    @objc func tap(_ gestureRecognizer: UITapGestureRecognizer) {
        
        
        view.endEditing(true)
        
        
    }
    
    // MARK: - Actions
    
    
    // MARK: - Text Delegate
    
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if (textField == self.addressTextField) {
            
            let autocompleteController = GMSAutocompleteViewController()
            self.gpsManager.stopUpdatingLocation()
            autocompleteController.delegate = self
            present(autocompleteController, animated: true, completion: nil)
            return false
        } else {
            return true
        }
        
    }
    
    // MARK: - GSMAutoCompleteViewControllerDelegate
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        
        self.selectedPlaceName = place.name
        self.selectedPlaceCoordinates = CLLocation.init(latitude: place.coordinate.latitude, longitude: place.coordinate.longitude)
        if let address =  place.formattedAddress  {
            self.selectedPlaceAddress = address
        } else {
            self.selectedPlaceAddress = ""
        }
        
        self.addressTextField.text = place.name
        
        self.companyLocationGMSMapView.camera = GMSCameraPosition.camera(withLatitude: place.coordinate.latitude, longitude: place.coordinate.longitude, zoom: 16.0)
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: place.coordinate.latitude, longitude: place.coordinate.longitude)
        marker.map = self.companyLocationGMSMapView
        
        
        dismiss(animated: true, completion: nil)
        
        
    }
    
    
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        
        print("wasCancelled")
    }
    
    /// GooglePlaces Delegates
    
    // Handle the user's selection.
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        
        print("fail")
        
    }
    
    // CLLLocation Manager delegate
    
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        self.gpsManager.stopUpdatingLocation()
        
        let location = locations.last
        
        self.myLocation = location!.coordinate
        
        
        self.companyLocationGMSMapView.camera = GMSCameraPosition.camera(withLatitude: self.myLocation.latitude, longitude: self.myLocation.longitude, zoom: 17.0)
        if !self.isAlreadyMarked {
            self.isAlreadyMarked = true
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: self.myLocation.latitude, longitude: self.myLocation.longitude)
            marker.map = self.companyLocationGMSMapView
            
        }
        
        
        
    }
    
}
