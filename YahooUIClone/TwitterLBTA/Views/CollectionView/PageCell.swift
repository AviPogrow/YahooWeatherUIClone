
import UIKit

@available(iOS 11.0, *)

func delayBySeconds(_ seconds: Double, delayedCode: @escaping ()->()) {
    let targetTime = DispatchTime.now() + Double(Int64(Double(NSEC_PER_SEC) * seconds)) / Double(NSEC_PER_SEC)
    print(targetTime)
    DispatchQueue.main.asyncAfter(deadline: targetTime) {
        delayedCode()
    }
}

@available(iOS 11.0, *)
class PageCell: UICollectionViewCell,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    
    var location: Location! {
        didSet{
            
            if innerCollectionView != nil {
            let backgroundImage = UIImage(named: location.name)
            let backgroundImageView = UIImageView(image: backgroundImage)
            innerCollectionView.backgroundView = backgroundImageView
            innerCollectionView.reloadData()
            
            }
            
            if refreshView != nil {
                refreshView.location = location
            }
        }
    }
    
    var refreshView: RefreshView!
    var innerCollectionView: UICollectionView!

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
       //addInnerCollectionView()
       
    }
        
    func addRefreshViewToCollectionView() {
        let refreshViewHeight: CGFloat = 84
        let refreshRect = CGRect(x: 0.0, y: -refreshViewHeight, width: self.frame.size.width, height: refreshViewHeight)
        
        refreshView = RefreshView(frame: refreshRect)
    
        refreshView.location = location
        
        innerCollectionView.insertSubview(refreshView, at: 0)
    }
        
    func addInnerCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        
        let height = self.bounds.height
        let width =  self.bounds.width
        let x = 0.0
        let y = CGFloat(self.bounds.minY)
        let rect = CGRect(x: CGFloat(x), y: y, width: width, height: height)
        
        innerCollectionView = UICollectionView(frame: rect, collectionViewLayout: layout)
        
        layout.sectionHeadersPinToVisibleBounds = true
        
        innerCollectionView.register(CurrentConditionsCell.self, forCellWithReuseIdentifier: String(describing: CurrentConditionsCell.self))
        
        innerCollectionView.register(EmptyCell.self, forCellWithReuseIdentifier: String(describing: EmptyCell.self))
        
        innerCollectionView.register(HeaderStatusCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerId")
        
        innerCollectionView.register(ForecastCell.self, forCellWithReuseIdentifier: String(describing: ForecastCell.self))
        
        innerCollectionView.dataSource = self
        innerCollectionView.delegate = self
        
        let backgroundImage = UIImage(named: location.name)
        let backgroundImageView = UIImageView(image: backgroundImage)
        innerCollectionView.backgroundView = backgroundImageView
        
        //set up auto layout constraints for innercollectionView
        //innerCollectionView.translatesAutoresizingMaskIntoConstraints = false
        //innerCollectionView.leftAnchor.constraint(equalTo: self.leftAnchor)
        //innerCollectionView.rightAnchor.constraint(equalTo: self.rightAnchor)
        //innerCollectionView.topAnchor.constraint(equalTo: self.topAnchor)
        //innerCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        self.addSubview(innerCollectionView)
    }
    
    // MARK: Scroll view methods
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
       
        if scrollView.contentOffset.y <= -85 {
          let lockPoint = CGPoint(x: 0.0, y: -80)
            
            self.innerCollectionView.setContentOffset(lockPoint, animated: true)
            
            // lockRefreshView()
            delayBySeconds(2.25)  {
            let defaultPoint = CGPoint(x: 0, y: 0)
             
            self.innerCollectionView.setContentOffset(defaultPoint, animated: true)
            }
        }
    }
    
    override func didMoveToSuperview() {
     
      self.addInnerCollectionView()
      self.addRefreshViewToCollectionView()
    }
    
    func collectionView(_ collectionView: UICollectionView,
      numberOfItemsInSection section: Int) -> Int {
    
      return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
      if indexPath.item == 0 {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
            String(describing: EmptyCell.self), for: indexPath) as! EmptyCell
            return cell
        } else if indexPath.item == 1 {
            
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CurrentConditionsCell.self), for: indexPath) as! CurrentConditionsCell
            
            cell.location = location
            
            cell.backgroundColor = UIColor.clear
            return cell
        } else  {
            
            
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ForecastCell.self), for: indexPath) as! ForecastCell
        
          cell.layer.borderColor = UIColor.red.cgColor
          cell.layer.borderWidth = 3.0
            
          return cell
        }
     }
    
     func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerId", for: indexPath) as! HeaderStatusCell
            
            header.configureForLocation(location: location)
            
          return header
        } else {
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item == 0 {
        
        return CGSize(width: collectionView.bounds.width - 16, height: bounds.height - 250)
        
        } else {
        
        return CGSize(width: collectionView.bounds.width - 16, height: bounds.height - 350)
    }
  }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.frame.width, height: 64)
    }
}


