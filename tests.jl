### Imports
using Pkg

Pkg.add("QuadGK")
using QuadGK

Pkg.add("ForwardDiff")
using ForwardDiff
include("functions.jl")

### /Imports


# Define your function to integrate, integration interval, and threshold
f(x) = (x - 1)^5 + x^4 - 4*x + 1
# f(x) = x
# f(x) = sin(x)^100
a = 0.0
b = 2.0



result1, error1, n1 = integrate(Trapezoid(), f, a, b, threshold = 1e-15, numIter = 23);
result2, error2, n2 = integrate(Midpoint(), f, a, b, threshold = 1e-15, numIter = 23);
result3, error3, n3 = integrate(Simpson(), f, a, b, threshold = 1e-15, numIter = 22);

println("Approximated Integral using Trapezoid method: ", result1, " with error upper bound: ", error1, " n: ", n1)
println("Approximated Integral using Midpoint method: ", result2, " with error upper bound: ", error2, " n: ", n2)
println("Approximated Integral using Simpson's method: ", result3, " with error upper bound: ", error3, " n: ", n3)

result, error = quadgk(f, a, b);
println("Reference Integral using quadgk: ", result, " with error upper bound: ", error)


result21, error21, n21 = integrate_compare(Trapezoid(), f, a, b, threshold = 1e-15, numIter = 23);
result22, error22, n22 = integrate_compare(Midpoint(), f, a, b, threshold = 1e-15, numIter = 23);
result23, error23, n23 = integrate_compare(Simpson(), f, a, b, threshold = 1e-15, numIter = 22);

println("Approximated Integral using Trapezoid method: ", result21, " with error upper bound: ", error21, " n: ", n21)
println("Approximated Integral using Midpoint method: ", result22, " with error upper bound: ", error22, " n: ", n22)
println("Approximated Integral using Simpson's method: ", result23, " with error upper bound: ", error23, " n: ", n23)


plot_int(Trapezoid(), f, a, b, 10)
plot_int(Midpoint(),f, a, b, 10)
plot_int(Simpson(),f, a, b, 10)


f(x) = sin(x)^100;
a = 0.0;
b = 2.0;

result, error = quadgk(f, a, b);
result1, error1, n1 = integrate(Trapezoid(), f, a, b);
result2, error2, n2 = integrate(Midpoint(), f, a, b);
result3, error3, n3 = integrate(Simpson(), f, a, b);
println("Reference: ", result, " error upper bound: ", error)
println()
println("Aproximace za použití funkce \"integrate()\":")
println()
println("Lichoběžníky: ", result1, " error upper bound: ", error1, " n: ", n1)
println("Obdélníky: ", result2, " error upper bound: ", error2, " n: ", n2)
println("Simpson: ", result3, " error upper bound: ", error3, " n: ", n3)

result21, error21, n21 = integrate_compare(Trapezoid(), f, a, b);
result22, error22, n22 = integrate_compare(Midpoint(), f, a, b);
result23, error23, n23 = integrate_compare(Simpson(), f, a, b);

println()
println("Aproximace za použití funkce \"integrate_compare()\":")
println()
println("Lichoběžníky: ", result21, " error upper bound: ", error21, " n: ", n21)
println("Obdélníky: ", result22, " error upper bound: ", error22, " n: ", n22)
println("Simpson: ", result23, " error upper bound: ", error23, " n: ", n23)