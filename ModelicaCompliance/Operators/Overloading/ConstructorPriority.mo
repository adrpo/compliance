within ModelicaCompliance.Operators.Overloading;

model ConstructorPriority
  extends Icons.TestCase;

  encapsulated package P
    operator record _Complex_
      Integer re = 1;
      Integer im;

      encapsulated operator 'constructor'
        import ModelicaCompliance.Operators.Overloading.ConstructorPriority.P._Complex_;

        function con1
          input Integer i1;
          output _Complex_ o1(re=2, im=i1);
        algorithm 
        end con1;

      end 'constructor';

    end _Complex_;
  end P;

  import ModelicaCompliance.Operators.Overloading.ConstructorPriority.P._Complex_;

  _Complex_ a = _Complex_(1);
equation
  assert(a.re == 2, "Overloaded constructor should shadow automatically generated constructor.");

  annotation (
    __ModelicaAssociation(TestCase(shouldPass = true, section = {"14.2"})),
    experiment(StopTime = 0.01),
    Documentation(
      info = "<html> Tests whether overloaded constructors properly shadow automatically generated ones on overload resolution.</html>"));
end ConstructorPriority;
