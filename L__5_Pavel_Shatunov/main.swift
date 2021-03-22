//
//  main.swift
//  L__5_Pavel_Shatunov
//
//  Created by Павел Шатунов on 22.03.2021.
//

import Foundation

//MARK: -enums
enum EngineState: String {
    case on = "запущен"
    case off = "заглушен"
}

enum WindowsState: String {
    case open = "открыты"
    case close = "закрыты"
}

enum Turbo: String {
    case on = "включен"
    case off = "выключен"
}

//MARK: -protocol & extension
protocol CarInitiable {
    var carWeight: Double {get}
    var engineState: EngineState {get set}
    var windowsState: WindowsState {get set}
}

extension CarInitiable {
    mutating func openWindow() {
        windowsState = .open
    }
    mutating func closeWindow() {
        windowsState = .close
    }
    mutating func startEngine() {
        engineState = .on
    }
    mutating func stopEngine() {
        engineState = .off
    }
}

//MARK:-classes
class SportCar: CarInitiable {
    var carWeight: Double
    var engineState: EngineState
    let brand: String
    var windowsState: WindowsState
    var turboMode: Turbo
    init(carWeight: Double, engineState: EngineState, brand: String, windowsState: WindowsState, turboMode: Turbo) {
        self.carWeight = carWeight
        self.engineState = engineState
        self.brand = brand
        self.windowsState = windowsState
        self.turboMode = turboMode
    }
    func switchTurbo(to: Turbo) {
        turboMode = to
    }
}

class TunkCar: CarInitiable {
    var carWeight: Double
    var engineState: EngineState
    let brand: String
    var windowsState: WindowsState
    var tunkVolume: Double
    init(carWeight: Double, engineState: EngineState, brand: String, windowsState: WindowsState, tunkVolume: Double) {
        self.carWeight = carWeight
        self.engineState = engineState
        self.brand = brand
        self.windowsState = windowsState
        self.tunkVolume = tunkVolume
    }
    func drainTunk() {
        tunkVolume = 0.0
    }
}

//MARK: -extensions for classes

extension SportCar: CustomStringConvertible{
    var description: String {
        return "Марка автомобиля \(brand), вес авто \(carWeight), состояние двигателя \(engineState.rawValue), состояние окон \(windowsState.rawValue), турбо режим \(turboMode.rawValue)"
    }
}

extension TunkCar: CustomStringConvertible {
    var description: String {
        return "Марка автомобиля \(brand), вес авто \(carWeight), состояние двигателя \(engineState.rawValue), состояние окон \(windowsState.rawValue), объем цистерны \(tunkVolume)"
    }
}

//MARK: -instances


var car = SportCar(carWeight: 1200, engineState: .on, brand: "Mazda", windowsState: .open, turboMode: .on)
car.switchTurbo(to: .off)
car.stopEngine()
car.closeWindow()
print(car.description)
print("==========================")

var tunkCar = TunkCar(carWeight: 5750, engineState: .off, brand: "IVECO", windowsState: .close, tunkVolume: 3000)
tunkCar.drainTunk()
tunkCar.startEngine()
tunkCar.openWindow()
print(tunkCar.description)

