//
//  ViewController.swift
//  TestUtilisationEasyXMLParser
//
//  Created by Fabien on 06/02/2017.
//  Copyright © 2017 com.griselles.tp. All rights reserved.
//

import UIKit
import Foundation
import EasyXMLParser

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        //version collection
        if let url = URL.init(string: "https://korben.info/feed") {
            if let xmlData = try? Data.init(contentsOf: url) {
                
                let parser = EasyXMLParser(withData: xmlData)
                
                //on recherche ici des item pouvant contenir un titre, un link ou des categories
                let items = parser.fill(collection: [ "item" : ["title":"",
                                                                "link":"",
                                                                "category": []]] )
                
                
                print ("\nAffichage du  résultat du fill (version collection) : ")
                print("(il n'y a pas de filtre pour le moment se basant se basant sur la collection fournis par l'utilisateur) ")
                
                
                print("\naffichage d'élément précis : ")
                print("____________________________________________________________")
                print("['rss']['channel']['title'] : \(items["rss"]["channel"]["title"].value!)")
                print("['rss']['channel']['link'] : \(items["rss"]["channel"]["link"].value!)")
                print("['rss']['channel']['item']['title'] : \(items["rss"]["channel"]["item"]["title"].value!)")
                
                print("\naffichage du dictionaire d'un item de notre flux RSS (on ne voit que le dernier pour le moment")
                print("____________________________________________________________")
                //print("['rss']['channel']['item'] : \(items["rss"]["channel"]["item"].dico)")
                parsingDicoValues(myDico: items["rss"]["channel"]["item"].dico)
                
                
                
                
                //[String:EasyXMLElement]
                
                
                
            }
        }

        
        
        //version objet
        /*
        if let url = URL.init(string: "https://korben.info/feed") {
            if let xmlData = try? Data.init(contentsOf: url) {
                
                print ("\nAffichage du  fill (version collection) : \n________________________________")
                
                let parser = EasyXMLParser(withData: xmlData)
                
                let premierItem = parser.fill(objectName: "TestUtilisationEasyXMLParser.Item").first as! Item
                
                print("Title : \(premierItem.title)")
                print("Link : \(premierItem.link)")
                print("comments : \(premierItem.comments)")
                print("category : \(premierItem.category)")
            }
        }
        */
        
        
    }

    
    private func parsingDicoValues(myDico: [String:EasyXMLElement]) {
    
        let keys = myDico.keys;
        
        for key in keys {
                if var tempoValue = myDico[key]?.value as? String {
                    
                    
                    let sizeTempoValue = tempoValue.distance(from: tempoValue.startIndex, to: tempoValue.endIndex)
                    
                    
                    let tempoValue2 = tempoValue.substring(to: tempoValue.index(    tempoValue.startIndex, offsetBy: ((sizeTempoValue  > 150) ? 150 : sizeTempoValue)))
                    
                    if (tempoValue.characters.count > tempoValue2.characters.count) {
                        print ("\(key) : \n\(tempoValue2) ...")
                    } else {
                        print ("\(key) : \n\(tempoValue)")
                    }
                } else {
                    print ("\(key) : VIDE")
                }
                
            
            
        }
        
    
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

