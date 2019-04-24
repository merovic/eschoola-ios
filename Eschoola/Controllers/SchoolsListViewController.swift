//
//  SchoolsListViewController.swift
//  NanoSchool
//
//  Created by Apple on 3/12/19.
//  Copyright © 2019 Walidghonem. All rights reserved.
//

import UIKit
import ImageSlideshow
import MOLH
import XMSegmentedControl
import MapKit

class SchoolsListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,XMSegmentedControlDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var mapView: MKMapView!
    
    var schools = Array<schoolListItem>()
    
    @IBOutlet weak var navTitle: UILabel!
    @IBOutlet weak var navbar: UINavigationBar!
    @IBOutlet weak var slideshow: ImageSlideshow!
    
    @IBOutlet weak var drawerButtonItem: UIBarButtonItem!
    
    @IBOutlet weak var blurVieww: UIView!
    
    @IBOutlet weak var swipeConstrain: NSLayoutConstraint!
    
    var menushowing = false
    
    let localSource = [ImageSource(imageString: "img1")!, ImageSource(imageString: "img2")!]
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    
    @IBOutlet weak var menuTableView: UITableView!
    
    var sections = [" ","Setting","Information"]
    
    @IBOutlet weak var signupButton: UIButton!
    
    
    var sidemenuitems = [
        ["Profile","Calendar","Favorite List","Reservation List"],
        ["Language","Notifications","Distance"],
        ["Contact us","About Us"]
    ]
    
    
    @IBOutlet weak var segmentedView: UIView!
    
    let locationmanger = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 90.0
        
        mapView.isHidden = true
        searchBar.isHidden = true
        blurVieww.isHidden = true
        
        if(MOLHLanguage.isRTLLanguage())
        {
            signupButton.titleLabel?.font = UIFont(name: "DroidArabicKufi", size: 15)
            
            signupButton.setTitle("تسجيل الدخول", for: .normal)
            
            sections.removeAll()
            sections = [" ","الأعدادات","معلومات"]
            sidemenuitems.removeAll()
            sidemenuitems = [
                ["الحساب","التقويم","المفضلة","الحجوزات"],
                ["اللغة","الأشعارات","المسافة"],
                ["اتصل بنا","عنا"]
                ]
            schools.append(schoolListItem(schoolName: "مدرسة السلام المتطورة"))
            schools.append(schoolListItem(schoolName: "مدرسة السلام المتطورة"))
            schools.append(schoolListItem(schoolName: "مدرسة السلام المتطورة"))
            schools.append(schoolListItem(schoolName: "مدرسة السلام المتطورة"))
        
        }else
        {
            schools.append(schoolListItem(schoolName: "El-Salam Modern School"))
            schools.append(schoolListItem(schoolName: "El-Salam Modern School"))
            schools.append(schoolListItem(schoolName: "El-Salam Modern School"))
            schools.append(schoolListItem(schoolName: "El-Salam Modern School"))
            schools.append(schoolListItem(schoolName: "El-Salam Modern School"))
        }
        

        intializeSegemntedControl()
        
        intializeSlideShow()
        
        SideMenuRecognizers()
        
        mapConfiguration()
        
        welcomepopup()
       
    }
    
    
    @IBAction func signup(_ sender: Any) {
    }
    
    func SideMenuRecognizers() {
        
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenEdgeSwiped))
        edgePan.edges = .left
        
        view.addGestureRecognizer(edgePan)
        
        let edgePan2 = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenEdgeSwiped))
        edgePan2.edges = .right
        
        view.addGestureRecognizer(edgePan2)
        
        let edgePan3 = UISwipeGestureRecognizer(target: self, action: #selector(screenEdgeSwiped))
        edgePan3.direction = .right
        
        blurVieww.addGestureRecognizer(edgePan3)
        
        let edgePan4 = UISwipeGestureRecognizer(target: self, action: #selector(screenEdgeSwiped))
        edgePan4.direction = .left
        
        blurVieww.addGestureRecognizer(edgePan4)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(SchoolsListViewController.tappedMe3))
        blurVieww.addGestureRecognizer(tap)
        blurVieww.isUserInteractionEnabled = true
        
    }
    
    @objc func tappedMe3() {
        
        changeDrawerState()
    }
    
    func intializeSegemntedControl()
    {
        let backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let highlightColor = #colorLiteral(red: 0.1882352941, green: 0.3843137255, blue: 0.5294117647, alpha: 1)
        
        let titles = ["مدارس", "خريطة"]
        let icons = [UIImage(named: "schoolsorange")!, UIImage(named: "maporange")!]
        
        let frame = CGRect(x: 0, y: 0, width: self.view.frame.width - 17, height: self.segmentedView.frame.height)
        
        let segmentedControl2 = XMSegmentedControl(frame: frame, segmentContent: (titles, icons), selectedItemHighlightStyle: XMSelectedItemHighlightStyle.background)
        
        
        segmentedControl2.delegate = self
        
        segmentedControl2.backgroundColor = backgroundColor
        segmentedControl2.highlightColor = highlightColor
        segmentedControl2.tint = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        segmentedControl2.highlightTint = #colorLiteral(red: 0.9803921569, green: 0.6588235294, blue: 0.09803921569, alpha: 1)
        segmentedControl2.contentType = .hybrid
        segmentedView.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        segmentedView.layer.borderWidth = 1.0
        segmentedControl2.layer.borderWidth = 1.0
        
        //self.view.addSubview(segmentedControl2)
        self.segmentedView.addSubview(segmentedControl2)
    }
    
    func xmSegmentedControl(_ xmSegmentedControl: XMSegmentedControl, selectedSegment: Int) {
        if(selectedSegment==0)
        {
            tableView.isHidden = false
            mapView.isHidden = true
        }else
        {
            tableView.isHidden = true
            mapView.isHidden = false
        }
    }
    
    func mapConfiguration()
    {
        
        locationmanger.delegate = self as? CLLocationManagerDelegate
        locationmanger.requestWhenInUseAuthorization()
        locationmanger.startUpdatingLocation()
        
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(31.006512, 29.814974)
        let region:MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "El-Eleem School"
        annotation.subtitle = "Location"
        
        mapView.addAnnotation(annotation)
        
    }

    
    func intializeSlideShow()
    {
        slideshow.layer.cornerRadius = 15
        slideshow.backgroundColor = UIColor.white
        slideshow.slideshowInterval = 5.0
        //   slideshow.pageControlPosition = PageControlPosition.underScrollView
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
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(SchoolsListViewController.didTap))
        slideshow.addGestureRecognizer(recognizer)
    }
    
    func welcomepopup()
    {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "WelcomeViewController") as! WelcomeViewController
        
        self.present(newViewController, animated: true, completion: nil)
    }
    
    @IBAction func filterClick(_ sender: Any) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "FilterViewController") as! FilterViewController
        
        self.present(newViewController, animated: true, completion: nil)
    }
    
    @IBAction func searchClick(_ sender: Any) {
        
        if(searchBar.isHidden)
        {

            searchBar.fadeIn()
            
        }else
        {
            

            searchBar.fadeOut()
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(tableView==menuTableView)
        {
            return sidemenuitems[section].count
        }else{
            return schools.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if(tableView==menuTableView)
        {
            return sections[section]
        }else
        {
            return ""
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        view.tintColor = UIColor.white
        
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
         return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(tableView==menuTableView)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuTableViewCell") as! SideMenuTableViewCell
            
            cell.menuTitle.text = sidemenuitems[indexPath.section][indexPath.row]
            
            cell.menuTitle.font = UIFont.init(name: "DroidArabicKufi" , size: 14)
            
            if(indexPath.section==0)
            {
                switch indexPath.row {
                    
                case 0:
                    cell.menuIcon.image = UIImage(named: "profile")
                case 1:
                    cell.menuIcon.image = UIImage(named: "calender")
                case 2:
                    cell.menuIcon.image = UIImage(named: "favorite")
                case 3:
                    cell.menuIcon.image = UIImage(named: "reservation")
                default:
                    cell.menuIcon.image = UIImage(named: "filter")
                }
            }else if(indexPath.section==1)
            {
                switch indexPath.row {
                    
                case 0:
                    cell.menuIcon.image = UIImage(named: "language")
                case 1:
                    cell.menuIcon.image = UIImage(named: "notification")
                case 2:
                    cell.menuIcon.image = UIImage(named: "distance")
                default:
                    cell.menuIcon.image = UIImage(named: "filter")
                }
            }else if(indexPath.section==2)
            {
                switch indexPath.row {
                    
                case 0:
                    cell.menuIcon.image = UIImage(named: "contactus")
                case 1:
                    cell.menuIcon.image = UIImage(named: "aboutus")
                default:
                    cell.menuIcon.image = UIImage(named: "filter")
                }
            }
            
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "SchoolsListTableViewCell") as! SchoolsListTableViewCell
            
            cell.schoolName.text = schools[indexPath.row].schoolName!
            
            cell.schoolName.font = UIFont.init(name: "DroidArabicKufi" , size: 12)
            cell.schoolsDesc.font = UIFont.init(name: "DroidArabicKufi", size: 10)
            cell.schoolDistance.font = UIFont.init(name: "DroidArabicKufi", size: 14)
            
            cell.container.layer.cornerRadius = 10
            cell.container.layer.borderColor = #colorLiteral(red: 0.1882352941, green: 0.3843137255, blue: 0.5294117647, alpha: 1)
            cell.container.layer.borderWidth = 0.5
            cell.container.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            
            cell.schoolLogoContainer.layer.cornerRadius = 5
            cell.schoolLogoContainer.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            cell.schoolLogoContainer.layer.borderWidth = 1
            cell.schoolLogoContainer.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            
            cell.compareButton.layer.cornerRadius = 5
            cell.compareButton.layer.borderColor = #colorLiteral(red: 0.1882352941, green: 0.3843137255, blue: 0.5294117647, alpha: 1)
            cell.compareButton.layer.borderWidth = 1
            cell.compareButton.layer.backgroundColor = #colorLiteral(red: 0.1882352941, green: 0.3843137255, blue: 0.5294117647, alpha: 1)
            
           
            
            if(MOLHLanguage.isRTLLanguage())
            {
                cell.compareButton.setTitle("قارن", for: .normal)
                cell.compareButton.titleLabel?.font = UIFont(name: "DroidArabicKufi", size: 12)
            }
            
            return cell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(tableView==menuTableView)
        {
            changeDrawerState()
            
            if(indexPath.section==0)
            {
                if(indexPath.row == 0)
                {
                    let storyboard = UIStoryboard(name: "SideMenu", bundle: nil)
                    
                    let vc = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
                    
                    self.navigationController?.pushViewController(vc, animated: true)
                }else if(indexPath.row == 1)
                {
                    let storyboard = UIStoryboard(name: "SideMenu", bundle: nil)
                    
                    let vc = storyboard.instantiateViewController(withIdentifier: "CalendarViewController") as! CalendarViewController
                    
                    self.navigationController?.pushViewController(vc, animated: true)
                }else if(indexPath.row == 2)
                {
                    let storyboard = UIStoryboard(name: "SideMenu", bundle: nil)
                    
                    let vc = storyboard.instantiateViewController(withIdentifier: "FavoriteViewController") as! FavoriteViewController
                    
                    self.navigationController?.pushViewController(vc, animated: true)
                }else if(indexPath.row == 3)
                {
                    let storyboard = UIStoryboard(name: "SideMenu", bundle: nil)
                    
                    let vc = storyboard.instantiateViewController(withIdentifier: "ReservationViewController") as! ReservationViewController
                    
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }else if(indexPath.section==1)
            {
                if(indexPath.row == 0)
                {
                    let storyboard = UIStoryboard(name: "SideMenu", bundle: nil)
                    
                    let vc = storyboard.instantiateViewController(withIdentifier: "SettingViewController") as! SettingViewController
                    
                    self.navigationController?.pushViewController(vc, animated: true)
                }else if(indexPath.row == 1)
                {
                    let storyboard = UIStoryboard(name: "SideMenu", bundle: nil)
                    
                    let vc = storyboard.instantiateViewController(withIdentifier: "WeatherSettingsViewController") as! WeatherSettingsViewController
                    
                    self.navigationController?.pushViewController(vc, animated: true)
                }else if(indexPath.row == 2)
                {
                    let storyboard = UIStoryboard(name: "SideMenu", bundle: nil)
                    
                    let vc = storyboard.instantiateViewController(withIdentifier: "DistanceSettingsViewController") as! DistanceSettingsViewController
                    
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }else if(indexPath.section==2)
            {
                if(indexPath.row == 0)
                {
                    let storyboard = UIStoryboard(name: "SideMenu", bundle: nil)
                    
                    let vc = storyboard.instantiateViewController(withIdentifier: "HelpViewController") as! HelpViewController
                    
                    self.navigationController?.pushViewController(vc, animated: true)
                }else if(indexPath.row == 1)
                {
                    let storyboard = UIStoryboard(name: "SideMenu", bundle: nil)
                    
                    let vc = storyboard.instantiateViewController(withIdentifier: "AboutApplicationViewController") as! AboutApplicationViewController
                    
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
            
            
        }else
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            // you need to cast this next line to the type of VC.
            let vc = storyboard.instantiateViewController(withIdentifier: "SchoolDetailsViewController") as! SchoolDetailsViewController // or whatever it is
            // vc is the controller. Just put the properties in it.
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    
    @objc func screenEdgeSwiped(_ recognizer: UIScreenEdgePanGestureRecognizer) {
       if recognizer.state == .recognized {
        changeDrawerState()
    }
}
    
    func changeDrawerState()
    {
            print("Screen edge swiped!")
            
            if(menushowing)
            {
                
                filterButton.isHidden = false
                searchButton.isHidden = false
                
                swipeConstrain.constant = -300
                
                blurVieww.blurView.alpha = 0
                
                UIView.animate(withDuration: 0.1,
                               animations: {
                                self.view.layoutIfNeeded()
                })
                
                
                blurVieww.isHidden = true
                
            }else
            {
                
                searchBar.isHidden = true
                filterButton.isHidden = true
                searchButton.isHidden = true
                
                swipeConstrain.constant = 0
                
                blurVieww.isHidden = false
                
                blurVieww.blurView.alpha = 0.9
                blurVieww.blurView.setup(style: UIBlurEffect.Style.light, alpha: 0.9).enable()
                
                UIView.animate(withDuration: 0.1,
                               animations: {
                                self.view.layoutIfNeeded()
                })
                
                
            }
            
            menushowing = !menushowing
        
    }
    
    @IBAction func drawerButton(_ sender: Any) {
        
        searchBar.isHidden = true
        filterButton.isHidden = true
        searchButton.isHidden = true
        
        swipeConstrain.constant = 0
        
        blurVieww.isHidden = false
        
        blurVieww.blurView.alpha = 0.9
        blurVieww.blurView.setup(style: UIBlurEffect.Style.light, alpha: 0.9).enable()
        
        UIView.animate(withDuration: 0.1,
                       animations: {
                        self.view.layoutIfNeeded()
        })
        
        menushowing = !menushowing
        
    }
    

    @objc func didTap() {
        let fullScreenController = slideshow.presentFullScreenController(from: self)
        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        let statusBarColor = #colorLiteral(red: 0.1882352941, green: 0.3843137255, blue: 0.5294117647, alpha: 1)
        statusBarView.backgroundColor = statusBarColor
        view.addSubview(statusBarView)
    }
    
}


extension UIView {
    
    func fadeIn(duration: TimeInterval = 0.3, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in }) {
        self.alpha = 0.0
        
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.isHidden = false
            self.alpha = 1.0
        }, completion: completion)
    }
    
    func fadeOut(duration: TimeInterval = 0.3, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in }) {
        self.alpha = 1.0
        
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 0.0
        }) { (completed) in
            self.isHidden = true
            completion(true)
        }
    }
}
