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
    
    //MARK: valueBool
    
    var isWorkTime = true
    var isStarted = false
    var isPrased = false
    
    //MARK: property
    
    var workTimer = Timer()
    var pauseTimer = Timer()
    var durationTimerMinutes = TimerWork.minutes.rawValue
    var durationTimerSecond = TimerWork.second.rawValue
    var pauseDurationTimerMinutes = TimerRest.minutes.rawValue
    var pauseDurationTimerSecond = TimerRest.second.rawValue
    
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
    
    private lazy var pauseCircleImageView = setupCircleImage(background: Color.gray.color, sizeBorder: 5, colorBorder: UIColor.systemPink.cgColor, imageHeightWidth: 250)
    
    private lazy var pauseCircleLitleImageView = setupCircleImage(background: Color.gray.color, sizeBorder: 1, colorBorder: UIColor.systemPink.cgColor, imageHeightWidth: 30)
    
    //MARK: buttons
    
    private lazy var workPlayButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "play"), for: .normal)
        button.addTarget(self,
                         action: #selector(workButtonIsPressed(sander:)),
                         for: .touchDown)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var pauseButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "play2"), for: .normal)
        button.addTarget(self,
                         action: #selector(pauseButtonIsPressed(sander:)),
                         for: .touchDown)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: labels
    
    private lazy var workNumberLabel: UILabel = {
        let numberLabel = UILabel()
        
        numberLabel.text = NSString(format: "%0.2d:%0.2d", durationTimerMinutes, durationTimerSecond) as String
        numberLabel.font = .systemFont(ofSize: 50)
        numberLabel.textColor = Color.yelow.color
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        return numberLabel
    }()
    
    private lazy var pauseNumberLabel: UILabel = {
        let numberLabel = UILabel()
        
        numberLabel.text = NSString(format: "%0.2d:%0.2d", pauseDurationTimerMinutes, pauseDurationTimerSecond) as String
        numberLabel.font = .systemFont(ofSize: 50)
        numberLabel.textColor = Color.pink.color
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        return numberLabel
    }()
    
    //MARK: metods
    
    @objc func workButtonIsPressed(sander: UIButton) {
        
        if isPrased {
            workPlayButton.setBackgroundImage(UIImage(named: "play"), for: .normal)
            isPrased = false
            isStarted = false
            workTimer.invalidate()
        } else {
            workPlayButton.setBackgroundImage(UIImage(named: "pause2"), for: .normal)
            isPrased = true
            isStarted = true
        }
        if isStarted {
            workTimer = Timer.scheduledTimer(timeInterval: 1,
                                             target: self,
                                             selector: #selector(timerWork),
                                             userInfo: nil,
                                             repeats: true)
        }
    }
    
    @objc func pauseButtonIsPressed(sander: UIButton) {
        
        if isPrased {
            pauseButton.setBackgroundImage(UIImage(named: "play2"), for: .normal)
            isPrased = false
            isStarted = false
            pauseTimer.invalidate()
        } else {
            pauseButton.setBackgroundImage(UIImage(named: "pause"), for: .normal)
            isPrased = true
            isStarted = true
        }
        
        if  isStarted {
            pauseTimer = Timer.scheduledTimer(timeInterval: 1,
                                              target: self,
                                              selector: #selector(timerPause),
                                              userInfo: nil,
                                              repeats: true)
        }
    }
    
    @objc func timerWork() {
        
        if durationTimerSecond == 0 {
            durationTimerMinutes -= 1
            durationTimerSecond = 60
        }
        
        if durationTimerMinutes == 0 {
            durationTimerSecond -= 1
            workNumberLabel.text = NSString(format: "%0.2d:%0.2d", durationTimerMinutes, durationTimerSecond) as String
        } else {
            durationTimerSecond -= 1
            workNumberLabel.text = NSString(format: "%0.2d:%0.2d", durationTimerMinutes, durationTimerSecond) as String
        }
        
        if durationTimerMinutes == 0 && durationTimerSecond == 0  {
            isWorkTime.toggle()
            addHierarchy()
            addConstrates()
            durationTimerMinutes = TimerWork.minutes.rawValue
            durationTimerSecond = TimerWork.second.rawValue
            pauseNumberLabel.text = NSString(format: "%0.2d:%0.2d", pauseDurationTimerMinutes, pauseDurationTimerSecond) as String
            workTimer.invalidate()
            pauseButton.setBackgroundImage(UIImage(named: "play2"), for: .normal)
            isStarted = false
            isPrased = false
        }
    }
    
    @objc func timerPause() {
        
        if pauseDurationTimerSecond == 0 {
            pauseDurationTimerMinutes -= 1
            pauseDurationTimerSecond = 60
        }
        
        if pauseDurationTimerMinutes == 0 {
            pauseDurationTimerSecond -= 1
            pauseNumberLabel.text = NSString(format: "%0.2d:%0.2d", pauseDurationTimerMinutes, pauseDurationTimerSecond) as String
        } else {
            pauseDurationTimerSecond -= 1
            pauseNumberLabel.text = NSString(format: "%0.2d:%0.2d", pauseDurationTimerMinutes, pauseDurationTimerSecond) as String
        }
        
        if pauseDurationTimerMinutes == 0 && pauseDurationTimerSecond == 0 {
            pauseTimer.invalidate()
            isWorkTime.toggle()
            pauseDurationTimerMinutes = TimerRest.minutes.rawValue
            pauseDurationTimerSecond = TimerRest.second.rawValue
            workNumberLabel.text = NSString(format: "%0.2d:%0.2d", durationTimerMinutes, durationTimerSecond) as String
            viewDidLoad()
            workPlayButton.setBackgroundImage(UIImage(named: "play"), for: .normal)
            isStarted = false
            isPrased = false
        }
    }
    
    private func addHierarchy() {
        
        if isWorkTime {
            view.addSubview(workCircleImageView)
            view.addSubview(workPlayButton)
            view.addSubview(workNumberLabel)
            view.addSubview(workCircleLitleImageView)
        } else {
            view.addSubview(pauseCircleImageView)
            view.addSubview(pauseButton)
            view.addSubview(pauseNumberLabel)
            view.addSubview(pauseCircleLitleImageView)
        }
    }
    
    //MARK: constrates
    
    private func addConstrates() {
        
        if isWorkTime {
            NSLayoutConstraint.activate([
                workCircleImageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
                workCircleImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                workCircleImageView.heightAnchor.constraint(equalToConstant: 250),
                workCircleImageView.widthAnchor.constraint(equalToConstant: 250)
            ])
            
            NSLayoutConstraint.activate([
                workPlayButton.bottomAnchor.constraint(equalTo: workCircleImageView.bottomAnchor, constant: -50),
                workPlayButton.centerXAnchor.constraint(equalTo: workCircleImageView.centerXAnchor),
                workPlayButton.heightAnchor.constraint(equalToConstant: 40),
                workPlayButton.widthAnchor.constraint(equalToConstant: 40)
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
            
        } else {
        
            NSLayoutConstraint.activate([
                pauseCircleImageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
                pauseCircleImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                pauseCircleImageView.heightAnchor.constraint(equalToConstant: 250),
                pauseCircleImageView.widthAnchor.constraint(equalToConstant: 250)
            ])
            
            NSLayoutConstraint.activate([
                pauseButton.bottomAnchor.constraint(equalTo: pauseCircleImageView.bottomAnchor, constant: -50),
                pauseButton.centerXAnchor.constraint(equalTo: pauseCircleImageView.centerXAnchor),
                pauseButton.heightAnchor.constraint(equalToConstant: 40),
                pauseButton.widthAnchor.constraint(equalToConstant: 40)
            ])
            
            NSLayoutConstraint.activate([
                pauseNumberLabel.topAnchor.constraint(equalTo: pauseCircleImageView.topAnchor, constant: 40),
                pauseNumberLabel.centerXAnchor.constraint(equalTo: pauseCircleImageView.centerXAnchor),
                pauseNumberLabel.heightAnchor.constraint(equalToConstant: 70)
            ])
            
            NSLayoutConstraint.activate([
                pauseCircleLitleImageView.centerYAnchor.constraint(equalTo: pauseCircleImageView.topAnchor, constant: 3),
                pauseCircleLitleImageView.centerXAnchor.constraint(equalTo: pauseCircleImageView.centerXAnchor),
                pauseCircleLitleImageView.heightAnchor.constraint(equalToConstant: 30),
                pauseCircleLitleImageView.widthAnchor.constraint(equalToConstant: 30)
            ])
        }
    }
    
    //MARK: enums
    
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
    
    enum TimerWork: Int {
        case minutes = 25
        case second = 00
    }
    
    enum TimerRest: Int {
        case minutes = 05
        case second = 00
    }
    
}

