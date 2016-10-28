% ODE for neuron equation
function dndt = neuronODE(t, V)
global VL taum 
dndt= (-1/ taum) * (V - VL) ;