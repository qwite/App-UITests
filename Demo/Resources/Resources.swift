//
//  Resources.swift
//  Demo
//
//  Created by Кирилл on 04.11.2021.
//

import UIKit

enum Resources {
    enum Colors {
        static let white: UIColor! = UIColor(named: "colors.white")
        static let black: UIColor! = UIColor(named: "colors.black")
        
        static let green1: UIColor! = UIColor(named: "colors.green1")
        static let green2: UIColor! = UIColor(named: "colors.green2")
        
        static let blue1: UIColor! = UIColor(named: "colors.blue1")
        static let blue2: UIColor! = UIColor(named: "colors.blue2")
        
        static let orange1: UIColor! = UIColor(named: "colors.orange1")
        static let orange2: UIColor! = UIColor(named: "colors.orange2")
        
        static let purple1: UIColor! = UIColor(named: "colors.purple1")
        static let purple2: UIColor! = UIColor(named: "colors.purple2")
    }
    
    enum Fonts {
        static let heading = UIFont(name: "TTCommons-DemiBold", size: 45)!
        static let text = UIFont(name: "SFProDisplay-Regular", size: 30)!
    }
    
    enum Files {
        static let voiceExample1 = Bundle.current.url(forResource: "voice_example_1", withExtension: "mp3")!
        static let voiceExample2 = Bundle.current.url(forResource: "voice_example_2", withExtension: "mp3")!
        static let voiceExample3 = Bundle.current.url(forResource: "voice_example_3", withExtension: "mp3")!
        static let voiceExample4 = Bundle.current.url(forResource: "voice_example_4", withExtension: "mp3")!
        static let voiceExample5 = Bundle.current.url(forResource: "voice_example_5", withExtension: "mp3")!
        static let voiceExample6 = Bundle.current.url(forResource: "voice_example_6", withExtension: "mp3")!
        static let voiceExample7 = Bundle.current.url(forResource: "voice_example_7", withExtension: "mp3")!
    }
}
