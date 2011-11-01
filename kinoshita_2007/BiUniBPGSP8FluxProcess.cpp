#include "libecs.hpp"
#include "Util.hpp"
#include "PropertyInterface.hpp"

#include "System.hpp"

#include "ContinuousProcess.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( BiUniBPGSP8FluxProcess, ContinuousProcess )
{

 public:

  LIBECS_DM_OBJECT( BiUniBPGSP8FluxProcess, Process )
    {
      INHERIT_PROPERTIES( Process );

      PROPERTYSLOT_SET_GET( Real, k14 );
      PROPERTYSLOT_SET_GET( Real, k15 );
    }

  SIMPLE_SET_GET_METHOD( Real, k14 );
  SIMPLE_SET_GET_METHOD( Real, k15 );

  virtual void initialize()
  {
    Process::initialize();

    S0 = getVariableReference( "S0" );
    S1 = getVariableReference( "S1" );
    P0 = getVariableReference( "P0" );
    
  }  
  
  virtual void fire()
  {
    Real velocity = k14 * S0.getMolarConc() * S1.getMolarConc() - k15 * P0.getMolarConc();

    velocity = velocity * getSuperSystem()->getSize() * N_A;

    setFlux( velocity );

  }

 protected:

  VariableReference S0;
  VariableReference S1;
  VariableReference P0;

  Real k14;
  Real k15;

};

LIBECS_DM_INIT( BiUniBPGSP8FluxProcess, Process );
