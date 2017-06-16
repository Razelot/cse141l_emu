// Division with easy conversion to assembly
int division(int dividend_arg, char divisor_arg)
{
    int quotient = 0;
    int div_temp = 0;
    int mask = 1;
    int dividend = dividend_arg;
    char divisor = divisor_arg;
    int isNeg = 0;

    // Convert to positive values for computation, set neg flag
    if(dividend < 0)
    {
        dividend = ~dividend + 1;
        isNeg = 1;
    }
    if(divisor < 0)
    {
        divisor = ~divisor + 1;
        isNeg = (isNeg==1) ? 0:1;
    }

    for(int i = 0; i < 16; i++)
    {
        // Shifts div left once and concatenates bit 15-i of dividend
        mask = mask << (15-i);
        int dividend_temp = (mask & dividend) >> (15-i);
        div_temp = (div_temp << 1) + dividend_temp;

        quotient = quotient << 1;
        if(div_temp >= divisor)//16bit >= 8bit
        {
            div_temp = div_temp - divisor;
            quotient += 1;
        }

        // Reset mask
        mask = 1;
    }

    // Convert quotient to negative value depending on flag
    if(isNeg == 1)
    {
        quotient = ~quotient + 1;
    }
    return quotient;
}
