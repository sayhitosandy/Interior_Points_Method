# Interior Points Method
Implementation of Interior Points Method in MATLAB (My Assignment in Linear Optimization course [MTH305]  [IIIT-Delhi]).

Further, we solved the following Linear Problem:
```
min   1'u + 1'v
st. 
      a'xi + b >=  1 - ui      i=1..N
      a'yj + b <= -1 + vj      j=1..M
      u >= 0
      v >= 0

```
We were provided with:
1. `DB_Vecs.npy` (Sequence vectors for training)
2. `DB_Labels.npy` (corresponding labels)
3. `Q_Vecs.npy` (Test sequences)

Converted these into Matrix file - [data.mat](https://github.com/sayhitosandy/Interior_Points_Method/blob/master/Input/data.mat). 

We were to submit the results (Labels for `Q_vecs`) as list/numpy array. Here, the output is in Matrix file - [uk.mat](https://github.com/sayhitosandy/Interior_Points_Method/tree/master/Code/uk.mat).


**References**
1. Video Resources:
	* https://www.youtube.com/watch?v=oMRVDILkpUI - Stephen Boyd, Lecture 18, Convex Opt (discusses Barrier methods).
	* https://www.youtube.com/watch?v=StlHUwd_AgM - Stephen Boyd, Lecture 18, Convex Opt (discusses Newtons method).
	* https://www.youtube.com/watch?v=4mpq-wsYBxw - MIT Lecture on IP method (different perspective).

2. Text Resources:
	* From Stephen Boyd's book, see Chapters, 10 and 11 to 11.3
	* Specially relevant for the programming assignment are the following sections: 10.3 and 10.4

3. Proof of convergence:
	* https://simons.berkeley.edu/sites/default/files/docs/6912/steve-simons-intpt.pdf
	* http://www.seas.ucla.edu/~vandenbe/ee236a/lectures/mpc.pdf

4. Advanced: https://www.youtube.com/watch?v=7CMWdO5dgdQ
