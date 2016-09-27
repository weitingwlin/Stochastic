# Notes for the class Stochastic process in biology

# m-files (matlab scripts)

### set workingenviornment
* **work\_setup.m** : set machine-specific working directory 

### class notes & practice
* **note\_week\_2\_1.m**: simulate Poisson events, plot on a time line
* **note\_week\_3\_2.m**: logistic equation, ODE and Gillespie simulation 
 
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
  
# Utility (everything else)

#### The documents of the [plotting functions can be found here](https://github.com/weitingwlin/matlabutility/tree/master/mfiles).


* **fixsample** : re-sample the original time-population data to create sample at user-assigned time points. 
* **hline.m** : make horizontal line
* **mycolor.m** : select color 
* **myplot.m** : make pretty plots
* **mystyle.m** : select style
* **mysubplot.m** : make subplot with major title
* **vline.m** : make vertical line

# markdown\_ and\_pdfs

# resources and links
* [Online LaTeX equation maker](https://www.codecogs.com/latex/eqneditor.php)
* [sharelatex](https://www.sharelatex.com/)
* [Differential equations note](http://tutorial.math.lamar.edu/Classes/DE/Linear.aspx)

