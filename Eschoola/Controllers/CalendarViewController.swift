//
//  CalendarViewController.swift
//  NanoSchool
//
//  Created by Walidghonem on 6/7/18.
//  Copyright © 2018 Walidghonem. All rights reserved.
//

import UIKit
import MOLH

class CalendarViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,CalendarViewDataSource,CalendarViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var emptyView: UIView!
    
    @IBOutlet weak var vacationText: UILabel!
    
    @IBOutlet weak var emptyText: UILabel!
    
    @IBOutlet weak var calendarView: CalendarView!
    
    var events = Array<CalendarItem>()
    
    var eventsCal = Array<CalendarEvent>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emptyText.font = UIFont.init(name: "DroidArabicKufi", size: 17)
        
        vacationText.font = UIFont.init(name: "DroidArabicKufi", size: 17)
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "dd-MM-yyyy"
        let date1 = dateformatter.date (from: "10-06-2018")
        let date2 = dateformatter.date (from: "11-06-2018")
        let date3 = dateformatter.date (from: "22-06-2018")
        let date4 = dateformatter.date (from: "23-06-2018")
        
        
        if(MOLHLanguage.isRTLLanguage())
        {
            
            emptyText.text = "لا توجد اجازات رسمية هذا الشهر"
            
            vacationText.text = "الأجازات الرسمية"
            
            eventsCal.append(CalendarEvent(title: "عيد العمال", startDate: nextDate(date: date1!)))
            eventsCal.append(CalendarEvent(title: "عيد الأم", startDate: nextDate(date: date2!)))
            eventsCal.append(CalendarEvent(title: "العيد القومى", startDate: nextDate(date: date3!)))
            eventsCal.append(CalendarEvent(title: "عيد الأضحى", startDate: nextDate(date: date4!)))
            
        }else
        {
            
            emptyText.text = "No Official Vacations this Month"
            
            vacationText.text = "Official Vacatons"
            
            eventsCal.append(CalendarEvent(title: "Workers Day", startDate: nextDate(date: date1!)))
            eventsCal.append(CalendarEvent(title: "Mothers Day", startDate: nextDate(date: date2!)))
            eventsCal.append(CalendarEvent(title: "National Day", startDate: nextDate(date: date3!)))
            eventsCal.append(CalendarEvent(title: "Eid el-Adha", startDate: nextDate(date: date4!)))
        }
        
        
        
        
        CalendarView.Style.cellShape = .bevel(8.0)
        CalendarView.Style.cellColorDefault = UIColor.clear
        CalendarView.Style.cellColorToday = UIColor .gray
        CalendarView.Style.cellBorderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        CalendarView.Style.cellEventColor = #colorLiteral(red: 1, green: 0.0187217119, blue: 0, alpha: 1)
        CalendarView.Style.headerTextColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        CalendarView.Style.cellTextColorDefault = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        CalendarView.Style.cellTextColorToday = #colorLiteral(red: 0.2309043854, green: 1, blue: 0.1388150806, alpha: 1)
        
        CalendarView.Style.firstWeekday             = .sunday
        
        calendarView.dataSource = self
        calendarView.delegate = self
        
        calendarView.direction = .horizontal
        calendarView.multipleSelectionEnable = false
        calendarView.marksWeekends = true
        
        calendarView.backgroundColor = #colorLiteral(red: 0.1882352941, green: 0.3843137255, blue: 0.5294117647, alpha: 1)
        
        
    }
    
    
    @IBAction func onBackPressed(_ sender: Any) {
       self.dismiss(animated: true, completion: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        self.calendarView.events = eventsCal
        
        let today = Date()
        
        //print(today.description)
        
        self.calendarView.setDisplayDate(today, animated: false)
        
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

    
    
    
    
    func nextDate(date:Date) -> Date {
        
        let next = Calendar.current.date(byAdding: .day, value: 1, to: date)
        return next!
    }
    
    
    
    // MARK : KDCalendarDataSource
    
    func startDate() -> Date {
        
        var dateComponents = DateComponents()
        dateComponents.month = -3
        
        let today = Date()
        
        let threeMonthsAgo = self.calendarView.calendar.date(byAdding: dateComponents, to: today)!
        
        return threeMonthsAgo
    }
    
    func endDate() -> Date {
        
        var dateComponents = DateComponents()
        
        dateComponents.month = 2;
        dateComponents.day = -10
        let today = Date()
        
        let twoYearsFromNow = self.calendarView.calendar.date(byAdding: dateComponents, to: today)!
        
        return twoYearsFromNow
        
    }
    
    // MARK : KDCalendarDelegate
    
    func calendar(_ calendar: CalendarView, didSelectDate date : Date, withEvents events: [CalendarEvent]) {
        
        print("Did Select: \(date) with \(events.count) events")
        for event in events {
            print("\t\"\(event.title)\" - Starting at:\(event.startDate)")
        }
        
    }
    
    
    func calendar(_ calendar: CalendarView, didScrollToMonth date: Date) {
        
       
        var newEvents = Array<CalendarEvent>()
        
        events.removeAll()
        
        for i in (0..<eventsCal.count) {
            
            let monthdateFormatter = DateFormatter()
            monthdateFormatter.dateFormat = "LLLL"
            
            let nameOfMonthinEvents = monthdateFormatter.string(from: eventsCal[i].startDate)
            
            let nameOfCurrentMonth = monthdateFormatter.string(from: date)
            
            
            if(nameOfMonthinEvents == nameOfCurrentMonth)
            {
                newEvents.append(eventsCal[i])
                
                
                
                let formatter = DateFormatter()
                formatter.dateFormat = "dd-MM-yyyy"
                
                //let dayNumber = daydateFormatter.string(from: date!)
                
                events.append(CalendarItem(eventDate: formatter.string(from: newEvents[i].startDate), eventName: newEvents[i].title))
                
                
            }
            
        }
        
        tableView.reloadData()
        
        if(newEvents.count==0)
        {
            tableView.isHidden = true
            emptyView.isHidden = false
        }else
        {
            tableView.isHidden = false
            emptyView.isHidden = true
        }
       
    }
    
    private func getDate(unixdate: Int, timezone: String) -> String {
        let date = NSDate(timeIntervalSince1970: TimeInterval(unixdate))
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "dd-MM-yyyy"
        dayTimePeriodFormatter.timeZone = NSTimeZone(name: timezone) as TimeZone?
        let dateString = dayTimePeriodFormatter.string(from: date as Date)
        return "Updated: \(dateString)"
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell13") as! CalendarTableViewCell
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "dd-MM-yyyy"
        let date = dateformatter.date (from: events[indexPath.row].eventDate!)
        
        let monthdateFormatter = DateFormatter()
        let daydateFormatter = DateFormatter()
        
        monthdateFormatter.dateFormat = "LLL"
        daydateFormatter.dateFormat = "dd"
        
        let dayNumber = daydateFormatter.string(from: date!)
        
        let monthName = monthdateFormatter.string(from: date!)
        
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        let GregorianDate = dateFormatter.date(from: events[indexPath.row].eventDate!)
        
        let islamic = NSCalendar(identifier: NSCalendar.Identifier.islamicUmmAlQura)
        
        let components = islamic?.components(NSCalendar.Unit(rawValue: UInt.max), from: GregorianDate!)
        
       // resultlable.text = "\(components!.year) - \(components!.month) - \(components!.day)"
    
        
        
        
        
        cell.eventName.text = events[indexPath.row].eventName!
        cell.eventDateEN.text = dayNumber + " " + monthName
        cell.eventDateAR.text = "\(components!.year ?? 5) - \(components!.month ?? 5) - \(components!.day ?? 5)"
        
        
        cell.eventDateEN.font = UIFont.init(name: "DroidArabicKufi" , size: 10)
        cell.eventName.font = UIFont.init(name: "DroidArabicKufi" , size: 15)
        cell.eventDateAR.font = UIFont.init(name: "DroidArabicKufi" , size: 13)
        
        return cell
    }
    
    
    
    
    // Screen Width.
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    // Screen height.
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    
}
