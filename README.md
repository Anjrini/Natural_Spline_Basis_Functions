# Natural_Spline_Basis_Functions

This script calculates the basis functions of the a natural spline. The advantage to cubic splines is that we have a linear approximation at the boundaris leading to more knots namley 4 more knots. Having added these 4 additional knots, we will get the same degrees of freedom of that in cubic splines. Thus more knots but same degrees of freedom. How beautiful!

The values needed to be supplies to the function ist:
- x: a vector of the variable
- knots: the location of the knots to be considered

The function returns a matrix of the basis functions to be used to regressions.

At the end of the code I have added a comparison between my implementation and that of R called "ns" using the library Splines.

Should you have any query, please contact me.

Best Regards,
Mustafa Anjrini on 06.09.2024
