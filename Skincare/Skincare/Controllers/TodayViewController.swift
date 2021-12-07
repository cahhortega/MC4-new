//
//  TodayViewController.swift
//  Skincare
//
//  Created by Carolina Ortega on 01/12/21.
//

import UIKit

class TodayViewController: UIViewController {
    @IBOutlet var routineCollectionView: UICollectionView!
    
    @IBOutlet var titleLabel: UILabel!
    let hour = Calendar.current.component(.hour, from: Date()) //Hora do dia
    let currentWeekDay = Calendar.current.component(.weekday, from: Date()) //Dia da semana (terça = 3)
    let currentDay = Calendar.current.component(.day, from: Date()) //Dia
    let countDays = 0 //Contador de dias

    
    @IBOutlet var day1: UIButton!
    @IBOutlet var day2: UIButton!
    @IBOutlet var day3: UIButton!
    @IBOutlet var day4: UIButton!
    @IBOutlet var day5: UIButton!
    @IBOutlet var day6: UIButton!
    @IBOutlet var day7: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //collectionView
        self.routineCollectionView.delegate = self
        self.routineCollectionView.dataSource = self
        
        //Dias
        let days: [UIButton] = [day1, day2, day3, day4, day5, day6, day7]
        days[currentWeekDay].setTitle("\(currentDay)", for: .normal)
        days[currentWeekDay-1].setTitle("\(currentDay-1)", for: .normal)
        
        days[currentWeekDay].backgroundColor = UIColor(named: "Rosa")

        days[currentWeekDay].titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)

      
        //Formatação do título
        titleText()
        
        //Botões dos dias da semana
        day1.translatesAutoresizingMaskIntoConstraints = false
        day1.addTarget(self, action: #selector(clicarDia1), for: .touchUpInside)
        
        day2.translatesAutoresizingMaskIntoConstraints = false
        day2.addTarget(self, action: #selector(clicarDia2), for: .touchUpInside)
        
        day3.translatesAutoresizingMaskIntoConstraints = false
        day3.addTarget(self, action: #selector(clicarDia3), for: .touchUpInside)
        
        day4.translatesAutoresizingMaskIntoConstraints = false
        day4.addTarget(self, action: #selector(clicarDia4), for: .touchUpInside)
        
        day5.translatesAutoresizingMaskIntoConstraints = false
        day5.addTarget(self, action: #selector(clicarDia5), for: .touchUpInside)
        
        day6.translatesAutoresizingMaskIntoConstraints = false
        day6.addTarget(self, action: #selector(clicarDia6), for: .touchUpInside)
        
        day7.translatesAutoresizingMaskIntoConstraints = false
        day7.addTarget(self, action: #selector(clicarDia7), for: .touchUpInside)
        
        
    }
    //Função que muda o background do botão
    @objc func clickDays(selected: UIButton,
                         day2: UIButton,
                         day3: UIButton,
                         day4: UIButton,
                         day5: UIButton,
                         day6: UIButton,
                         day7: UIButton) {
        if !selected.isSelected{
            selected.backgroundColor = UIColor(named: "Rosa")
            selected.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
            day2.backgroundColor = UIColor(named: "Bg")
            day2.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
            day3.backgroundColor = UIColor(named: "Bg")
            day3.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
            day4.backgroundColor = UIColor(named: "Bg")
            day4.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
            day5.backgroundColor = UIColor(named: "Bg")
            day5.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
            day6.backgroundColor = UIColor(named: "Bg")
            day6.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
            day7.backgroundColor = UIColor(named: "Bg")
            day7.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
            
        }
        else {
            selected.backgroundColor = UIColor(named: "Bg")
            selected.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
        }
        
        
    }
    
    func titleText(){
        if hour <= 12 {
            titleLabel.text = "Bom dia, \(UserDefaults.standard.string(forKey: "name") ?? "")!"
        } else if hour > 12 && hour <= 18 {
            titleLabel.text = "Boa tarde, \(UserDefaults.standard.string(forKey: "name") ?? "")!"
        } else {
            titleLabel.text = "Boa noite, \(UserDefaults.standard.string(forKey: "name") ?? "")!"
        }
    }
    
    //Ações dos botões
    @objc func clicarDia1() {
        clickDays(selected: day1, day2: day2, day3: day3, day4: day4, day5: day5, day6: day6, day7: day7)
    }
    @objc func clicarDia2() {
        clickDays(selected: day2, day2: day1, day3: day3, day4: day4, day5: day5, day6: day6, day7: day7)
    }
    @objc func clicarDia3() {
        clickDays(selected: day3, day2: day2, day3: day1, day4: day4, day5: day5, day6: day6, day7: day7)
    }
    @objc func clicarDia4() {
        clickDays(selected: day4, day2: day2, day3: day3, day4: day1, day5: day5, day6: day6, day7: day7)
    }
    @objc func clicarDia5() {
        clickDays(selected: day5, day2: day2, day3: day3, day4: day4, day5: day1, day6: day6, day7: day7)
    }
    @objc func clicarDia6() {
        clickDays(selected: day6, day2: day2, day3: day3, day4: day4, day5: day5, day6: day1, day7: day7)
    }
    @objc func clicarDia7() {
        clickDays(selected: day7, day2: day2, day3: day3, day4: day4, day5: day5, day6: day6, day7: day1)
    }
    
}
//Formatação da collectionView
extension TodayViewController: UICollectionViewDelegate{
    
}

extension TodayViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = routineCollectionView.dequeueReusableCell(withReuseIdentifier: "rotine", for: indexPath) as! RoutineCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 360, height: 170)
    }
}
