//
//  ViewController.swift
//  temporizador de huevo cocido
//
//  Created by Victor Tejeda on 3/9/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    // estos codigos a continuacion sonDicionarios
    
    //forma actual
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]// coordenadas de segundos que le damos a nuestros eegTimer para para que cada boton tenga una ejecucuin diferente
    var secondsRemaining = 60 // variable para poder facer la funcion de que pueda simular esto como segundos
    var player: AVAudioPlayer?
    var timer = Timer()// aqui es la variable para el titulo de listo
    var totalTime = 0
    var secondsPasssed = 0
    
    // forma antigua
    /*let solfTime = 5
    let mediumTime = 7
    let hardTime = 12
    */
    @IBAction func hardnessSelected(_ sender: UIButton) {// aqui llamos a los tres botones y es decir es donde el usario selecciona la dureza diferente.
        
        //progressBar.progress = 1.0
        timer.invalidate()// convalidamos el texto primcipal para que cuando acabe se presente y diga ya estan o ya estan listo
        
        let hardness = sender.currentTitle! // esta es una cadena tipo de dato opccional que nos permite imprimir el la constante en nuestro terminal
        totalTime = eggTimes[hardness]!// Aqui se vbaza en la dureza que elegido
        
        progressBar.progress = 0.0
        secondsPasssed = 0
        titleLabel.text = hardness
        
        
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updataTimer), userInfo: nil, repeats: true)// este es nuestro temporizador el cual lo eh programdo a 1.0 segundo
        
        
        
        
    }
    
       @objc func updataTimer() { // aqui llame una funcion el cual esta llamdo atrabez del temporizador que creamos arriba
            if secondsPasssed < totalTime { // ordenes de que cuando llegue al numero 0  para la cuenta y no siga con el siguiente
                //print("\(secondsRemaining)second.") // ya sabes esyo es pra imprimer en el terminal que secondsRsmaining es Segundo
                secondsPasssed += 1 //aqui use mi variable para ponder indicarle que el tiempo acordado del 0  cera igual a 1 pero le quite el memos y cambien secondsRemaining y puse el que esta para que sea de de cero de 1 a 1
                progressBar.progress = Float(secondsPasssed) / Float(totalTime)
                print(Float(secondsPasssed) / Float(totalTime))
                
              
               
                
            } else { // aqui es cuando llegue a su destino que haga estas funciones, ya saben que cuando no llegue a cero el dice ya esta listo
                timer.invalidate()
                titleLabel.text = "Ya estan Listo"
                //este es el odigo que activa el sonido de la alarma pense que era con numero busque mucho en youtube...
                let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")//
                player = try! AVAudioPlayer(contentsOf: url!)
                player?.play()
            }
        }
        
        //let result = eggTimes[hardness]!
        //print(result)
    }
    

        
        // forma antigua de hacer el mandato.
        /*if hardness == "Solf" {
            print(solfTime)
        } else if hardness == "Medium" {
            print(mediumTime)
        } else {
            print(hardTime)
        }
         
        // la tradicionar
        switch hardness {
        case "Solf":
            print(solfTime)
        case "Medium":
            print(mediumTime)
        case "Hard":
            print(hardTime)
        default:
            print("Ërror  ")
            updateValue
         
        }
    }

*/

