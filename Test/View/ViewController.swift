//
//  ViewController.swift
//  Test
//
//  Created by iMac on 31/08/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var tableView: UITableView!
    
    let imageScrollViewHeight : CGFloat = 228
    var currentPageIndex = 0{
        didSet{
            pageControl.currentPage = currentPageIndex
        }
    }
    let searchBar = UISearchBar()
    var isSearching = false
    var companyNamesViewModelObj : CompanyNamesViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpHeaderAndPageControl()
        companyNamesViewModelObj = CompanyNamesViewModel()
        companyNamesViewModelObj!.bindDataToViewController = {[self] in
            setHeader()
            setUpTableView()
        }
        
        companyNamesViewModelObj!.addData()
    }
    
    func setUpHeaderAndPageControl() {
        searchBar.frame = CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 45)
        searchBar.searchTextField.returnKeyType = .search
        searchBar.searchTextField.delegate = self
        searchBar.searchTextField.showDoneButtonOnKeyboard()
        
        pageControl.numberOfPages = 3
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.systemRed
    }
    
    //Set scrollview for image slideshow as header of tableview
    func setHeader() {
        
        scrollView?.showsHorizontalScrollIndicator = false
        scrollView?.isPagingEnabled = true
        scrollView.delegate = self
        let width = view.bounds.size.width
        
        for i in 0..<companyNamesViewModelObj!.content.count {
            let offset = i == 0 ? 0 : (CGFloat(i) * width)
            let imgView = UIImageView(frame: CGRect(x: offset, y: 0, width: width, height: imageScrollViewHeight))
            let innerDic = companyNamesViewModelObj!.content[i]
            imgView.image = innerDic.image
            imgView.clipsToBounds = true
            imgView.contentMode = .scaleAspectFill
            scrollView!.addSubview(imgView)
        }
        // set the contentSize
        scrollView!.contentSize = CGSize(width: CGFloat(companyNamesViewModelObj!.content.count) * width, height: imageScrollViewHeight)
    }
    
    
    func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib.init(nibName: NamesTVCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: NamesTVCell.identifier)
        tableView.separatorColor = .clear
        
    }
}

//MARK:- UITableViewDelegate & UITableViewDataSource methods
extension ViewController : UITableViewDelegate,UITableViewDataSource{
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return companyNamesViewModelObj!.filteredCompaniesArray.count
        }else{
            return companyNamesViewModelObj!.content[currentPageIndex].companyInfoDic?.count ?? 0
        }
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NamesTVCell.identifier, for: indexPath) as! NamesTVCell
        if isSearching {
            cell.configureCell(companyInfo: companyNamesViewModelObj!.filteredCompaniesArray[indexPath.row])
        }else{
            if let names = companyNamesViewModelObj!.content[currentPageIndex].companyInfoDic{
                cell.configureCell(companyInfo: names[indexPath.row])
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        searchBar.delegate = self
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search"
        searchBar.backgroundColor = .white
        return searchBar
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
}

//MARK:- UIScrollViewDelegate methods
extension ViewController: UIScrollViewDelegate {
    //Handles dismissal of keyboard
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
        let pageWidth = scrollView.frame.width
        let pageIndex = Int(floor((scrollView.contentOffset.x - pageWidth/2)/pageWidth) + 1)
        if pageIndex != currentPageIndex {
            isSearching = false
            companyNamesViewModelObj!.filteredCompaniesArray.removeAll()
            searchBar.searchTextField.text = ""
            searchBar.searchTextField.resignFirstResponder()
            currentPageIndex = pageIndex
            tableView.reloadData()
        }
    }
}

//MARK:- Seach bar delegate methods
extension ViewController : UITextFieldDelegate{
    //Handles dismissal of keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//MARK:- Seach bar delegate methods
extension ViewController : UISearchBarDelegate{
    //Handles filtering logic of names
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearching = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.searchTextField.resignFirstResponder()
        isSearching = false
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            isSearching = false
            tableView.reloadData()
            return
        }
        guard let names = companyNamesViewModelObj!.content[currentPageIndex].companyInfoDic else {return}
        
        companyNamesViewModelObj!.filteredCompaniesArray.removeAll()
        companyNamesViewModelObj!.filteredCompaniesArray = names.filter { (dic) -> Bool in
            return NSString.init(string: dic["name"]!).localizedCaseInsensitiveContains(searchText)
        }
        reloadTablveAfterFiltering()
    }
    
    func reloadTablveAfterFiltering() {
        isSearching = true
        tableView.reloadData()
    }
}


