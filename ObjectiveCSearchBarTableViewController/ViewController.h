//
//  ViewController.h
//  ObjectiveCSearchBarTableViewController
//
//  Created by Angelos Staboulis on 4/10/24.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (weak, nonatomic) IBOutlet UITableView *tableViewSearch;

@property NSMutableArray *array;

@property NSMutableArray *filterArray;

@end

