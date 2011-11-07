#include "libecs.hpp"
#include "Util.hpp"
#include "PropertyInterface.hpp"

#include "System.hpp"

#include "ContinuousProcess.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( BiUniPortableBindingProcess, ContinuousProcess )
{

 public:

  LIBECS_DM_OBJECT( BiUniPortableBindingProcess, Process )
    {
      INHERIT_PROPERTIES( Process );

      PROPERTYSLOT_SET_GET( Real, Kma );
      PROPERTYSLOT_SET_GET( Real, Kmd );
    }

  SIMPLE_SET_GET_METHOD( Real, Kma );
  SIMPLE_SET_GET_METHOD( Real, Kmd );

  virtual void initialize()
  {
    Process::initialize();

    S0 = getVariableReference( "S0" );
    S1 = getVariableReference( "S1" );
    P0 = getVariableReference( "P0" );
    E0 = getVariableReference( "E0" );
    E1 = getVariableReference( "E1" );
    E2 = getVariableReference( "E2" );

  }  
  
  virtual void fire()
  {

    Real velocity = Kma * S0.getMolarConc() * S1.getMolarConc() * E0.getValue()-
      Kmd * P0.getMolarConc()*E1.getValue();

    velocity = velocity * getSuperSystem()->getSize() * N_A;

    velocity = velocity * E2.getValue() / 1000;

    setFlux( velocity );

  }

 protected:

  VariableReference S0;
  VariableReference S1;
  VariableReference P0;
  VariableReference E0;
  VariableReference E1;
  VariableReference E2;

  Real Kma;
  Real Kmd;

};

LIBECS_DM_INIT( BiUniPortableBindingProcess, Process );
