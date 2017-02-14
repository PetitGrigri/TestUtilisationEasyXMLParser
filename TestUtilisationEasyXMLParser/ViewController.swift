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
        
        //utilisation d'un fichier
        if let utilisateursFichier = Bundle.main.path(forResource: "utilisateurs", ofType: "xml") {
            if let utilisateursString = try? String(contentsOfFile: utilisateursFichier) {
                if let utilisateurData = utilisateursString.data(using: .utf8) {
                    
                    let parser = EasyXMLParser(withData: utilisateurData)
                    
                    let items = parser.parse()
                    let items2 = items.filter(filtre: ["utilisateur":["nom":"", "mail":""]])

                    
                    for item in items2 {
                        print("\n\n")
                        print(item.fullDescription())
                        print("                             *                              ")
                    }
                    
                    /*
                    print(items);
                    print(items.fullDescription())
                    print("\n\nAffiche des données du premier utilisateur")
                    print("____________________________________________________________")
                    
                    
                    let utilisateur1 = items["utilisateurs"]["utilisateur"].get()[0]
                    print(utilisateur1.fullDescription())
                    
                    print("                             *                              ")
                    
                    print("\n\nAffiche de tout les utilisateurs du fichier utilisateur.xml")
                    print("____________________________________________________________")
                    
                    print("Dans le fichier il y a \(items["utilisateurs"]["utilisateur"].count()) utilisateur")
                    
                    for item in items["utilisateurs"]["utilisateur"].get() {
                        print("\n\n")
                        print(item.fullDescription())
                        print("                             *                              ")
                        
                    }*/
                }
            }
        }
        
        /*
        //version collection
        if let url = URL.init(string: "https://korben.info/feed") {
            if let xmlData = try? Data.init(contentsOf: url) {
                
                let parser = EasyXMLParser(withData: xmlData)
                
                //ne fonctonne pas pour le moment, mais ca va venir
                /*let items = parser.fill(collection: [ "item" : ["title":"",
                                                                "link":"",
                                                                "category": []]] )*/
                
                //lancement de l'analyse complète du XML
                let items = parser.parse()
                
                print ("\nAffichage du  résultat du fill (version collection) : ")
                print("(filtre à venir) ")
                
                //affichage d'éléments précis de items (ici on regarde des informations concernant channel
                print("\naffichage d'éléments précis : ")
                print("____________________________________________________________")
                print("['rss']['channel']['title'] : \(items["rss"]["channel"]["title"].value)")
                print("['rss']['channel']['link'] : \(items["rss"]["channel"]["link"].value)")
                
                //affichage du dernier item du flux rss (c'est un comportement lié au subscrit de EasyXMLElement
                print("\n\nAffichage du dernier item du flux rss")
                print("____________________________________________________________")
                print("['rss']['channel']['item'] : \(items["rss"]["channel"]["item"].name)")
                
                //affichage de tout les article de notre flux rss (correspondant aux balises item)
                print("\n\nAffiche de tout les items")
                print("____________________________________________________________")
                print("nombre d'items : \(items["rss"]["channel"]["item"].count())")
                for item in items["rss"]["channel"]["item"].get() {
                    print("\n\n")
                    print(item.fullDescription())
                    print("                             *                              ")
                    
                }
                //[String:EasyXMLElement]
                
                
                
            }
        }

        */
        
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
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

