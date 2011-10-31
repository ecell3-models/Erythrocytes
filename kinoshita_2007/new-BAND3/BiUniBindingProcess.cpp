#include "libecs.hpp"
#include "Util.hpp"
#include "PropertyInterface.hpp"

#include "System.hpp"

#include "ContinuousProcess.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( BiUniBindingProcess, ContinuousProcess )
{

 public:

  LIBECS_DM_OBJECT( BiUniBindingProcess, Process )
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

  }  
  
  virtual void fire()
  {

    Real velocity = Kma * S0.getMolarConc() * S1.getMolarConc() -
      Kmd * P0.getMolarConc();

    velocity = velocity * getSuperSystem()->getSize() * N_A;

    setFlux( velocity );

  }

 protected:

  VariableReference S0;
  VariableReference S1;
  VariableReference P0;

  Real Kma;
  Real Kmd;

};

LIBECS_DM_INIT( BiUniBindingProcess, Process );
