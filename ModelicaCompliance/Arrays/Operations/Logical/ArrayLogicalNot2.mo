within ModelicaCompliance.Arrays.Operations.Logical;

model ArrayLogicalNot2
  extends Icons.TestCase;
 
  Boolean b[:] = {false, true}; 
  Boolean nb[:,:] = not fill(b, 2);
equation
  assert(nb[1, 1] == true, "The boolean value of nb[1] must be true");
  assert(nb[1, 2] == false, "The boolean value of nb[2] must be false");
  assert(nb[2, 1] == true, "The boolean value of nb[3] must be true");
  assert(nb[2, 2] == false, "The boolean value of nb[4] must be false");
  
  annotation (
    __ModelicaAssociation(TestCase(shouldPass = true, section = {"10.6.11"})),
    experiment(StopTime = 0.01),
    Documentation(
      info = "<html>Tests array logical operator not.</html>"));
end ArrayLogicalNot2;
