//
//  HeroViewModel.swift
//  MenuBar
//
//  Created by Shawn Li on 6/2/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit
import MarvelApiWrapper
import Alamofire

class MarvelHeroViewModel
{
    var heroInfo = [Character]()
    
    init() {}
    
    init(name: String)
    {
        fetchDataSource(characterName: name)
    }
    
    func fetchDataSource(characterName: String)
    {
        let privateKey = AppConstants.ServiceConstants.privateKey
        let publicKey = AppConstants.ServiceConstants.publicKey
        
        let marvel = MarvelApiWrapper(publicKey: privateKey, privateKey: publicKey)
        var config = CharacterConfig()
        config.name = characterName
        
        marvel.getAllCharacterWith(config: config)
        { (data, response, error) in
            if let characterData = data
            {
                DispatchQueue.main.async
                {
                    do
                    {
                        let dataContainer = try JSONDecoder().decode(CharacterDataWrapper.self, from: characterData)
                        if let characters = dataContainer.data?.results
                        {
                            self.heroInfo = characters
                        }
                    }
                    catch
                    {
                        print(error.localizedDescription)
                    }
                }
                
            }
        }
    }
    
    func fetchImage(indexPath: IndexPath, handler: @escaping (Data) -> ())
    {
        if let urlPath = heroInfo[indexPath.row].thumbnail.path
        {
            AF.request(urlPath).response
            { (response) in
                if let data = response.data
                {
                    handler(data)
                }
            }
        }
    }
}
