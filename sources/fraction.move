module suifuns::fraction {
    struct Fraction has store {
        numerator: u64,
        denominator: u64
    }

    const EZeroDenominator: u64 = 0;

    public fun new(numerator: u64, denominator: u64): Fraction {
        assert!(denominator != 0, EZeroDenominator);

        Fraction {
            numerator,
            denominator
        }
    }

    public fun evaluate(self: &Fraction): u64 {
         self.numerator / self.denominator
    }

    public fun multiply_into(self: &Fraction, value: u64): u64 {
         (self.numerator * value) / self.denominator
    }

    public fun multiply_into_fraction(self: &Fraction, fraction: &Fraction): Fraction {
        Fraction {
            numerator: self.numerator * fraction.numerator,
            denominator: self.denominator * fraction.denominator
        }
    }

    public fun divide_into(self: &Fraction, value: u64): u64 {
         self.numerator / (self.denominator * value)
    }

    public fun divide_into_fraction(self: &Fraction, fraction: &Fraction): Fraction {
        Fraction {
            numerator: self.numerator * fraction.denominator,
            denominator: self.denominator * fraction.numerator
        }
    }

    public fun set_numerator(self: &mut Fraction, value: u64) {
        self.numerator = value;
    }

    public fun set_denominator(self: &mut Fraction, value: u64) {
        assert!(value != 0, EZeroDenominator);
        self.denominator = value;
    }
}