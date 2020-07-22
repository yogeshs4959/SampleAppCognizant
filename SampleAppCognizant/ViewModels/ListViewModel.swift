//
//  ListViewModel.swift
//  SampleAppCognizant
//
//  Created by nous on 22/07/20.
//  Copyright © 2020 yogesh. All rights reserved.
//

import Foundation

protocol ListViewModelProtocol {
    func getListItems()
    func setError(_ message: String)
    var listItems: Observable<[Item]> { get  set }
    var navTitle: Observable<String?> { get set }
    var errorMessage: Observable<String?> { get set }
    var isLoading: Observable<Bool> { get set }
}


class ListViewModel: ListViewModelProtocol {
    
    
    var listItems: Observable<[Item]> = Observable([])
    var navTitle: Observable<String?> = Observable(nil)
    var errorMessage: Observable<String?> = Observable(nil)
    var isLoading: Observable<Bool> = Observable(false)
    
    let apiManager: ApiManager
    
    init(_apiManager: ApiManager) {
        apiManager = _apiManager
    }
    
    
    func getListItems() {
        apiManager.getListData(completion: {(items, title) -> Void in
            self.listItems.value = items
            self.navTitle.value = title
            
        }, onError: { err -> Void in 
            self.setError("No Data Available")
        })
        
    }
    
    func setError(_ message: String) {
        self.errorMessage = Observable(message)
    }
    
}
