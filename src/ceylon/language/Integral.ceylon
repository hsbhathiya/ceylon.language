"Abstraction of integral numeric types. That is, types 
 with no fractional part, including `Integer`. The 
 division operation for integral numeric types results 
 in a remainder. Therefore, integral numeric types have 
 an operation to determine the remainder of any division 
 operation."
see (`class Integer`)
by ("Gavin")
shared interface Integral<Other> of Other
        satisfies Numeric<Other> & Enumerable<Other>
        given Other satisfies Integral<Other> {

    "The remainder, after dividing this number by the 
     given number."
    see (`function Numeric.divided`)
    shared formal Other remainder(Other other);

    "Determine if the number is zero."
    shared formal Boolean zero;
    
    "Determine if the number is one."
    shared formal Boolean unit;
    
    "Determine if this number is a factor of the given 
     number."
    shared Boolean divides(Other other) =>
            (other%(this of Other)).zero;
    
}