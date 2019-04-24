//
//  SchoolDetailsViewController.swift
//  NanoSchool
//
//  Created by Apple on 3/13/19.
//  Copyright © 2019 Walidghonem. All rights reserved.
//

import UIKit
import ImageSlideshow
import MapKit
import MOLH

class SchoolDetailsViewController: UIViewController {
    
    @IBOutlet weak var mapview: MKMapView!
    @IBOutlet weak var slideshow: ImageSlideshow!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var bottom: UIView!
    
    @IBOutlet weak var visionView: UIView!
    @IBOutlet weak var aboutView: UIView!
    @IBOutlet weak var feesView: UIView!
    
    
    @IBOutlet weak var feesText: UILabel!
    @IBOutlet weak var aboutText: UILabel!
    @IBOutlet weak var visionText: UILabel!
    
    
    let localSource = [ImageSource(imageString: "img1")!, ImageSource(imageString: "img2")!]
    
    let locationmanger = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(MOLHLanguage.isRTLLanguage())
        {
            feesText.font = UIFont.init(name: "DroidArabicKufi" , size: 13)
            aboutText.font = UIFont.init(name: "DroidArabicKufi" , size: 13)
            visionText.font = UIFont.init(name: "DroidArabicKufi" , size: 13)
            
            feesText.text = "المصاريف"
            aboutText.text = "عن المدرسة"
            visionText.text = "الرؤية"
        }
        
        slideshow.layer.cornerRadius = 15
        slideshow.backgroundColor = UIColor.white
        slideshow.slideshowInterval = 5.0
        let pageIndicator = UIPageControl()
        pageIndicator.currentPageIndicatorTintColor = UIColor.lightGray
        pageIndicator.pageIndicatorTintColor = UIColor.black
        slideshow.contentScaleMode = UIView.ContentMode.scaleAspectFill
        slideshow.pageIndicator = pageIndicator
        
        // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
        slideshow.activityIndicator = DefaultActivityIndicator()
        slideshow.currentPageChanged = { page in
            // print("current page:", page)
        }
        
        // can be used with other sample sources as `afNetworkingSource`, `alamofireSource` or `sdWebImageSource` or `kingfisherSource`
        slideshow.setImageInputs(localSource)
        
        //-------------------------------------------------
    
        locationmanger.delegate = self as? CLLocationManagerDelegate
        locationmanger.requestWhenInUseAuthorization()
        locationmanger.startUpdatingLocation()
        
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(31.006512, 29.814974)
        let region:MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        
        mapview.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "El-Eleem School"
        annotation.subtitle = "Location"
        
        mapview.addAnnotation(annotation)
    
       //-----------------------------------------------------
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(SchoolDetailsViewController.tappedMe))
        visionView.addGestureRecognizer(tap)
        visionView.isUserInteractionEnabled = true
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(SchoolDetailsViewController.tappedMe2))
        aboutView.addGestureRecognizer(tap2)
        aboutView.isUserInteractionEnabled = true
        
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(SchoolDetailsViewController.tappedMe3))
        feesView.addGestureRecognizer(tap3)
        feesView.isUserInteractionEnabled = true
    }
    
    
    @objc func tappedMe() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // you need to cast this next line to the type of VC.
        let vc = storyboard.instantiateViewController(withIdentifier: "SocialMediaViewController") as! SocialMediaViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func tappedMe2() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // you need to cast this next line to the type of VC.
        let vc = storyboard.instantiateViewController(withIdentifier: "AboutGuestSchoolViewController") as! AboutGuestSchoolViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func tappedMe3() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // you need to cast this next line to the type of VC.
        let vc = storyboard.instantiateViewController(withIdentifier: "NewFeesViewController") as! NewFeesViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        let statusBarColor = #colorLiteral(red: 0.1882352941, green: 0.3843137255, blue: 0.5294117647, alpha: 1)
        statusBarView.backgroundColor = statusBarColor
        view.addSubview(statusBarView)
    }
    
    

}
