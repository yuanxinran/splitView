//
//
//  Created by Anna Yuan on 2/26/19.
//  Copyright © 2019 Anna Yuan. All rights reserved.
//

import UIKit

protocol AnimalSelectionDelegate: class {
    func animalSelected(_ newAnimal: Animal)
}


class ListViewController: UITableViewController {
    
    let animals = [
        Animal(name: "Cat", description: "Meow"),
        Animal(name: "Dog", description: "Bark"),
        Animal(name: "Duck", description: "Quack"),
        Animal(name: "Bee", description: "Buzz"),
        Animal(name: "Cattle",description: "Moo")
        
    ]
    
    weak var delegate: AnimalSelectionDelegate?
    
    // MARK: - Table view data source
    
    override func tableView(_ _tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return animals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let animal =  animals[indexPath.row]
        cell.textLabel?.text = animal.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedAnimal = animals[indexPath.row]
        delegate?.animalSelected(selectedAnimal)
        if let detailViewController = delegate as? DetailViewController {
            splitViewController?.showDetailViewController(detailViewController, sender: nil)
        }

    }
    
}


