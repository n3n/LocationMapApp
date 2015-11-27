import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!
    
    var treasures: [Treasure] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTreasures()
        setupMapView()
    }
    
    private func setupMapView() {
        self.mapView.delegate = self
        self.mapView.addAnnotations(self.treasures)

        let rect = self.treasures.reduce(MKMapRectNull) {
            (mapRect: MKMapRect, treasure: Treasure) -> MKMapRect in
            let pRect = MKMapRect(origin: treasure.location.mapPoint, size: MKMapSize(width: 0, height: 0))
            return MKMapRectUnion(mapRect, pRect)
        }
        
        self.mapView.setVisibleMapRect(rect, edgePadding: UIEdgeInsetsMake(74, 10, 10, 10), animated: false)
    }
    
    private func setupTreasures() {
        self.treasures = [
            HistoryTreasure(name: "Google's First Office", year: 1999, latitude: 37.44451, longitude: -122.163369),
            HistoryTreasure(name: "Facebook's First Office", year: 2005, latitude: 37.444268, longitude: -122.163271),
            FactTreasure(name: "Stanford University", fact: "Founded by Leland Stanford", latitude: 37.427474, longitude: -122.169719),
            FactTreasure(name: "Computer History Mesuem", fact: "Home to a working Babbage Difference Engine", latitude: 37.414371, longitude: -122.076817)
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    
}

extension ViewController: MKMapViewDelegate {
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if let _ = annotation as? Treasure {
            var view = mapView.dequeueReusableAnnotationViewWithIdentifier("pin") as! MKPinAnnotationView!
            if view == nil {
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
                view.canShowCallout = true
                view.animatesDrop = false
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type: .DetailDisclosure) as UIView
            } else {
                view.annotation = annotation
            }
            return view;
        } else {
            return nil
        }
    }
}










