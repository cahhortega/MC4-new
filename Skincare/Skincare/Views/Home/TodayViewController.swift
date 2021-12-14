//
//  TodayViewController.swift
//  Skincare
//
//  Created by Carolina Ortega on 01/12/21.
//

import UIKit

class TodayViewController: UIViewController {
    @IBOutlet var routineCollectionView: UICollectionView!
    var defaults = UserDefaults.standard
    @IBOutlet var titleLabel: UILabel!
    let hour = Calendar.current.component(.hour, from: Date()) //Hora do dia
    let currentWeekDay = Calendar.current.component(.weekday, from: Date())-1 //Dia da semana (terça = 2)
    //-1 é para igualar as posições do dia com as posições dos botões no vetor
    let currentDay = Calendar.current.component(.day, from: Date()) //Dia
    var currentMonth = Calendar.current.component(.month, from: Date()) //Mês
    let fraseSemRotina = UILabel()
    let imagemBoasVindas = UIImageView()

    
    @IBOutlet weak var profileAvatar: UIButton!
    @IBOutlet var day1: UIButton!
    @IBOutlet var day2: UIButton!
    @IBOutlet var day3: UIButton!
    @IBOutlet var day4: UIButton!
    @IBOutlet var day5: UIButton!
    @IBOutlet var day6: UIButton!
    @IBOutlet var day7: UIButton!
    
    lazy var days: [UIButton] = [day1, day2, day3, day4, day5, day6, day7]
    
    var oi: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        //collectionView
        self.routineCollectionView.delegate = self
        self.routineCollectionView.dataSource = self
        view.addSubview(fraseSemRotina)
        view.addSubview(imagemBoasVindas)
        
        imagemBoasVindas.image = UIImage(named: "menina triste")
        imagemBoasVindas.translatesAutoresizingMaskIntoConstraints = false
        
        imagemBoasVindas.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50).isActive = true
        imagemBoasVindas.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        fraseSemRotina.text = "Clique em ”+” para criar sua primeira rotina"

        fraseSemRotina.numberOfLines = 0
        fraseSemRotina.textAlignment = .center
        fraseSemRotina.textColor = .label

        fraseSemRotina.translatesAutoresizingMaskIntoConstraints = false
        fraseSemRotina.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35).isActive = true
        fraseSemRotina.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35).isActive = true
        fraseSemRotina.topAnchor.constraint(equalTo: imagemBoasVindas.bottomAnchor, constant: 35).isActive = true
        

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
        
        
        //Dia atual
        days[currentWeekDay].backgroundColor = UIColor(named: "Rosa")
        days[currentWeekDay].titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        titleText() //Formatação do título
        calendario()
        
    }
    


    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        var buttonImage = UIImage(named: defaults.string(forKey: "profileImage")!)
        profileAvatar.setImage(buttonImage, for: .normal)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
//        let buttonImage = UIImage(named: defaults.string(forKey: "profileImage")!)
//        profileAvatar.setImage(buttonImage, for: .normal)

        self.routineCollectionView.reloadData()
        numeroDeCelulas()
    }
    
    func numeroDeCelulas(){
        if Int(self.oi.count) != 0 { //Colocar aqui a lista de cards
            routineCollectionView.isHidden = false
            fraseSemRotina.isHidden = true
            imagemBoasVindas.isHidden = true
            
        } else{
            routineCollectionView.isHidden = true
            fraseSemRotina.isHidden = false
            imagemBoasVindas.isHidden = false
            
        }
    }
    
    func calendario(){
        var diaDepois = currentDay
        var diaAntes = currentDay
        currentMonth = 2
        for i in currentWeekDay ... 6 {
            days[i].setTitle("\(diaDepois)", for: .normal)
            if currentMonth == 2 {
                if diaDepois == 28 { //FEV
                    diaDepois = 1
                } else {
                    diaDepois += 1
                }
            } else if currentMonth == 1 || currentMonth == 3 || currentMonth == 5 || currentMonth == 7 || currentMonth == 8 || currentMonth == 10 || currentMonth == 12 { //Meses com 31 dias
                if diaDepois == 31{
                    diaDepois = 1
                } else {
                    diaDepois += 1
                }
            } else { //Meses com 30 dias
                if diaDepois == 30{
                    diaDepois = 1
                } else {
                    diaDepois += 1
                }
            }
        }
        for j in (0 ... currentWeekDay-1).reversed() {
            diaAntes -= 1
            days[j].setTitle("\(diaAntes)", for: .normal)
        }
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
            titleLabel.text = "Bom dia, \(defaults.string(forKey: "name") ?? "")!"
        } else if hour > 12 && hour <= 18 {
            titleLabel.text = "Boa tarde, \(defaults.string(forKey: "name") ?? "")!"
        } else {
            titleLabel.text = "Boa noite, \(defaults.string(forKey: "name") ?? "")!"
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
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = routineCollectionView.dequeueReusableCell(withReuseIdentifier: "rotine", for: indexPath) as! RoutineCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 360, height: 170)
    }
}
