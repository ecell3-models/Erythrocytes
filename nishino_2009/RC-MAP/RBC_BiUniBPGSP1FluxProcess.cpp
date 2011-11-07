#include "libecs.hpp"
#include "Util.hpp"
#include "PropertyInterface.hpp"

#include "System.hpp"

#include "ContinuousProcess.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( RBC_BiUniBPGSP1FluxProcess, ContinuousProcess )
{

 public:

  LIBECS_DM_OBJECT( RBC_BiUniBPGSP1FluxProcess, Process )
    {
      INHERIT_PROPERTIES( Process );

      PROPERTYSLOT_SET_GET( Real, k1 );
      PROPERTYSLOT_SET_GET( Real, k2 );
    }


  SIMPLE_SET_GET_METHOD( Real, k1 );
  SIMPLE_SET_GET_METHOD( Real, k2 );

  virtual void initialize()
  {
    Process::initialize();

    S0 = getVariableReference( "S0" );
    S1 = getVariableReference( "S1" );
    P0 = getVariableReference( "P0" );
    E0 = getVariableReference( "E0" );
    E1 = getVariableReference( "E1" );
    
    theK1 = k1 * ( ( 1 + pow( 10, -6.8 ) / pow( 10, -7.20 ) ) /
		   ( 1 + pow( 10, -6.8 ) / pow( 10, -1 * E0.getValue() ) ) );
  
  }  
  
  virtual void fire()
  {
    Real velocity = theK1 * S0.getMolarConc() * S1.getMolarConc() - k2 * P0.getMolarConc();

    velocity = velocity * getSuperSystem()->getSize() * N_A;

    velocity = velocity * E1.getValue() / 1000;

    setFlux( velocity );

  }

 protected:

  Real theK1;

  VariableReference S0;
  VariableReference S1;
  VariableReference P0;
  VariableReference E0;
  VariableReference E1;

  Real k1;
  Real k2;

};

LIBECS_DM_INIT( RBC_BiUniBPGSP1FluxProcess, Process );
