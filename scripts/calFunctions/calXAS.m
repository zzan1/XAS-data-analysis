function result = calXAS(I_Array, I0_Array, dark_Array)
    % result = log((I0-dark)/(I1-dark))

    numerator = I0_Array - dark_Array;
    denominator = I_Array - dark_Array;
    result = log10(numerator ./ denominator);

    result = real(result);
end