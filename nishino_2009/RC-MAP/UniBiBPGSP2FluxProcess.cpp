#include "libecs.hpp"
#include "Util.hpp"
#include "PropertyInterface.hpp"

#include "System.hpp"

#include "ContinuousProcess.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( UniBiBPGSP2FluxProcess, ContinuousProcess )
{

 public:

  LIBECS_DM_OBJECT( UniBiBPGSP2FluxProcess, Process )
    {
      INHERIT_PROPERTIES( Process );

      PROPERTYSLOT_SET_GET( Real, k3 );
    }

  SIMPLE_SET_GET_METHOD( Real, k3 );

  virtual void initialize()
  {
    Process::initialize();

    S0 = getVariableReference( "S0" );
    E0 = getVariableReference( "E0" );
    E1 = getVariableReference( "E1" );
    
    theK3 = k3 * ( ( 1 + pow( pow( 10, -7.2 ) / pow( 10, -7.17 ), 4 ) ) /
		   ( 1 + pow( pow( 10, -1 * E0.getValue() ) / pow( 10, -7.17 ), 4 ) ) );
  
  }  
  
  virtual void fire()
  {
    Real velocity = theK3 * S0.getMolarConc();

    velocity = velocity * getSuperSystem()->getSize() * N_A;

    velocity = velocity * E1.getValue() / 1000;

    setFlux( velocity );

  }

 protected:

  Real theK3;

  VariableReference S0;
  VariableReference E0;
  VariableReference E1;

  Real k3;

};

LIBECS_DM_INIT( UniBiBPGSP2FluxProcess, Process );
