//
//  ViewController.swift
//  Increment_Decrement
//
//  Created by Amusan, Ifeoluwa (Graduate - Software) on 14/08/2018.
//  Copyright © 2018 Amusan, Ifeoluwa (Graduate - Software). All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var labelCurrentCount: UILabel!
    
    // Alert to be presented to the user when they attempt to decrement below zero
    let alert = UIAlertController(title: "Alert", message: "Cannot go below 0", preferredStyle: UIAlertControllerStyle.alert)
    
    // Keeps current count
    var currentCount = 0
    {
        didSet
        {
            // Don't let the current count go below zero
            currentCount = (currentCount < 0) ? 0 : currentCount
        }
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let actionDismiss = UIAlertAction(title: "Ok, now go away", style: UIAlertActionStyle.default, handler: { _ in
            print("Alert Dismissed")
        })
        
        // The text that goes on the user action button
        alert.addAction(actionDismiss)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonIncrement(_ sender: UIButton)
    {
        currentCount += 1
        labelCurrentCount.text = String(currentCount)
    }
    
    @IBAction func buttonDecrements(_ sender: UIButton)
    {
        currentCount -= 1
        labelCurrentCount.text = String(currentCount)
    
        if (currentCount<=0)
        {
            // Show the alert
            //self.present(alert, animated: true, completion: nil)
        }
        let sentence_1 : String = "How to ride a horse and how to cook a rabbit"
        let sentence_2 : String = "This is is ball"
        let sentence_3 : String = "While working on the things we need to do to consider our app as (Ready) I noticed a lot of the bullet points were too broad (maybe by design) and could be applied to absolutely any project made by any other team. So I am wondering why doesn’t sky have a standard for this so that each team knows that “okey to consider this project as 'ready' we need to fulfil these requirements?"
        
        print(ViewController.getMostCommonWords(sentence_3.components(separatedBy: " ")))
        
    }
    
    /**
     Gets the most common words in an array
    */
    static func getMostCommonWords(_ wordArray:[String] ) -> [(String,Int)]
    {
        var distinctWords : [String] = [String]()
        var wordsInOrderOfCommonality : [(String,Int)] = []
        
        var dictOfWordsAndTheirFrequency : Dictionary = [String: Int]()
   
        for word in wordArray
        {
            /* Get the distinct words to use as the key in the dictionary.
             * If the word does not already exist then add it.
             */
            if (!distinctWords.contains(word))
            {
                distinctWords.append(word.lowercased())
            }
        }
        
        for word in distinctWords
        {
//            Make sure the key is not used more than once
            if(!dictOfWordsAndTheirFrequency.keys.contains(word))
            {
                dictOfWordsAndTheirFrequency[word] = ViewController.countWordInArray(arrayToIterateOver: wordArray, wordToFindAndCount: word)
            }
        }
        
//        print("Word frequencies \(dictOfWordsAndTheirFrequency)")
//        print("\nDistinct words \(distinctWords) ")
//        print("\n\(ViewController.sortWordsInOrderOfFrequency(dictOfWords: dictOfWordsAndTheirFrequency))" )
        
        wordsInOrderOfCommonality = ViewController.sortWordsInOrderOfFrequency(dictOfWords: dictOfWordsAndTheirFrequency)
        
        return wordsInOrderOfCommonality
    }
    
    static func sortWordsInOrderOfFrequency(dictOfWords:[String:Int]) -> [(String,Int)]
    {
        var array = [(name: String, value: Int)]()
        for (key, value) in dictOfWords
        {
            array.append((name: key, value: value))
        }
        return array.sorted(by: {$0.value > $1.value})
    }
    
    /**
     * Returns how many times a word appears in an array of strings
     */
    static func countWordInArray(arrayToIterateOver:[String], wordToFindAndCount:String) -> Int
    {
        var count : Int = 0
        
        for word in arrayToIterateOver
        {
            count = (word.lowercased() == wordToFindAndCount.lowercased()) ? count+1: count
        }
        
        return count
    }
    
    //THIS FUNCTION IS NOT IN USE
    static func sortDictByValue(dictToSort:[String : Int]) -> [String : Int]
    {
        var isolatedValues : [Int] = []
        var isolatedKeys : [String] = []
        var sortedDict : [String:Int] = [:]
        
        for (key, value) in dictToSort
        {
            isolatedKeys.append(key)
            isolatedValues.append(value)
        }
        
//        print("keys -> \(isolatedKeys)")
//        print("values -> \(isolatedValues)")
        
        var sorted : Bool = false
        while !sorted
        {
            sorted = true
            for index in 0..<isolatedValues.count//isolatedValues
            {
                if(index<isolatedValues.count-1)
                {
                    if (isolatedValues[index+1] > isolatedValues[index])
                    {
                        sorted = false
                        var temp:Int
                        var tempKey : String
                        temp = isolatedValues[index]
                        tempKey = isolatedKeys[index]
                        //print("temp = \(temp)")
                        isolatedValues[index] = isolatedValues[index+1]
                        isolatedKeys[index] = isolatedKeys[index+1]
                        
                        isolatedValues[index+1] = temp
                        isolatedKeys[index+1] = tempKey
                        
                        //print("swapped")
                    }
                }
                
            }
            
        }
        
//        print("Sorted values -> \(isolatedValues)")
//        print("isolated keys -> \(isolatedKeys)")
        
        return sortedDict
    }
    
    
}

