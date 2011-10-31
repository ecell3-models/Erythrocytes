#include "libecs.hpp"
#include "Util.hpp"
#include "PropertyInterface.hpp"

#include "System.hpp"

#include "ContinuousProcess.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( BiUniBPGSP3FluxProcess, ContinuousProcess )
{

 public:

  LIBECS_DM_OBJECT( BiUniBPGSP3FluxProcess, Process )
    {
      INHERIT_PROPERTIES( Process );

      PROPERTYSLOT_SET_GET( Real, k4 );
      PROPERTYSLOT_SET_GET( Real, k5 );
    }


  SIMPLE_SET_GET_METHOD( Real, k4 );
  SIMPLE_SET_GET_METHOD( Real, k5 );

  virtual void initialize()
  {
    Process::initialize();

    S0 = getVariableReference( "S0" );
    S1 = getVariableReference( "S1" );
    P0 = getVariableReference( "P0" );
    E0 = getVariableReference( "E0" );
    
    theK4 = k4 * ( ( 1 + pow( pow( 10, -7.2 ) / pow( 10, -7.17 ), 4 ) ) /
		   ( 1 + pow( pow( 10, -1 * E0.getValue() ) / pow( 10, -7.17 ), 4 ) ) );
    
  }  
  
  virtual void fire()
  {
    Real velocity = theK4 * S0.getMolarConc() * S1.getMolarConc() - k5 * P0.getMolarConc();

    velocity = velocity * getSuperSystem()->getSize() * N_A;

    setFlux( velocity );

  }

 protected:

  Real theK4;

  VariableReference S0;
  VariableReference S1;
  VariableReference P0;
  VariableReference E0;

  Real k4;
  Real k5;

};

LIBECS_DM_INIT( BiUniBPGSP3FluxProcess, Process );
