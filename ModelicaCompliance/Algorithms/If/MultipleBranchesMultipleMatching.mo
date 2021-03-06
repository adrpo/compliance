within ModelicaCompliance.Algorithms.If;

model MultipleBranchesMultipleMatching
  extends Icons.TestCase;

  Real x;
  parameter Integer i = 4;
algorithm
  if i == 4 then
    x := 3.0;
  elseif i < 5 then
    x := 4.0;
  elseif i <> 5 then
    x := 5.0;
  end if;

  assert(Util.compareReal(x, 3.0), "x was not set correctly.");

  annotation (
    __ModelicaAssociation(TestCase(shouldPass = true, section = {"11.2.6"})),
    experiment(StopTime = 0.01),
    Documentation(
      info = "<html>Tests an if-statement with multiple branches, where multiple
        conditions evaluate to true but only the first branch should be selected.</html>"));
end MultipleBranchesMultipleMatching;
