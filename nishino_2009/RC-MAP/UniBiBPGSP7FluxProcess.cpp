#include "libecs.hpp"
#include "Util.hpp"
#include "PropertyInterface.hpp"

#include "System.hpp"

#include "ContinuousProcess.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( UniBiBPGSP7FluxProcess, ContinuousProcess )
{

 public:

  LIBECS_DM_OBJECT( UniBiBPGSP7FluxProcess, Process )
    {
      INHERIT_PROPERTIES( Process );

      PROPERTYSLOT_SET_GET( Real, k12 );
      PROPERTYSLOT_SET_GET( Real, k13 );
    }


  SIMPLE_SET_GET_METHOD( Real, k12 );
  SIMPLE_SET_GET_METHOD( Real, k13 );

  virtual void initialize()
  {
    Process::initialize();

    S0 = getVariableReference( "S0" );
    P0 = getVariableReference( "P0" );
    P1 = getVariableReference( "P1" );
    E0 = getVariableReference( "E0" );
    E1 = getVariableReference( "E1" );
    
    theK13 = k13 * ( ( 1 + pow( 10, -6.8 ) / pow( 10, -7.20 ) ) /
		     ( 1 + pow( 10, -6.8 ) / pow( 10, -1 * E0.getValue() ) ) );
  
  }  
  
  virtual void fire()
  {
    Real velocity = k12 * S0.getMolarConc() - theK13 * P0.getMolarConc() * P1.getMolarConc();

    velocity = velocity * getSuperSystem()->getSize() * N_A;

    velocity = velocity * E1.getValue() / 1000;

    setFlux( velocity );

  }

 protected:

  Real theK13;

  VariableReference S0;
  VariableReference P0;
  VariableReference P1;
  VariableReference E0;
  VariableReference E1;

  Real k12;
  Real k13;

};

LIBECS_DM_INIT( UniBiBPGSP7FluxProcess, Process );
