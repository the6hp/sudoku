import UIKit

class StopGameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //прозрачность фона
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        
        moveInStop()
    }
    
    @IBAction func playGameBitton(_ sender: Any) {
        self.view.removeFromSuperview()
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

}
