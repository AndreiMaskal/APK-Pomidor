//
//  ViewController.swift
//  APK_Pomidor_Andrei_Maskal
//
//  Created by Andrei Maskal on 20/05/2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addHierarchy()
        addConstrates()
    }
    
    private func setupView() {
        view.backgroundColor = Color.gray.color
    }
    
    //MARK: imageView
    
    private func setupCircleImage(background: UIColor, sizeBorder: CGFloat, colorBorder:  CGColor, imageHeightWidth: CGFloat) -> UIImageView {
        let iconImageView = UIImageView()
        iconImageView.backgroundColor = background
        let imageHeightWidth = imageHeightWidth
        iconImageView.layer.borderWidth = sizeBorder
        iconImageView.layer.borderColor = colorBorder
        iconImageView.layer.cornerRadius = imageHeightWidth / 2
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        return iconImageView
    }

    private lazy var workCircleImageView = setupCircleImage(background: Color.gray.color, sizeBorder: 5, colorBorder: UIColor.yellow.cgColor, imageHeightWidth: 250)
    
    private lazy var workCircleLitleImageView = setupCircleImage(background: Color.gray.color, sizeBorder: 1, colorBorder: UIColor.yellow.cgColor, imageHeightWidth: 30)
    
    private lazy var pouseCircleImageView = setupCircleImage(background: Color.gray.color, sizeBorder: 5, colorBorder: UIColor.systemPink.cgColor, imageHeightWidth: 250)

    private lazy var pauseCircleLitleImageView = setupCircleImage(background: Color.gray.color, sizeBorder: 1, colorBorder: UIColor.systemPink.cgColor, imageHeightWidth: 30)

    //MARK: buttons
    
    private lazy var playButton: UIButton = {
        let playButton = UIButton()
        playButton.setImage(UIImage(named: "play"), for: .normal)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        return playButton
    }()
    
    private lazy var pauseButton: UIButton = {
        let playButton = UIButton()
        playButton.setImage(UIImage(named: "pause"), for: .normal)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        return playButton
    }()
    
    
    
    //MARK: labels
    
    private lazy var workNumberLabel: UILabel = {
        let numberLabel = UILabel()
        numberLabel.text = "25:00"
        numberLabel.font = .systemFont(ofSize: 50)
        numberLabel.textColor = Color.yelow.color
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        return numberLabel
    }()
    
    private lazy var pauseNumberLabel: UILabel = {
        let numberLabel = UILabel()
        numberLabel.text = "5:00"
        numberLabel.font = .systemFont(ofSize: 50)
        numberLabel.textColor = Color.pink.color
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        return numberLabel
    }()
    
    //MARK: metods
    
    private func addHierarchy() {
        view.addSubview(workCircleImageView)
        view.addSubview(playButton)
        view.addSubview(workNumberLabel)
        view.addSubview(workCircleLitleImageView)
        
//        view.addSubview(pouseCircleImageView)
//        view.addSubview(pauseButton)
//        view.addSubview(pauseNumberLabel)
//        view.addSubview(pauseCircleLitleImageView)
    
    }
    
    //MARK: constrates
    
    private func addConstrates() {
    
        //MARK: workConstrates
        
        NSLayoutConstraint.activate([
            workCircleImageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            workCircleImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            workCircleImageView.heightAnchor.constraint(equalToConstant: 250),
            workCircleImageView.widthAnchor.constraint(equalToConstant: 250)
        ])

        NSLayoutConstraint.activate([
            playButton.bottomAnchor.constraint(equalTo: workCircleImageView.bottomAnchor, constant: -50),
            playButton.centerXAnchor.constraint(equalTo: workCircleImageView.centerXAnchor),
            playButton.heightAnchor.constraint(equalToConstant: 30),
            playButton.widthAnchor.constraint(equalToConstant: 30)
        ])

        NSLayoutConstraint.activate([
            workNumberLabel.topAnchor.constraint(equalTo: workCircleImageView.topAnchor, constant: 40),
            workNumberLabel.centerXAnchor.constraint(equalTo: workCircleImageView.centerXAnchor),
            workNumberLabel.heightAnchor.constraint(equalToConstant: 70)
        ])

        NSLayoutConstraint.activate([
            workCircleLitleImageView.centerYAnchor.constraint(equalTo: workCircleImageView.topAnchor, constant: 3),
            workCircleLitleImageView.centerXAnchor.constraint(equalTo: workCircleImageView.centerXAnchor),
            workCircleLitleImageView.heightAnchor.constraint(equalToConstant: 30),
            workCircleLitleImageView.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        //MARK: pauseConstrates
//
//        NSLayoutConstraint.activate([
//            pouseCircleImageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
//            pouseCircleImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
//            pouseCircleImageView.heightAnchor.constraint(equalToConstant: 250),
//            pouseCircleImageView.widthAnchor.constraint(equalToConstant: 250)
//        ])
//
//        NSLayoutConstraint.activate([
//            pauseButton.bottomAnchor.constraint(equalTo: pouseCircleImageView.bottomAnchor, constant: -50),
//            pauseButton.centerXAnchor.constraint(equalTo: pouseCircleImageView.centerXAnchor),
//            pauseButton.heightAnchor.constraint(equalToConstant: 30),
//            pauseButton.widthAnchor.constraint(equalToConstant: 30)
//        ])
//
//        NSLayoutConstraint.activate([
//            pauseNumberLabel.topAnchor.constraint(equalTo: pouseCircleImageView.topAnchor, constant: 40),
//            pauseNumberLabel.centerXAnchor.constraint(equalTo: pouseCircleImageView.centerXAnchor),
//            pauseNumberLabel.heightAnchor.constraint(equalToConstant: 70)
//        ])
//
//        NSLayoutConstraint.activate([
//            pauseCircleLitleImageView.centerYAnchor.constraint(equalTo: pouseCircleImageView.topAnchor, constant: 3),
//            pauseCircleLitleImageView.centerXAnchor.constraint(equalTo: pouseCircleImageView.centerXAnchor),
//            pauseCircleLitleImageView.heightAnchor.constraint(equalToConstant: 30),
//            pauseCircleLitleImageView.widthAnchor.constraint(equalToConstant: 30)
//        ])
        
        
    }
    
    enum Color {
        case yelow
        case gray
        case pink
        
        var color: UIColor {
            switch self {
            case .yelow:
                return #colorLiteral(red: 0.9979768395, green: 0.8412192464, blue: 0.03621713817, alpha: 1)
            case .gray:
                return #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            case .pink:
                return #colorLiteral(red: 1, green: 0.2161273062, blue: 0.3737276793, alpha: 1)
                
            }
        }
    }
}
