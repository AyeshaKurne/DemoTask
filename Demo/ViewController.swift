//
//  ViewController.swift
//  Demo
//
//  Created by Ayesha K on 11/08/21.
//

import UIKit

class Characters {
    var charName: String?
    var char: [String]?
    
    init(charName: String, char: [String]) {
        self.charName = charName
        self.char = char
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var characters = [Characters]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        characters.append(Characters.init(charName: "Alphabets", char: ["A","B","C", "D", "E", "F", "G", "H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]))
        characters.append(Characters.init(charName: "Numbers", char: ["0", "1", "2", "3", "4","5","6","7","8","9"]))
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters[section].char?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = characters[indexPath.section].char?[indexPath.row]
        return cell
    }
       
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        view.backgroundColor = #colorLiteral(red: 1, green: 0.3653766513, blue: 0.1507387459, alpha: 1)
        
        let lbl = UILabel(frame: CGRect(x: 15, y: 0, width: view.frame.width - 15, height: 40))
        lbl.font = UIFont.systemFont(ofSize: 20)
        lbl.text = characters[section].charName
        view.addSubview(lbl)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    
}

