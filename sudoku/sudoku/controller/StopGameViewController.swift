import UIKit
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes

class StopGameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //прозрачность фона
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        
        moveInStop()
        
        let MSAppCenter_Key = Bundle.init(for: AppDelegate.self).infoDictionary?["MSAppCenter_Key"] as! String
        MSAppCenter.start(MSAppCenter_Key, withServices:[
          MSCrashes.self
        ])
    }
    
    @IBAction func playGameBitton(_ sender: Any) {
        self.view.removeFromSuperview()
        
        //Таптик отклик
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
        
        let nc = NotificationCenter.default
        nc.post(name: NSNotification.Name(rawValue: "startTimerValue"), object: nil, userInfo: nil)
        
        
        moveOutStop()
    }
    
    //Анимация появления
    func moveInStop() {
         self.view.transform = CGAffineTransform(scaleX: 1.35, y: 1.35)
         self.view.alpha = 0.0
         
         UIView.animate(withDuration: 0.24) {
             self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
             self.view.alpha = 1.0
         }
     }
     
    //Анимация исчезновения
     func moveOutStop() {
         UIView.animate(withDuration: 0.24, animations: {
             self.view.transform = CGAffineTransform(scaleX: 1.35, y: 1.35)
             self.view.alpha = 0.0
         }) { _ in
             self.view.removeFromSuperview()
         }
     }
    
    
//    override func prepare (for segue: UIStoryboardSegue, sender: Any?) {
//        var DestViewController: ViewController = segue.destination as! ViewController
//        
//        DestViewController.timerSec()
//    }
    
    


}
