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
        
        /*
         * utilisation d'un fichier
         */
        if let utilisateursFichier = Bundle.main.path(forResource: "utilisateurs", ofType: "xml") {
            if let utilisateursString = try? String(contentsOfFile: utilisateursFichier) {
                if let utilisateurData = utilisateursString.data(using: .utf8) {
                    
                    
                    //parsing de notere fichier XML
                    let parser = EasyXMLParser(withData: utilisateurData)
                    let items = parser.parse()
                    

                    
                    //affichage des utilisateur "non filtré" via l'élément items
                    print("   **********************************************")
                    print("   *          UTILISATEURS NON FILTRES          *")
                    print("   **********************************************")
                    
                    for item in items["utilisateurs"]["utilisateur"].getSiblingWithSameName() {
                        print()
                        print(item.fullDescription())
                        print("                             -*-")
                    }
                    
                    //affichage des utilisateurs fitré (sans parcours de items ou autre)
                    let filtreUtilisateur = ["utilisateur":["nom":"", "mail":""]]
                    
                    print("   **********************************************")
                    print("   *          UTILISATEURS     FILTRES          *")
                    print("   **********************************************")
                    
                    for item in items.filter(filtre: filtreUtilisateur) {
                        print()
                        print(item.fullDescription())
                        print("                             -*-")
                    }
                    
                    print("   **********************************************")
                    print("   *       PREMIER UTILISATEUR CAST             *")
                    print("   **********************************************")
                    
                    print("Code postal du premier utilisateur (int) : \(items["utilisateurs"]["utilisateur"]["code_postal"].intValue)")
                    print("Code postal du premier utilisateur (float) : \(items["utilisateurs"]["utilisateur"]["code_postal"].floatValue)\n")

                }
            }
        }
        
        
        /*
         *  Utilisation d'un URL
         */
        if let url = URL.init(string: "https://korben.info/feed") {
            if let xmlData = try? Data.init(contentsOf: url) {
                

                let parser = EasyXMLParser(withData: xmlData)
                let letFluxRSS = parser.parse()
                
                
                print("   **********************************************")
                print("   *         FLUX RSS   DONNES DU CHANNEL       *")
                print("   **********************************************")

                print("Nom du flux RSS : \(letFluxRSS["rss"]["channel"]["title"].value)")
                print("Adress du flux RSS : \(letFluxRSS["rss"]["channel"]["link"].value)")
                
                print("Nombre d'article du flux RSS : \(letFluxRSS["rss"]["channel"]["item"].countSiblingWithSameName())")
                print("Nombre de données pour le premier article : \(letFluxRSS["rss"]["channel"]["item"].countAllChildren()) \n\n")
                
                
                print("   **********************************************")
                print("   *         FLUX RSS          ARICLE           *")
                print("   **********************************************")
                
                for article in letFluxRSS["rss"]["channel"]["item"].getSiblingWithSameName() {
                    print()
                    print(article.fullDescription())
                    print("                             -*-")
                }
            }
        }
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

