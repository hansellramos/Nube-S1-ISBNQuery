//
//  ViewController.swift
//  Nube-S1-ISBNQuery
//
//  Created by Hansel Ramos Osorio on 10/12/16.
//  Copyright © 2016 Hansel Ramos Osorio. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    @IBOutlet weak var txtISBN: UITextField!
    @IBOutlet weak var txvResultado: UITextView!
    @IBAction func btnClearSearch(_ sender: AnyObject) {
        txtISBN.text = ""
    }
    @IBAction func btnClearResult(_ sender: AnyObject) {
        txvResultado.text = ""
    }
    @IBAction func btnBuscar(_ sender: UIButton) {
        txvResultado.text = "Cargando..."
        let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:\(txtISBN.text!)"
        let url = URL(string: urls)
        let urlRequest = URLRequest(url: url!)
        let session = URLSession.shared
        let dt = session.dataTask(with: urlRequest, completionHandler: { (datos, resp, error) in
            if error == nil {
                let texto = NSString(data: datos!, encoding: String.Encoding.utf8.rawValue)
                DispatchQueue.main.sync(){
                    self.txvResultado.text = texto! as String
                }
            }else{
                DispatchQueue.main.sync(){
                    self.txvResultado.text = "Error!"
                }
            }
        })
        
        dt.resume()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

