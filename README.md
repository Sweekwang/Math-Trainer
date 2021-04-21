<p align="center">
  <img src="https://img.shields.io/badge/Maintained%3F-no-red.svg">
  <img src="https://img.shields.io/github/stars/Sweekwang/Math-Trainer">
  
</p>

<p align="center">
  <a href="https://apps.apple.com/sg/app/mental-math-math-trainer/id1538276170">
    <img src="https://github.com/Sweekwang/Math-Trainer/blob/master/Math%20Trainer/Assets.xcassets/AppIcon.appiconset/1024.png?raw=true" alt="Logo" width="120" height="120">
  </a>

  <h3 align="center">Mental Math - Math Trainer</h3>

  <p align="center">
    An iOS Application Built to Train your Mental Sum
    <br />
    <br />
    <img src="https://developer.apple.com/app-store/marketing/guidelines/images/badge-download-on-the-app-store.svg"/>
    <br />
    <a href="https://github.com/othneildrew/Best-README-Template/issues">Report Bug</a>
    ·
    <a href="https://github.com/othneildrew/Best-README-Template/issues">Request Feature</a>
  </p>
</p>

<hr/>

<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with-and-achitecture">Built With and Architecture</a></li>
        <li><a href="#features">Features </a></li>
      </ul>
    </li>
    <li>
      <a href="#plans-and-improvements">Plans and Improvements</a>
    </li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>

<!-- Aboute The project -->
<hr/>

## About The Project
<p align="center">
   <img src = "https://drive.google.com/uc?export=view&id=1-UTaA_AlEdal0EoQSscc9_9c7ANqoAQX"/>
<p/>

This application was created to train a user mental (addition, substraction, division and multiplication) by generating random number of the user choices. 
The main reason I created this application because I am unable to find an application for myself to train my mental divisiona and multiplication for large numbers
because most of the application in the App Store on mental sum was created for children. This App was created for Adult in mind. Thefore, the user interface was 
designed like a calculator instead of the kid / cartoon design.

<!-- Built With and Architecture -->
<br/>

### Built With and Achitecture

This application was built using Swift, UIKit with Storyboard. Admob was used to show banner in this application. The app used Model-View-Controller design pattern. Two models are created MathQuestions.swiftand NumberGenerator.swift. MathQuestions handle all the information about the questions number, type of questions and etc while NumberGenerator is created to generate all randome numbers. Delegation patterns were also used to transfer data. UIView animation is used to create the rounded animation at the result view controller.
  
### Features
Features available in this apps:

1) Five type of Math questions are able to do in this app (addition, subtraction, multiplication, division and mixed).
2) User is able to choose the minimum and maximum number and number of quetions to be generated. (Default values were given if the user did not input any values)
3) Once the user completed a single questions, the previous question is automatically marked and shown in a small text in the screen.
4) Results of all the entry the user done are shown when user completed all the questions.
5) Dark and Light Mode


## Plans and Improvements
Future improvements and features can be implemented to make the application much more better.
1) Use user default to store the basic setting of the app such as storing the previous minimum and maximum number and number of quetions.
2) Keeping a records of all the previous scores and display a statistics or histogram or line graphs to show the history in Core Data or Realm.
3) Store the last entry of the questions for user to view in Core Data or Realm.


## License
MIT License

Copyright (c) [2021] [CHUA SWEE KWANG]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

## Contact
<a href="https://www.linkedin.com/in/chuasweekwang/">Linkedin</a> ·
<a href="https://www.instagram.com/sweekwang/">instagram</a>

<br/>
<br/>
<br/>
<br/>
<p align="center">
   Copyright (c) [2021] [CHUA SWEE KWANG]
<p/>
