#include "libecs.hpp"
#include "Util.hpp"
#include "PropertyInterface.hpp"

#include "System.hpp"

#include "ContinuousProcess.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( BiUniBPGSP4FluxProcess, ContinuousProcess )
{

 public:

  LIBECS_DM_OBJECT( BiUniBPGSP4FluxProcess, Process )
    {
      INHERIT_PROPERTIES( Process );

      PROPERTYSLOT_SET_GET( Real, k6 );
      PROPERTYSLOT_SET_GET( Real, k7 );
    }


  SIMPLE_SET_GET_METHOD( Real, k6 );
  SIMPLE_SET_GET_METHOD( Real, k7 );

  virtual void initialize()
  {
    Process::initialize();

    S0 = getVariableReference( "S0" );
    S1 = getVariableReference( "S1" );
    P0 = getVariableReference( "P0" );
    E0 = getVariableReference( "E0" );
    
    theK6 = k6 * ( ( 1 + pow( pow( 10, -7.2 ) / pow( 10, -7.17 ), 4 ) ) /
		   ( 1 + pow( pow( 10, -1 * E0.getValue() ) / pow( 10, -7.17 ), 4 ) ) );
  
  }  
  
  virtual void fire()
  {
    Real velocity = theK6 * S0.getMolarConc() * S1.getMolarConc() - k7 * P0.getMolarConc();

    velocity = velocity * getSuperSystem()->getSize() * N_A;

    setFlux( velocity );

  }

 protected:

  Real theK6;

  VariableReference S0;
  VariableReference S1;
  VariableReference P0;
  VariableReference E0;

  Real k6;
  Real k7;

};

LIBECS_DM_INIT( BiUniBPGSP4FluxProcess, Process );
