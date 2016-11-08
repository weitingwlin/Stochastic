# Notes for the class Stochastic process in biology

# m-files (matlab scripts)

### set working enviornment
* **work\_setup.m** : set machine-specific working directory 

### class notes & practice
* **note\_week\_2\_1.m**: simulate Poisson events, plot on a time line
* **note\_week\_3\_2.m**: logistic equation, ODE and Gillespie simulation 
* **note\_week\_5\_1.m**: Simulating SIR model; cobwebbing to get q*
 
### homework 
* **HW1\_2\_Lin.m**: example of explosive dynamics.
* **HW1\_3\_1\_Lin.m**: simulating chemical reaction with Gillespie method. Plot stationary distributions.
* **HW1\_3\_2\_Lin.m**: explore the effect of initial values.
* **HW1\_4\_Lin.m**: tau-leaping with Poisson or normal approximation
* **HW1\_5\_Lin.m**: Birth-death-immigration model. 

### functions
* **BDIGillespie.m**: Gillespie simulation of the Birth-death-immigration model. (used in **HW1\_5\_Lin.m**)
* **BDIODE.m**: ODE of the Birth-death-immigration model. (used in **HW1\_5\_Lin.m**)
* **chemGillespie.m**: simulating chemical reaction. (used in **HW1\_3\_1\_Lin.m**)
* **explodGillespie.m**:  Gillespie simulation of an "explosive" system. (used in **HW1\_2\_Lin.m**)
* **logisticGillespie.m**:  Gillespie simulation of logistic growth. (used in **note\_week\_3\_2.m** and **HW1\_5\_Lin.m**)
* **logisticODE.m**:  ODE of logistic growth. (used in **note\_week\_3\_2.m** and **HW1\_5\_Lin.m**)
* **SIRGillespie**: Gillespie simulation of SIR mode. (used in **note\_week\_5\_1.m** )
  
# Utility (everything else)

#### The documents of the [plotting functions can be found here](https://github.com/weitingwlin/matlabutility/tree/master/mfiles).


* **fixsample** : re-sample the original time-population data to create sample at user-assigned time points. 
* **hline.m** : make horizontal line
* **mycolor.m** : select color 
* **myplot.m** : make pretty plots
* **myplot\_vec.m** : plot vector
* [**myplot_point**](https://github.com/weitingwlin/matlabutility/blob/master/documents/myplot_point.md) : Plotting point process on a time line
*  [**mystackbar.m**](https://github.com/weitingwlin/matlabutility/blob/master/documents/mystackbar.md) : Make a single stacked bar graph
*  **mystairs.m**: Costomized stair plot
* **mystyle.m** : select style
* [**mysubplot**](https://github.com/weitingwlin/matlabutility/blob/master/documents/mysubplot.md)   : make subplot with major title
* **name2str.m** : return parameter name
* **para2str.m** : return string(s) with parameter name and value.
* **vline.m** : make vertical line

# markdown\_ and\_pdfs

# resources and links

### LaTeX
* [Online LaTeX equation maker](https://www.codecogs.com/latex/eqneditor.php)
* [sharelatex](https://www.sharelatex.com/)
* [LaTeX/Mathematics](https://en.wikibooks.org/wiki/LaTeX/Mathematics)
* [Heaviside function](http://tex.stackexchange.com/questions/14984/how-to-define-the-heaviside-function-in-latex)
* [Special characters in text](https://en.wikibooks.org/wiki/LaTeX/Special_Characters)

### Math
* [Differential equations note](http://tutorial.math.lamar.edu/Classes/DE/Linear.aspx)
* [Laplace Transformation](http://tutorial.math.lamar.edu/Classes/DE/LaplaceIntro.aspx)
* [Summation formula](http://homepages.gac.edu/~holte/courses/mcs256/documents/summation/top10sums.pdf)
* [Trigonometry](http://math.stackexchange.com/questions/1367487/prove-that-sin-x-2t-1t2-and-cos-x-1-t2-1t2-t-tanx-2)
* [Trigonometry (in Chinese)](http://baike.baidu.com/view/959840.htm)
* [Derivative of Trigonometry](http://www.math.brown.edu/utra/trigderivs.html)
* [Dirac delta function (video on Khan Academy)](https://www.khanacademy.org/math/differential-equations/laplace-transform/properties-of-laplace-transform/v/dirac-delta-function)
* [Integral of Dirac delta function](http://tutorial.math.lamar.edu/Classes/DE/DiracDeltaFunction.aspx)
* [Taylor series](http://tutorial.math.lamar.edu/Classes/CalcII/TaylorSeries.aspx)
* [error function](http://mathworld.wolfram.com/Erf.html)
* [OU process as AR](http://math.stackexchange.com/questions/345773/how-the-ornstein-uhlenbeck-process-can-be-considered-as-the-continuous-time-anal)