import UIKit
/*
 TableView
 Custom Cell
 API Caller
 Open the news Story
 Search for the news
 */
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "👁‍🗨News"
        view.backgroundColor = .systemBackground
        
        APICaller.shared.getTopStories { result in
            
        }
    }

}

