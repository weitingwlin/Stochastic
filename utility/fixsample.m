% A function that "samples" a population at fixed time point
%
function Xsample = fixsample(t, X, tsample, X0)
if nargin < 4
X0 = X(1);
end
% simulate fix time point sample
S = length(tsample);
Xsample = nan(size(tsample));

for s = 1 : S
    trec = tsample(s);
    ID = max(find(t' < trec));
    if isempty(ID)
         Xsample(s) = X0; 
    else
         Xsample(s) = X( ID) ;
    end
end