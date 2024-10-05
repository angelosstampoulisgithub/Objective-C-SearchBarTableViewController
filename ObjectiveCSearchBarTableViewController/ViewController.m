//
//  ViewController.m
//  ObjectiveCSearchBarTableViewController
//
//  Created by Angelos Staboulis on 4/10/24.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableData];

    [self initTableView];
    // Do any additional setup after loading the view.
}
-(void) initTableView{
    [_tableViewSearch registerClass:[UITableViewCell self] forCellReuseIdentifier:@"cell"];
    [_tableViewSearch setDelegate:self];
    [_tableViewSearch setDataSource:self];
    [_searchBar setDelegate:self];
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    [_filterArray removeAllObjects];

    for(NSString *item in _array){
        NSRange range = [item rangeOfString:searchText];
        if (range.location != NSNotFound){
            [_filterArray addObject:item];
        }
    }
    [_tableViewSearch reloadData];

}
-(void) initTableData{
    _array = [NSMutableArray array];
    _filterArray = [NSMutableArray array];
    [_array addObject:@"Angelos"];
    [_array addObject:@"Angeliki"];
    [_array addObject:@"Theodoros"];
    [_array addObject:@"John"];
    [_array addObject:@"Ilias"];
    [_array addObject:@"Theodora"];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_filterArray count] > 0 ?  [_filterArray count] :[_array count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if ([_filterArray count] > 0){
        [cell setText:[NSString stringWithFormat:@"%@",[_filterArray objectAtIndex:indexPath.row]]];
    }else{
        [cell setText:[NSString stringWithFormat:@"%@",[_array objectAtIndex:indexPath.row]]];
    }
    return cell;
}
@end
