//

import UIKit

@available(iOS 11.0, *)

class ContainerViewController: UIViewController, MenuTableViewControllerDelegate {

    
    let menuTableViewController = MenuTableViewController()
    
    let centerViewController = CenterHorizontalController(collectionViewLayout: UICollectionViewFlowLayout())

    var locations = Location.createLocationsArray()
    
    var sidePanelOpen: Bool = false
 
    lazy var menuWidth = {
        self.view.bounds.width / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerForTapNotification()
    
        addCenterHorizontalViewController()
        
        
    }
    
    
    var centerPanelLeftAnchorConstraint: NSLayoutConstraint!
    
    func addCenterHorizontalViewController() {
        
       centerViewController.locations = locations
        
        
        
        view.addSubview(centerViewController.view)
        
      
        
        centerViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
         centerPanelLeftAnchorConstraint  =
        
        centerViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        
         centerPanelLeftAnchorConstraint?.isActive = true
        
        
        centerViewController.view.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
       
        centerViewController.view.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
        
        
        centerViewController.view.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
      
        centerViewController.pageCell = PageCell(frame: .zero)
        
        addShadowToView(centerViewController.view)
        
    }
    
    
   
    
    func addMenuTableViewController() {
        
        print("add menu tableView invoked")
        
        menuTableViewController.delegate = self
        menuTableViewController.locations = locations
        
        view.insertSubview(menuTableViewController.view, at: 0)
        
        
      
       
        menuTableViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        menuTableViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
            
       
        
        menuTableViewController.view.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        
        menuTableViewController.view.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
        
         menuTableViewController.view.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
        
      
        //view.layoutIfNeeded()
       
        sidePanelOpen = true
    
    }
    
    
    // invoked when menu button is tapped to open and close
    // the center panel
    @objc func animateCenterPanelXPosition(_ notification: Notification) {
      
      //  if sidePanelOpen == false {
        
        addMenuTableViewController()
        animateCenterPanelXPosition(to: 200)
      
        
        //let widthAnchorConstant = view.widthAnchor.constraint(equalToConstant: -100)
        
        //centerPanelLeftAnchorConstraint.isActive  = false
        
        //centerPanelLeftAnchorConstraint = view.widthAnchor.constraint(equalToConstant: -100)
        
       // centerPanelLeftAnchorConstraint.isActive  = true
        
        //self.view.layoutIfNeeded()
        //centerViewController.collectionView?.isScrollEnabled = false
        
        //    if centerViewController.pageCell != nil {
 //centerViewController.pageCell.innerCollectionView?.isScrollEnabled = false
       //     }

        
         
        
       // } else {
            
       // animateCenterPanelXPosition(to: 0)
       // print("animateCenterPanelTo position 0 invoked")
       // centerViewController.collectionView?.isScrollEnabled = true
            
       // }
        
    }
    
    
    
    
    // is used by the animate function from notification
    // but also when close is tapped or
    // when a location is tapped
    @objc func animateCenterPanelXPosition(to targetPosition: CGFloat) {
        
        if targetPosition == 0 {
           //self.menuTableViewController.tableView.reloadData()
           // self.centerViewController.collectionView?.reloadData()
        
            //self.centerViewController.view.removeGestureRecognizer(panGesture2)
       }
        
        print("animateCenterPanelINvoked")
        
        
        
       
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.5,
        animations: {
            
         self.centerPanelLeftAnchorConstraint?.constant = targetPosition
            
            
        self.view.layoutIfNeeded()
            
       
        
        self.addPanGestureRecognizer()
            
         
      
        }, completion: { (_) in
        
            //if targetPosition == 0 {
           
             //self.menuTableViewController.view.removeFromSuperview()
            // self.sidePanelOpen = false
          
        
           // } else {
                
      
                
           // }
        })
        
    }
    

    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    func registerForTapNotification() {
        NotificationCenter.default.addObserver(self, selector:
        #selector(animateCenterPanelXPosition(_:)), name: .MenuTappedNotification, object: nil)
    }
}

@available(iOS 11.0, *)

// Mark: - Delegate methods from the side panel/ menu table vc

extension ContainerViewController {

// implement delegate methods from tablel View controller
func didSelectLocation(_ location: Location) {
    
    //update data model
    location.date = Date()
    
    locations.sort(by: {location1, location2 in
        return location1.date > location2.date
    })
    
    
    centerViewController.locations = locations
   
    
    self.menuTableViewController.tableView.reloadData()
    self.centerViewController.collectionView?.reloadData()
    
    animateCenterPanelXPosition(to: 0.0)
    
   
    
        
        
    
    centerViewController.collectionView?.isScrollEnabled = true
   
   
    
}
func closeButtonPressed() {
    animateCenterPanelXPosition(to: 0)
    centerViewController.collectionView?.isScrollEnabled = true

}
    
    func addShadowToView(_ destView: UIView) {
        destView.layer.shadowPath = UIBezierPath(rect: destView.bounds).cgPath
        destView.layer.shadowRadius = 2.5
        destView.layer.shadowOpacity = 1.0
        destView.layer.shadowColor = UIColor.black.cgColor
        
    }

}


@available(iOS 11.0, *)
extension ContainerViewController: UIGestureRecognizerDelegate {
    
    func addPanGestureRecognizer() {
        let panGesture2 = UIPanGestureRecognizer(target: self, action: #selector(self.handlePanGesture(_:)))
        centerViewController.view.addGestureRecognizer(panGesture2)
    }
    
    @objc func handlePanGesture(_ recognizer: UIPanGestureRecognizer) {
            print("panning gesturizing")
        
        let zero = CGFloat(integerLiteral: 0)
        
    let leftPanelIsOpen = ((recognizer.view?.frame.minX)! > zero)
            
    let gestureIsDraggingFromRightToLeft = (recognizer.velocity(in: view).x < 0)
        
   
    // check that the left panel is open
      //  if (recognizer.view?.bounds.minX)! > CGFloat(0) == true {
        switch recognizer.state {
        case .began:
            if leftPanelIsOpen &&   gestureIsDraggingFromRightToLeft{
                
            }
            
        case .changed:
            
           if leftPanelIsOpen &&   gestureIsDraggingFromRightToLeft {
            
            if let recView = recognizer.view {
                recView.center.x = recView.center.x + recognizer.translation(in: recView).x
                
             recognizer.setTranslation(CGPoint.zero, in: recView)
            }
    }
        case .ended:
            
            if let recView = recognizer.view {
                if recView.frame.minX < menuTableViewController.view.bounds.midX {
                    animateCenterPanelXPosition(to: 0)
                } else {
                    animateCenterPanelXPosition(to: 200.0)
                }
            }
            
        
        default:
            break
        }
    
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view === centerViewController.view {
            return false
        } else {
            return true
        }
    }
}
